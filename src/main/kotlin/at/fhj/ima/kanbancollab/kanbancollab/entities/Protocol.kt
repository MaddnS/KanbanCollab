package at.fhj.ima.kanbancollab.kanbancollab.entities

import java.time.LocalDate
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
class Protocol(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,
        var taskId: Int? = null,
        var username: String? = null,
        var date: LocalDate? = null,
        var oldState: String? = null, // war ich mir beim type nicht ganz sicher
        var newState: String? = null // und hier auch
        ): Comparable<Protocol> {
    override fun compareTo(other: Protocol): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Protocol
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}