package at.fhj.ima.kanbancollab.kanbancollab.entities

import javax.persistence.*

@Entity
class Task(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,
        var name: String? = null,
        var description: String? = null,
        var segment: String? = null, //column is bei sql reserved also könn mas nicht nehmen
        @ManyToMany
        var subTasks: List<Task>? = null //passt so?
): Comparable<Task> {
    override fun compareTo(other: Task): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Task
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}