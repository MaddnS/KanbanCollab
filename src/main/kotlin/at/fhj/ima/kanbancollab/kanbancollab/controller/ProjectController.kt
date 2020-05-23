package at.fhj.ima.kanbancollab.kanbancollab.controller

import at.fhj.ima.kanbancollab.kanbancollab.repositories.ProjectRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

@Controller
class ProjectController (val projectRepository: ProjectRepository) {
    @RequestMapping("/listProjects", method = [RequestMethod.GET])
    //fun listProjects (model: Model, @RequestParam userId: Int): String {
    fun listProjects (model: Model, @RequestParam(required = false) userId: Int?): String {
        model.set("projects", projectRepository.findAll())
        return "listProjects"
    }
}