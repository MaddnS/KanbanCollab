package at.fhj.ima.kanbancollab.kanbancollab.dto

import at.fhj.ima.kanbancollab.kanbancollab.entities.User
import at.fhj.ima.kanbancollab.kanbancollab.entities.UserRole
import java.io.Serializable
import javax.validation.constraints.Size

class UserDto (
    var userId: Int?,
    @field:Size(min = 1, max = 32)
    var username: String,
    @field:Size(min = 1, max = 64)
    var firstName: String?,
    @field:Size(min = 1, max = 64)
    var lastName: String?,
    @field:Size(min = 1, max = 320)
    var email: String,
    @field:Size(min = 1, max = 128)
    var password: String?,
    @field:Size(min = 1, max = 128)
    var confirmPassword: String?,
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