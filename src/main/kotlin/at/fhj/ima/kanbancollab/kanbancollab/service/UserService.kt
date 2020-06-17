package at.fhj.ima.kanbancollab.kanbancollab.service

import at.fhj.ima.kanbancollab.kanbancollab.dto.UserDto
import at.fhj.ima.kanbancollab.kanbancollab.entities.User
import at.fhj.ima.kanbancollab.kanbancollab.entities.UserRole
import at.fhj.ima.kanbancollab.kanbancollab.repositories.UserRepository
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class UserService(val userRepository: UserRepository) {
    fun createNewUser(): UserDto {
        val newUser = User()
        return convertEntityToDto(newUser)
    }

    private fun convertEntityToDto(entity: User): UserDto {
        return UserDto(entity.userId, entity.email, entity.firstName, entity.lastName,
                entity.username, entity.pwhash, role = UserRole.ROLE_USER, confirmPassword = null)
    }

    private fun convertDtoToEntity(dto: UserDto): User {

        val user = User()
        user.userId = dto.userId
        user.username = dto.username
        user.pwhash = BCryptPasswordEncoder().encode(dto.password)
        user.email = dto.email
        user.firstName = dto.firstName
        user.lastName = dto.lastName
        user.role = UserRole.ROLE_USER
        return user
    }

    fun delete(username: String) {
        userRepository.delete(userRepository.findByUsername(username))
    }

    @Transactional
    fun save(dto: UserDto) {
        val user = convertDtoToEntity(dto)
        userRepository.save(user)
    }
}
