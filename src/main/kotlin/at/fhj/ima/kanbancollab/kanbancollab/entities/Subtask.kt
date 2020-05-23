package at.fhj.ima.kanbancollab.kanbancollab.entities

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
class Subtask(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var subtaskId: Int? = null,
        var description: String? = null,
        var state: Boolean? = false,
        var parentTaskId: Int? = null
): Comparable<Subtask> {

    override fun compareTo(other: Subtask): Int {
        return compareValues(subtaskId, other.subtaskId)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Subtask
        if (subtaskId != other.subtaskId) return false
        return true
    }

    override fun hashCode(): Int {
        return subtaskId.hashCode()
    }
}