package at.fhj.ima.kanbancollab.kanbancollab.entities

import java.io.Serializable
import javax.persistence.*
import javax.validation.constraints.NotNull

enum class UserRole {
    ROLE_USER,
    ROLE_ADMIN
}

@Entity
class User(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var userId: Int? = null,
        @Column(unique = true)
        var username: String = "",
        var pwhash: String? = null,
        var firstName: String? = null,
        var lastName: String? = null,
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