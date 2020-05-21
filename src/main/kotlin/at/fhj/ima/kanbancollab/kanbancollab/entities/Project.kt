package at.fhj.ima.kanbancollab.kanbancollab.entities

import javax.persistence.*

@Entity
class Project(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,
        @ManyToOne
        var owner: User? = null,
        @ManyToMany
        var members: Set<User>? = null,
        var name: String? = null
): Comparable<Project> {
    override fun compareTo(other: Project): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Project
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}