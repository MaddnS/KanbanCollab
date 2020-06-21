package at.fhj.ima.kanbancollab.kanbancollab.repositories

import at.fhj.ima.kanbancollab.kanbancollab.entities.Task
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
interface TaskRepository : JpaRepository<Task, Int> {
    @Query("FROM Task WHERE project = :projectId")
    fun findTaskByProject(@Param("projectId") projectId: Int): Set<Task>

    @Query("FROM Task WHERE taskId = :taskId")
    fun findTaskById(@Param("taskId") taskId: Int): Task
}