package at.fhj.ima.kanbancollab.kanbancollab.converter

import at.fhj.ima.kanbancollab.kanbancollab.entities.User
import at.fhj.ima.kanbancollab.kanbancollab.repositories.UserRepository
import org.springframework.core.convert.converter.Converter
import org.springframework.stereotype.Component

@Component
class StringToUserConverter(val userRepository: UserRepository) : Converter<String, User?> {
    override fun convert(source: String): User? {
        if (source.isNullOrBlank()) {
            return null
        }
        return userRepository.getOne(Integer.parseInt(source));
    }
}