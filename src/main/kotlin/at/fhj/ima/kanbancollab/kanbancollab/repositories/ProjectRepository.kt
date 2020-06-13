package at.fhj.ima.kanbancollab.kanbancollab.repositories

import at.fhj.ima.kanbancollab.kanbancollab.entities.Project
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface ProjectRepository :JpaRepository<Project,Int>{
    @Query("FROM Project WHERE projectId = :projectId")
    fun findByProjectId (@Param("projectId") projectId: Int):Project
/*
    SO CLOSE YET SO FAR
    @Query("FROM Project INNER JOIN User ON project_id = project_project_id WHERE members_user_id = :userId")
    fun findProjectByMembers (@Param("userId") userId: Int):Project


 */
/*
    THIS IS HOW IT WORKS IN MYSQL. WHY NOT HERE??? :(

    SELECT *
    FROM kanbancollab.project p
    INNER JOIN kanbancollab.project_members m ON project_id = project_project_id
    WHERE members_user_id = 4;
 */
}