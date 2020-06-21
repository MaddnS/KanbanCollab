package at.fhj.ima.kanbancollab.kanbancollab.repositories

import at.fhj.ima.kanbancollab.kanbancollab.entities.Project
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
interface ProjectRepository : JpaRepository<Project, Int> {
    @Query("FROM Project WHERE projectId = :projectId")
    fun findByProjectId(@Param("projectId") projectId: Int): Project
}