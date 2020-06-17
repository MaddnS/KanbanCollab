package at.fhj.ima.kanbancollab.kanbancollab.at.fhj.ima.kanbancollab.kanbancollab

import at.fhj.ima.kanbancollab.kanbancollab.security.MyUserDetailsService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.security.web.util.matcher.AntPathRequestMatcher


@Configuration
@EnableWebSecurity
class WebSecurityConfig : WebSecurityConfigurerAdapter() {

    @Autowired
    private lateinit var myUserDetailsService: MyUserDetailsService;

    override fun configure(http: HttpSecurity) {
        http
            .authorizeRequests()
            // you anonymous urls here
                .antMatchers("/registerUser").permitAll()
                .antMatchers("/anonymous").permitAll()
                .antMatchers("/anonymousAndNotAnonymous").permitAll()
                //.antMatchers("/anonymous1").permitAll()
                //.antMatchers("/anonymous2").permitAll()
                //.antMatchers("/anonymous3").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login")
                .permitAll()
                .and()
                .rememberMe().key("uniqueAndSecret").userDetailsService(myUserDetailsService)
                //.logout()
                //.logoutRequestMatcher(AntPathRequestMatcher("/logout"))


    }

}
