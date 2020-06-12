package at.fhj.ima.kanbancollab.kanbancollab.controller

import at.fhj.ima.kanbancollab.kanbancollab.entities.Project
import at.fhj.ima.kanbancollab.kanbancollab.repositories.ProjectRepository
import at.fhj.ima.kanbancollab.kanbancollab.repositories.TaskRepository
import at.fhj.ima.kanbancollab.kanbancollab.repositories.UserRepository
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import java.time.LocalDate
import javax.validation.Valid

@Controller
class ProjectController (val projectRepository: ProjectRepository,
                         val userRepository: UserRepository,
                         val taskRepository: TaskRepository) {

    fun showEditProjectView(model: Model): String {

        model.set("users", userRepository.findAll())
        return "editProject"
    }

    @RequestMapping("/listProjects", method = [RequestMethod.GET])
    //fun listProjects (model: Model, @RequestParam userId: Int): String {
    fun listProjects (model: Model, @RequestParam(required = false) userId: Int?): String {
        model.set("projects", projectRepository.findAll())
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

        //try {
            projectRepository.save(project)
        //} catch (dive: DataIntegrityViolationException) {
            //if (dive.message.orEmpty().contains("constraint [ssn_UK]")) {
                //bindingResult.rejectValue("ssn", "ssn.alreadyInUse", "Project Id already in use.");
                //return showEditProjectView(model)
            //} else {
            //    throw dive;
            //}
        //}
        return "redirect:/editProject?projectId=" + project.projectId
    }

    @RequestMapping("/viewProject", method = [RequestMethod.GET])

    fun viewProject(model: Model, @RequestParam(required = false) projectId: Int): String{
        val project = projectRepository.findByProjectId(projectId)
        val allTasks = taskRepository.findAll()
        val projectTasks = taskRepository.findTaskByProject(projectId)
        model.set("tasks", projectTasks)
        model.set("project", project)

        return "viewProject"
    }


}