package at.fhj.ima.kanbancollab.kanbancollab.entities

import javax.persistence.*

@Entity
class Project(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var projectId: Int? = null,
        @ManyToOne
        var owner: User? = null,
        @ManyToMany
        var members: Set<User>? = null,
        var name: String? = null,
        var description: String? = null
): Comparable<Project> {
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