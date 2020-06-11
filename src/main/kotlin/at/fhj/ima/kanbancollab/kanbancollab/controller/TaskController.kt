package at.fhj.ima.kanbancollab.kanbancollab.at.fhj.ima.kanbancollab.kanbancollab.controller

import at.fhj.ima.kanbancollab.kanbancollab.repositories.ProjectRepository
import at.fhj.ima.kanbancollab.kanbancollab.repositories.TaskRepository
import at.fhj.ima.kanbancollab.kanbancollab.repositories.UserRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set


@Controller
class TaskController (val projectRepository: ProjectRepository,
                      val taskRepository: TaskRepository) {

    fun listAllTasks(model: Model): String {

        model.set("allTasks", taskRepository.findAll())
        return "allTasks"
    }
}