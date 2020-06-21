package at.fhj.ima.kanbancollab.kanbancollab

import at.fhj.ima.kanbancollab.kanbancollab.security.MyUserDetailsService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.builders.WebSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.security.web.util.matcher.AntPathRequestMatcher

/**
 *
 * This class manages the main security configurations of our application. This class defines which pages can be
 * accessed by anonymous and logged in users. It also specifies which files (such as js and css) can be used by
 * anonymous users.
 *
 */

@Configuration
@EnableWebSecurity
class WebSecurityConfig : WebSecurityConfigurerAdapter() {

    @Autowired
    private lateinit var myUserDetailsService: MyUserDetailsService;

    override fun configure(http: HttpSecurity) {
        http
            .authorizeRequests()
                .antMatchers("/addUser").permitAll()
                .antMatchers("/registerUser").permitAll()
                .antMatchers("/anonymousAndNotAnonymous").permitAll()
                .anyRequest().authenticated()
                .and()
            .formLogin()
                .loginPage("/login")
                .permitAll()
                .and()
            .rememberMe().key("uniqueAndSecret").userDetailsService(myUserDetailsService)
                .and()
            .logout()
                .logoutRequestMatcher(AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/login")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
    }
    override fun configure(web: WebSecurity) {
        web
                .ignoring()
                .antMatchers("/resources/**", "/static/**", "/css/**", "/js/**")
    }
}
