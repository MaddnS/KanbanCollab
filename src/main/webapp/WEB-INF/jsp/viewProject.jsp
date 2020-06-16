<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="KanbanCollab - ${project.name}" activePage="viewProject">
    <%--@elvariable id="project" type="at.fhj.ima.kanbancollab.kanbancollab.entities.Project"--%>
    <form:form modelAttribute="project" class="needs-validation form-horizontal" method="post" action="viewProject" novalidate="novalidate">
        <input type="hidden" name="projectId" value="<c:out value="${project.projectId}"/>">


        <%--<div class="add-task-container">
            <input type="text" maxlength="12" id="taskText" placeholder="New Task..." onkeydown="if (event.keyCode == 13)
                        document.getElementById('add').click()">
            <button id="add" class="button add-button" onclick="addTask()">Add New Task</button>
        </div>--%>
        <div class="main-container">
            <ul class="columns">
                <ul class="containerMaO">
                    <li class="projOwner">
                        <div class="po-header">
                            <h5>Project-Owner: </h5>
                        </div>
                    <li class="mao-list-entry">
                        ${project.owner.username}
                    </li>

                    </li>

                    <li class="membersAndOptions">

                            <div class="mao-header">
                                <h5>Project-Members:</h5>

                                <ul class="members-list">
                                    <c:forEach items="${project.members}" var="member">
                                        <li class="mao-list-entry">
                                                ${member.username}
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                    </li>
                </ul>

                <li class="column to-do-column">
                    <div class="column-header" style="border-bottom: 1px solid #ccc;">
                        <h4>To Do</h4>
                    </div>
                    <ul class="task-list" id="to-do">
                        &nbsp; <%-- Platzhalter, damit Liste nie leer wird und somit das Drag&Drop funktioniert--%>
                        <c:forEach items="${tasks}" var="task">
                            <c:if test="${task.segment == 1}"> <!---- NICHT IDEAL!!! ---->
                                <li class="task">
                                    <div class="card-body">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col">
                                                        <h5 class="card-title"> ${task.name}</h5>
                                                    </div>
                                                    <div class="col-lg-2.5">
                                                        <svg class="bi bi-three-dots-vertical" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                                        </svg>
                                                    </div>
                                                </div>

                                                <p class="card-text">${task.description}</p>

                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>

                    </ul>
                </li>

                <li class="column inprogress-column" >
                    <div class="column-header" style="border-bottom: 1px solid #ccc;">
                        <h4>In Progress</h4>
                    </div>
                    <ul class="task-list" id="in-progress">
                        &nbsp; <%-- Platzhalter, damit Liste nie leer wird und somit das Drag&Drop funktioniert--%>
                        <c:forEach items="${tasks}" var="task">
                            <c:if test="${task.segment == 2}">
                                <li class="task">
                                    <div class="card-body">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col">
                                                        <h5 class="card-title"> ${task.name}</h5>
                                                    </div>
                                                    <div class="col-lg-2.5">
                                                        <svg class="bi bi-three-dots-vertical" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                                        </svg>
                                                    </div>
                                                </div>

                                                <p class="card-text">${task.description}</p>

                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>

                    </ul>
                </li>

                <li class="column done-column">
                    <div class="column-header" style="border-bottom: 1px solid #ccc;">
                        <h4>Done</h4>
                    </div>
                    <ul class="task-list" id="done">
                        &nbsp; <%-- Platzhalter, damit Liste nie leer wird und somit das Drag&Drop funktioniert--%>
                        <c:forEach items="${tasks}" var="task">
                            <c:if test="${task.segment == 3}">
                                <li class="task" data-task-id="${task.taskId}">
                                    <div class="card-body">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col">
                                                        <h5 class="card-title"> ${task.name}</h5>
                                                    </div>
                                                    <div class="col-lg-2.5">
                                                        <svg class="bi bi-three-dots-vertical" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                                        </svg>
                                                    </div>
                                                </div>

                                                <p class="card-text">${task.description}</p>

                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>

                    </ul>
                </li>

<%-- ---------------------------- OPTIONS: CREATE TASK, INVITE, ... ------------------------------- --%>
                <li class="membersAndOptions">

                    <div class="mao-header">
                        <h5>Options:</h5>

                        <ul class="options-list">
                            <li class="mao-list-entry">
                                <button type="button" class="newTaskCreate" data-toggle = "modal" data-target = "#createNewTaskModal">
                                    New Task
                                </button>

                                <div class="modal fade" id="createNewTaskModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">Create New Task</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <%--  MIT AJAX MACHEN ?  --%>
                                                    <! ---------------- Task Name & Description ---------------- -->
                                                    <%--@elvariable id="task" type="at.fhj.ima.kanbancollab.kanbancollab.entities.Task"--%>
                                                   <%--  <form:form modelAttribute="task" class="needs-validation form-horizontal" method="post" action="viewProject" novalidate="novalidate">
                                                            <%-- <form:form id="inputTask" method="post" action="/changeTask?taskId=${task.taskId}"> --%>
                                                           <%--     <div class="field">
                                                                    <label for="task_name_input">Task Name: </label>
                                                                    <%-- <input type="text" id="task_name_input" required> --%>
                                                               <%--     <form:input type="text" path="name" id="task_name_input"/>
                                                                </div>
                                                                <div class="field">
                                                                    <label for="task_description_input">Description: </label>
                                                                    <form:input type="text" path="description" id="task_description_input"/>
                                                                </div>

                                                                    <form:input type="hidden" path="project" id="task_project_input" name="project" value="${project.projectId}"/>
                                                                    <form:input type="hidden" path="segment" id="task_segment_input" name="segment" value="1" />

                                                                 <button type="submit" id="task_submit" class="task_submit">Create</button>
                                                             </form:form> --%>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </li>

                            <li class="mao-list-entry">
                            Invite
                            </li>
                        </ul>
                    </div>



                </li>


            </ul>
        </div>
    </form:form>
    <%--@elvariable id="task" type="at.fhj.ima.kanbancollab.kanbancollab.entities.Task"--%>
    <%--<form id="formular" action="viewProject" method="post">
        <input id="taskId" path="taskId" name="task"/>
        <input id="segment" path="segment" name="segment"/>
    </form>--%>

</layout:page-container>

