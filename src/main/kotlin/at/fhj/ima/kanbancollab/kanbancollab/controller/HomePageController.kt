package at.fhj.ima.kanbancollab.kanbancollab.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

/**
 *
 * This class is the homepage controller for our MVC Spring application.
 *
 * This controller makes sure that every time the website is called without a specified subpage,
 *          a redirect is issued to listProjects. It also directs towards our login jsp if not logged in.
 *
 *
 */

@Controller
class HomePageController {
    @RequestMapping("", method = [RequestMethod.GET])
    fun homePage(): String {
        return "redirect:listProjects"
    }


    @RequestMapping("/login", method = [RequestMethod.GET])
    fun login(): String {
        return "login"
    }
}