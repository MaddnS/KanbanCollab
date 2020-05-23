package at.fhj.ima.kanbancollab.kanbancollab.controller

import at.fhj.ima.kanbancollab.kanbancollab.entities.Project
import at.fhj.ima.kanbancollab.kanbancollab.repositories.ProjectRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import java.time.LocalDate

@Controller
class ProjectController (val projectRepository: ProjectRepository) {

    fun showEditProjectView(model: Model): String {

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


}