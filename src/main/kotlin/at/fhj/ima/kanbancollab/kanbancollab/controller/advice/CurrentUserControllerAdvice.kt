package at.fhj.ima.kanbancollab.kanbancollab.controller.advice

import at.fhj.ima.kanbancollab.kanbancollab.repositories.UserRepository
import org.springframework.security.authentication.AnonymousAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ModelAttribute

/*@ControllerAdvice
class CurrentUserControllerAdvice(val userRepository: UserRepository) {

    @ModelAttribute
    fun addCurrentUser(model: Model) {
        val auth = SecurityContextHolder.getContext().authentication
        val username = auth.name
        //val userId  = auth

        val currentUser = userRepository.findByUsername(username)
        model.addAttribute("currentUser", currentUser)

        //val currentUserId = userRepository.findByUserId(userId)
        //model.addAttribute("currentUserId", currentUserId)
    }
}*/
@ControllerAdvice
class CurrentUserControllerAdvice(val userRepository: UserRepository) {

    @ModelAttribute
    fun addCurrentUser(model: Model) {
        val auth = SecurityContextHolder.getContext().authentication
        if (auth == null || auth is AnonymousAuthenticationToken) {
            return
        }
        val username = auth.name
        val currentUser = userRepository.findByUsername(username)
        model.addAttribute("currentUser", currentUser)
    }
}