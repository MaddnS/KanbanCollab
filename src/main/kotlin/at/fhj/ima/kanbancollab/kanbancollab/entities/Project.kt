package at.fhj.ima.kanbancollab.kanbancollab.entities

import javax.persistence.*
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size

/**
 *
 * This class is implemented in order to store all our projects in the database.
 *
 * It also holds the project's owner and the project members, which can be added by the owner.
 * The members attribute creates an intermediate entity in the database in order to show all affiliations between users
 * and their shared projects.
 *
 */

@Entity
class Project(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var projectId: Int? = null,
        @ManyToOne
        var owner: User? = null,
        @ManyToMany
        var members: List<User> = listOf(),
        @field:NotNull()
        @field:Size(min = 1, max = 50)
        var name: String? = null,
        @field:Size(min = 0, max = 240)
        var description: String? = null
) : Comparable<Project> {
    override fun compareTo(other: Project): Int {
        return compareValues(projectId, other.projectId)
    }


    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Project
        if (projectId != other.projectId) return false
        return true
    }


    override fun hashCode(): Int {
        return projectId.hashCode()
    }
}