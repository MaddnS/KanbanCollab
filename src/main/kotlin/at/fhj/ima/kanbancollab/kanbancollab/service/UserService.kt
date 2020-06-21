package at.fhj.ima.kanbancollab.kanbancollab.service

import at.fhj.ima.kanbancollab.kanbancollab.dto.UserDto
import at.fhj.ima.kanbancollab.kanbancollab.entities.User
import at.fhj.ima.kanbancollab.kanbancollab.entities.UserRole
import at.fhj.ima.kanbancollab.kanbancollab.repositories.UserRepository
import org.springframework.mail.MailSender
import org.springframework.mail.SimpleMailMessage
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class UserService(val userRepository: UserRepository,
                  val mailSender: MailSender) {
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

    @Transactional
    fun save(dto: UserDto) {
        val user = convertDtoToEntity(dto)
        userRepository.save(user)
        val message = SimpleMailMessage()
        message.setFrom("noreply@kanbancollab.com")
        message.setTo(user.email)
        message.setSubject("Account ${user.username} was created!")
        message.setText("Hello ${user.firstName} ${user.lastName}! " +
                "\nWelcome to our Kanban Collaboration Tool! Your account ${user.username} was created! " +
                "\nGo to localhost/8080 to log in with your account!")
        mailSender.send(message)
    }
}
