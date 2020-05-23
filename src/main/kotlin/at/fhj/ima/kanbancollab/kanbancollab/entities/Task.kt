package at.fhj.ima.kanbancollab.kanbancollab.entities

import javax.persistence.*

@Entity
class Task(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var taskId: Int? = null,
        var name: String? = null,
        var description: String? = null,
        var segment: String? = null,
        @ManyToMany
        var subtasks: List<Subtask>? = null
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