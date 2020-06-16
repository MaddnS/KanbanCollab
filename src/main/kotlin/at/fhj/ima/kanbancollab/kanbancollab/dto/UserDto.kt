package at.fhj.ima.kanbancollab.kanbancollab.dto

import at.fhj.ima.kanbancollab.kanbancollab.entities.User
import at.fhj.ima.kanbancollab.kanbancollab.entities.UserRole
import java.io.Serializable

class UserDto (
    var userId: Int?,
    //@NotNull
    //@NotEmpty
    var username: String,
    //@NotNull
    //@NotEmpty
    var firstName: String?,
    //@NotNull
    //@NotEmpty
    var lastName: String?,
    //@NotNull
    //@NotEmpty
    var email: String,
    //@NotNull
    //@NotEmpty
    var password: String?,
    //@NotNull
    //@NotEmpty
    var confirmPassword: String?,
    //@NotNull
    // @NotEmpty
    var role: UserRole?
) : Comparable<User>, Serializable {
    override fun compareTo(other: User): Int {
        return compareValues(username, other.username)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is UserDto) return false
        if (username != other.username) return false
        if (password != other.password) return false
        if (confirmPassword != other.confirmPassword) return false

        return true
    }

    override fun hashCode(): Int {
        var result = username.hashCode()
        result = 31 * result + password.hashCode()
        result = 31 * result + confirmPassword.hashCode()
        return result
    }

    fun doPasswordsMatch(): Boolean {
        return password.equals(confirmPassword)
    }
}