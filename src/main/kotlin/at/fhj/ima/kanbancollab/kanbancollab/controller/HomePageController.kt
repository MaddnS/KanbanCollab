package at.fhj.ima.kanbancollab.kanbancollab.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class HomePageController {

    @RequestMapping("", method = [RequestMethod.GET])
    fun homePage(): String {
        return "redirect:listProjects"
    }

    @RequestMapping("/login", method= [RequestMethod.GET])
    fun login(): String {
        return "login"
    }

}