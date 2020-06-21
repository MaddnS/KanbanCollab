package at.fhj.ima.kanbancollab.kanbancollab.repositories

import at.fhj.ima.kanbancollab.kanbancollab.entities.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

/**
 *
 * This interface is implemented to enable simple communication between the controller and the database.
 * It is possible to declare functions that are built upon SQL queries here.
 *
 */

@Repository
interface UserRepository : JpaRepository<User, Int> {
    @Query("FROM User WHERE userId = :userId")
    fun findByUserId(@Param("userId") projectId: Int): User

    @Query("FROM User WHERE username = :username")
    fun findByUsername(@Param("username") username: String): User
}