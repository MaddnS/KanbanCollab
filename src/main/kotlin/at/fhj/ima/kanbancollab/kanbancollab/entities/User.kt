package at.fhj.ima.kanbancollab.kanbancollab.entities

import java.io.Serializable
import javax.persistence.*
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size

enum class UserRole {
    ROLE_USER,
    ROLE_ADMIN
}

@Entity
@Table(uniqueConstraints = [UniqueConstraint(name = "username_UK", columnNames = ["username"])])
class User(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var userId: Int? = null,
        @field:NotNull()
        @field:Size(min = 1, max = 32)
        var username: String = "",
        @field:NotNull()
        var pwhash: String? = null,
        @field:NotNull()
        @field:Size(min = 1, max = 64)
        var firstName: String? = null,
        @field:NotNull()
        @field:Size(min = 1, max = 64)
        var lastName: String? = null,
        @field:NotNull()
        @field:Size(min = 1, max = 320)
        var email: String = "",
        @Enumerated(EnumType.STRING)
        var role: UserRole? = UserRole.ROLE_USER
): Comparable<User>, Serializable {
    override fun compareTo(other: User): Int {
        return compareValues(userId, other.userId)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as User
        if (userId != other.userId) return false
        return true
    }

    override fun hashCode(): Int {
        return userId.hashCode()
    }
}