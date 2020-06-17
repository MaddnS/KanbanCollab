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
class ProjectController (val projectRepository: ProjectRepository,
                         val userRepository: UserRepository,
                         val taskRepository: TaskRepository,
                         val userService: UserService) {


    fun showEditProjectView(model: Model): String {
        val filteredUsers = userRepository.findAll().filter{it.userId != getCurrentUser().userId}
        model.set("users", userRepository.findAll())
        model.set("usersWithoutOwner", filteredUsers)
        return "editProject"
    }

    @RequestMapping("/listProjects", method = [RequestMethod.GET])
    fun listProjects (model: Model/*, @RequestParam(required = false) userId: Int?*/): String {
        val allProjects = projectRepository.findAll()
        val sharedProjects = findSharedProjects(getCurrentUser(),  allProjects)
        model.set("projects", allProjects)
        model.set("sharedProjects",sharedProjects)
        return "listProjects"
    }

    @RequestMapping("/editProject", method = [RequestMethod.GET])
    fun editProject(model: Model, @RequestParam(required = false) projectId: Int?): String{
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
    // @Secured("ROLE_ADMIN")
    fun changeProject(@ModelAttribute("project") @Valid project: Project, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return showEditProjectView(model)
        }

        try {
            projectRepository.save(project)
        } catch (dive: DataIntegrityViolationException) {
            if (dive.message.orEmpty().contains("constraint [projectname_UK]")) {
                bindingResult.rejectValue("name", "name.alreadyInUse", "Project Name already in use.");
                return showEditProjectView(model)
            } else {
                throw dive
            }
        }
        return "redirect:/editProject?projectId=" + project.projectId
    }

    @RequestMapping("/deleteProject", method = [RequestMethod.POST])
    //@Secured("ROLE_ADMIN")
    fun deleteProject(model: Model, @RequestParam projectId: Int, @RequestParam name: String): String {
        projectRepository.delete(projectRepository.findByProjectId(projectId))
        model.set("message", "'$name' was deleted")
        return listProjects(model) //; "redirect:listProjects"
        // Wunsch wäre es von der editView aus deleten zu können. Leider habe ich das nicht geschafft
    }


    @RequestMapping("/viewProject", method = [RequestMethod.GET])
    fun viewProject(model: Model, @RequestParam(required = false) projectId: Int): String{
        val project = projectRepository.findByProjectId(projectId)
        val projectTasks = taskRepository.findTaskByProject(projectId)
        model.set("tasks", projectTasks)
        model.set("project", project)

        return "viewProject"
    }
  // --------------------------------------------  TASK AREA ---------------------------------------------------

    @RequestMapping("/createTask", method = [RequestMethod.GET])
    fun createTask(tname: String?, tdesc: String?,tproj: Int): ResponseEntity<Void> {
            val newTask = Task()
            //model.set("task", newTask)
            newTask.description = tdesc
            newTask.name = tname
            newTask.project = tproj
            newTask.segment = 1
            taskRepository.save(newTask)
             return ResponseEntity.ok().build()

        }


    @RequestMapping("/changeTask", method = [RequestMethod.GET])
    fun changeTask(@RequestParam(required = true) tId: Int, tname: String?, tdesc: String?,tproj: Int): ResponseEntity<Void> {
            val task = taskRepository.findTaskById(tId)
            //model.set("task", task)
            task.description = tdesc
            task.name = tname
            task.project = tproj
            taskRepository.save(task)
            return ResponseEntity.ok().build()


    }

        @RequestMapping("/registerUser", method = [RequestMethod.GET])
        fun registerUser(model: Model): String {
            model.set("UserDto", userService.createNewUser())
            return "registerUser"
        }

        @RequestMapping("/addUser", method = [RequestMethod.POST])
        fun addUser(@ModelAttribute("user") @Valid user: UserDto, bindingResult: BindingResult, model: Model): String {
            userService.save(user)
            return "listProjects"
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
/*
        @RequestMapping("/changeTask", method = [RequestMethod.POST])
        // @Secured("ROLE_ADMIN")ber
        fun changeTask(@ModelAttribute("project") @Valid task: Task, bindingResult: BindingResult, model: Model): String {
            if (bindingResult.hasErrors()) {
                return "editTask"
            }

           taskRepository.save(task)

            return "redirect:/editTask?taskId=" + task.taskId
        }
*/

        @RequestMapping("/changeSegment", method = [RequestMethod.GET])
        fun changeSegment(@RequestParam(required = true) taskId: Int, @RequestParam(required = true) segmentId: Int): ResponseEntity<Void> {
            val task = taskRepository.findTaskById(taskId)
            task.segment = segmentId
            taskRepository.save(task)
            return ResponseEntity.ok().build()
        }

        fun findSharedProjects(user: User, allProj: List<Project>): List<Project> {
            val uId = user.userId
            return allProj.filter { it.members.any { it.userId == uId } }
        }

        fun getCurrentUser(): User {
            return userRepository.findByUsername(SecurityContextHolder.getContext().authentication.name)
        }

}