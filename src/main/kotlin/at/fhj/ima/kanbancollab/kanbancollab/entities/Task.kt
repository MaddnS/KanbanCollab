package at.fhj.ima.kanbancollab.kanbancollab.entities

import javax.persistence.*
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size

@Entity
class Task(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var taskId: Int? = null,
        @field:NotNull()
        @field:Size(min = 1, max = 64)
        var name: String? = null,
        var project: Int? = null,
        @field:Size(min = 0, max = 240)
        var description: String? = null,
        var segment: Int? = null
): Comparable<Task> {
    override fun compareTo(other: Task): Int {
        return compareValues(taskId, other.taskId)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Task
        if (taskId != other.taskId) return false
        return true
    }

    override fun hashCode(): Int {
        return taskId.hashCode()
    }
}