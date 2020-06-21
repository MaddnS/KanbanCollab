package at.fhj.ima.kanbancollab.kanbancollab.entities

import java.io.Serializable
import javax.persistence.*
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size

/**
 *
 * This class is implemented in order to store all our users in the database.
 *
 * A user can be created from the registerUser site. It is important to choose a unique username and email.
 * The password must also longer than 8 characters. It is only stored in a hashed and salted way in the database.
 * Every users that is created from the registerUser site automatically has the role "ROLE_USER" assigned.
 * Admins can not be added through the frontend.
 * The members attribute creates an intermediate entity in the database in order to show all affiliations between users
 * and projects. The user entity enables a Role Based Access Control (RBAC)-like system. Thereby, only users that are an
 * owner of a project can edit and delete that project and only projectMembers can view a project,
 * with the exception of admins.
 * Admins have a separate view and are able to delete, edit and view all projects in the database.
 *
 */

enum class UserRole {
    ROLE_USER,
    ROLE_ADMIN
}

@Entity
@Table(uniqueConstraints = [UniqueConstraint(name = "username_UK", columnNames = ["username"]),
    UniqueConstraint(name = "email_UK", columnNames = ["email"])])
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
) : Comparable<User>, Serializable {
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