package at.fhj.ima.kanbancollab.kanbancollab

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.builder.SpringApplicationBuilder
import org.springframework.boot.runApplication
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer

@SpringBootApplication
class KanbanCollabApplication : SpringBootServletInitializer() {
	override fun configure(application: SpringApplicationBuilder): SpringApplicationBuilder {
		return application.sources(KanbanCollabApplication::class.java)
	}
}

fun main(args: Array<String>) {
	runApplication<KanbanCollabApplication>(*args)
}


