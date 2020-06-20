package at.fhj.ima.kanbancollab.kanbancollab.controller

import at.fhj.ima.kanbancollab.kanbancollab.dto.UserDto
import at.fhj.ima.kanbancollab.kanbancollab.service.UserService
import at.fhj.ima.kanbancollab.kanbancollab.entities.Project
import at.fhj.ima.kanbancollab.kanbancollab.entities.User
import at.fhj.ima.kanbancollab.kanbancollab.entities.Task
import at.fhj.ima.kanbancollab.kanbancollab.repositories.ProjectRepository
import at.fhj.ima.kanbancollab.kanbancollab.repositories.TaskRepository
import at.fhj.ima.kanbancollab.kanbancollab.repositories.UserRepository
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.http.ResponseEntity
import org.springframework.security.authentication.AnonymousAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import javax.validation.Valid


@Controller
class ProjectController(val projectRepository: ProjectRepository,
                        val userRepository: UserRepository,
                        val taskRepository: TaskRepository,
                        val userService: UserService) {


    /** ---------------------------------------------------- Functions ---------------------------------------------- */

    fun findSharedProjects(user: User, allProj: List<Project>): List<Project> {
        val uId = user.userId
        return allProj.filter { it.members.any { it.userId == uId } }
    }


    fun getCurrentUser(): User {
        return userRepository.findByUsername(SecurityContextHolder.getContext().authentication.name)
    }


    /** ---------------------------------------------------- Project ------------------------------------------------ */

    fun showEditProjectView(model: Model): String {
        val usersWithoutOwner = userRepository.findAll().filter { it.userId != getCurrentUser().userId }
        model.set("users", userRepository.findAll())
        model.set("usersWithoutOwner", usersWithoutOwner)
        return "editProject"
    }


    @RequestMapping("/listProjects", method = [RequestMethod.GET])
    fun listProjects(model: Model/*, @RequestParam(required = false) userId: Int?*/): String {
        val allProjects = projectRepository.findAll()
        val sharedProjects = findSharedProjects(getCurrentUser(), allProjects)
        model.set("projects", allProjects)
        model.set("sharedProjects", sharedProjects)
        return "listProjects"
    }


    @RequestMapping("/editProject", method = [RequestMethod.GET])
    fun editProject(model: Model, @RequestParam(required = false) projectId: Int?): String {
        if (projectId != null) {
            val project = projectRepository.findByProjectId(projectId)
            model.set("project", project)
        } else {
            val newProject = Project()
            model.set("project", newProject)
        }
        return showEditProjectView(model)
    }


    @RequestMapping("/changeProject", method = [RequestMethod.POST])
    fun changeProject(@ModelAttribute("project") @Valid project: Project, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return showEditProjectView(model)
        }
        try {
            projectRepository.save(project)
        } catch (dive: DataIntegrityViolationException) {
            throw dive
        }
        return "redirect:/editProject?projectId=" + project.projectId
    }


    @RequestMapping("/deleteProject", method = [RequestMethod.POST])
    fun deleteProject(model: Model, @RequestParam projectId: Int): String {
        val project = projectRepository.findByProjectId(projectId)
        if (getCurrentUser() == project.owner || getCurrentUser().username == "admin") {
            projectRepository.delete(projectRepository.findByProjectId(projectId))
            model.set("message", "Project was deleted")
            return listProjects(model)
        } else {
            model.set("message", "Unable to delete this Project as you are not the owner")
            return listProjects(model)
        }
    }


    @RequestMapping("/viewProject", method = [RequestMethod.GET])
    fun viewProject(model: Model, @RequestParam(required = false) projectId: Int): String {
        val project = projectRepository.findByProjectId(projectId)
        val projectTasks = taskRepository.findTaskByProject(projectId)
        model.set("tasks", projectTasks)
        model.set("project", project)
        return "viewProject"
    }


    /** --------------------------------------------  TASK AREA --------------------------------------------------- */

    @RequestMapping("/createTask", method = [RequestMethod.POST])
    fun createTask(tname: String?, tdesc: String?, tproj: Int): ResponseEntity<Void> {
        val newTask = Task()
        newTask.description = tdesc
        newTask.name = tname
        newTask.project = tproj
        newTask.segment = 1
        taskRepository.save(newTask)
        return ResponseEntity.ok().build()
    }


    @RequestMapping("/changeTask", method = [RequestMethod.POST])
    fun changeTask(@RequestParam(required = true) tId: Int, tname: String?, tdesc: String?): ResponseEntity<Void> {
        val task = taskRepository.findTaskById(tId)
        task.description = tdesc
        task.name = tname
        taskRepository.save(task)
        return ResponseEntity.ok().build()
    }


    @RequestMapping("/changeSegment", method = [RequestMethod.POST])
    fun changeSegment(@RequestParam(required = true) taskId: Int, @RequestParam(required = true) segmentId: Int): ResponseEntity<Void> {
        val task = taskRepository.findTaskById(taskId)
        task.segment = segmentId
        taskRepository.save(task)
        return ResponseEntity.ok().build()
    }


    @RequestMapping("/deleteTask", method = [RequestMethod.POST])
    fun deleteTask(@RequestParam(required = true) taskId: Int): ResponseEntity<Void> {
        val task = taskRepository.findTaskById(taskId)
        taskRepository.delete(task)
        return ResponseEntity.ok().build()
    }


    /** --------------------------------------------  REGISTER AREA --------------------------------------------------- */

    @RequestMapping("/registerUser", method = [RequestMethod.GET])
    fun registerUser(model: Model): String {
        model.set("UserDto", userService.createNewUser())
        return "registerUser"
    }


    @RequestMapping("/addUser", method = [RequestMethod.POST])
    fun addUser(@ModelAttribute("UserDto") @Valid user: UserDto, bindingResult: BindingResult): String {
        if (bindingResult.hasErrors()) {
            return "registerUser"
        }
        try {
            if (user.doPasswordsMatch()) {
                userService.save(user)
            } else {
                bindingResult.rejectValue("password", "", "Passwords do not match.")
                return "registerUser"
            }
        } catch (dive: DataIntegrityViolationException) {
            when {
                dive.message.orEmpty().contains("username_UK") -> {
                    bindingResult.rejectValue("username", "username.alreadyInUse", "Username already in use.")
                    return "registerUser"
                }
                dive.message.orEmpty().contains("email_UK") -> {
                    bindingResult.rejectValue("email", "email.alreadyInUse", "e-mail already in use.")
                    return "registerUser"
                }
                else -> {
                    throw dive
                }
            }
        }
        return "login"
    }


    @RequestMapping("/anonymousAndNotAnonymous", method = [RequestMethod.GET])
    fun anonymous(model: Model): String {
        val auth = SecurityContextHolder.getContext().authentication
        if (auth is AnonymousAuthenticationToken) {
            model.set("showAnonymouspage", true);
            return "anonymous";
        }
        model.set("showAnonymouspage", false);
        return "notanonymous"
    }
}