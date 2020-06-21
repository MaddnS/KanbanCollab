package at.fhj.ima.kanbancollab.kanbancollab.controller.advice

import at.fhj.ima.kanbancollab.kanbancollab.repositories.UserRepository
import org.springframework.security.authentication.AnonymousAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ModelAttribute

/**
 *
 * This class is a controller that, if logged in, adds the current username to the model.
 *
 *
 */

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