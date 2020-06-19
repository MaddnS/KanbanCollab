<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="KanbanCollab - ${project.name}" activePage="viewProject">
    <%--@elvariable id="project" type="at.fhj.ima.kanbancollab.kanbancollab.entities.Project"--%>
    <form:form modelAttribute="project" class="needs-validation form-horizontal" method="post" action="viewProject"
               novalidate="novalidate">
        <input type="hidden" name="projectId" value="<c:out value="${project.projectId}"/>">


    <%--------------------------------------- ProjectOwner & Members AREA ---------------------------------------------%>
        <div class="main-container">
        <ul class="columns" id="columnsC">
        <ul class="containerMaO">
            <li class="projOwner">
                <div class="po-header">
                    <h5 class="mao-header">Project-Owner: </h5>
                </div>
            <li class="mao-list-entry">
                    ${project.owner.username}
            </li>

            </li>

            <li class="membersAndOptions">

                <div class="mao-header">
                    <h5 class="mao-header" >Project-Members:</h5>

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
<%------------------------------------------------- Task AREA ---------------------------------------------------------%>
        <li class="column to-do-column">
            <div class="column-header" style="border-bottom: 1px solid #ccc;">
                <h4>To Do</h4>
            </div>
            <ul class="task-list" id="to-do" data-seg-id="1">
                &nbsp; <!-- Platzhalter, damit Liste nie leer wird und somit das Drag&Drop funktioniert-->
                <c:forEach items="${tasks}" var="task">
                    <c:if test="${task.segment == 1}">
                        <li class="task" data-task-id="${task.taskId}">
                            <div class="card-body">
                                <input type="hidden" name="taskSegment" value="${task.segment}"/>
                                <div class="card">
                                    <div class="card-body task">
                                        <div class="row">
                                            <div class="col-8">
                                                <a href="#" data-toggle="modal" data-target="#changeTaskModal"
                                                   class="open-changeTask">
                                                <h5 class="card-title"> ${task.name}</h5>
                                                </a>
                                            </div>


                                            <form:form></form:form>

                                            <div class="col-2-auto">
                                                <form:form class="delete-Task-Form" method="POST">
                                                    <button type="submit" class="btn btn-xs btn-danger">
                                                        <svg class="bi bi-trash" width="0.8em" height="0.8em"
                                                             viewBox="0 0 16 16" fill="currentColor"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                            <path fill-rule="evenodd"
                                                                  d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                        </svg>
                                                    </button>
                                                </form:form>

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

        <li class="column inprogress-column">
            <div class="column-header" style="border-bottom: 1px solid #ccc;">
                <h4>In Progress</h4>
            </div>
            <ul class="task-list" id="in-progress" data-seg-id="2">
                &nbsp; <%-- Platzhalter, damit Liste nie leer wird und somit das Drag&Drop funktioniert--%>
                <c:forEach items="${tasks}" var="task">
                    <c:if test="${task.segment == 2}">
                        <li class="task" data-task-id="${task.taskId}">
                            <div class="card-body">
                                <div class="card">
                                    <div class="card-body task">
                                        <div class="row">
                                            <div class="col-8">
                                                <a href="#" data-toggle="modal" data-target="#changeTaskModal"
                                                   class="open-changeTask">
                                                <h5 class="card-title"> ${task.name}</h5>
                                                </a>
                                            </div>


                                            <form:form></form:form>

                                            <div class="col-2-auto">
                                                <form:form class="delete-Task-Form" method="POST">
                                                    <button type="submit" class="btn btn-xs btn-danger">
                                                        <svg class="bi bi-trash" width="0.8em" height="0.8em"
                                                             viewBox="0 0 16 16" fill="currentColor"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                            <path fill-rule="evenodd"
                                                                  d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                        </svg>
                                                    </button>
                                                </form:form>

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
            <ul class="task-list" id="done" data-seg-id="3">
                &nbsp; <%-- Platzhalter, damit Liste nie leer wird und somit das Drag&Drop funktioniert--%>
                <c:forEach items="${tasks}" var="task">
                    <c:if test="${task.segment == 3}">
                        <li class="task" data-task-id="${task.taskId}">
                            <div class="card-body">
                                <div class="card">
                                    <div class="card-body task">
                                        <div class="row">
                                            <div class="col-8">
                                                <a href="#" data-toggle="modal" data-target="#changeTaskModal"
                                                   class="open-changeTask">
                                                <h5 class="card-title"> ${task.name}</h5>
                                                </a>
                                            </div>


                                            <form:form></form:form>

                                            <div class="col-2-auto">
                                                <form:form class="delete-Task-Form" method="POST">
                                                    <button type="submit" class="btn btn-xs btn-danger">
                                                        <svg class="bi bi-trash" width="0.8em" height="0.8em"
                                                             viewBox="0 0 16 16" fill="currentColor"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                            <path fill-rule="evenodd"
                                                                  d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                        </svg>
                                                    </button>
                                                </form:form>

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
    </form:form>
    <%-- ---------------------------- OPTIONS: CREATE TASK, Edit Project, ... ------------------------------- --%>
    <li class="membersAndOptions">

        <div class="mao-header">
            <h5 class="mao-header">Options:</h5>

            <ul class="options-list">

                <li class="mao-list-entry">
                    <a href="#" class="btn btn-success" data-toggle="modal" data-target="#createNewTaskModal">
                        Create New Task
                    </a>

                    <div class="modal fade" id="createNewTaskModal" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalcreate">Create New Task</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                        <%--  MIT AJAX MACHEN ?  --%>
                                    <! ---------------- Task Name & Description ---------------- -->

                                    <form:form id="inputTaskForm" method="POST" action="/createTask">
                                        <div class="field">
                                            <label for="task_name">Task Name: </label>
                                            <input type="text" id="task_name" maxlength="64" required="required">
                                                <%-- <form:input type="text" value="" id="task_name_input"/> --%>
                                        </div>
                                        <div class="field">
                                            <label for="task_description">Description: </label>
                                            <textarea id="task_description" maxlength="240"></textarea>
                                                <%-- <form:input type="text" path="description" id="task_description_input"/> --%>
                                        </div>
                                        <input type="hidden" id="task_project" name="project"
                                               value="${project.projectId}"/>
                                        <input type="hidden" id="task_id" name="project" value="${task.taskId}"/>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                        </button>
                                        <button type="submit" id="task_submi" class="btn btn-secondary">Create</button>
                                    </form:form>


                                </div>
                                <div class="modal-footer">

                                </div>

                            </div>
                        </div>
                    </div>

                            </li>
<%----------------------------------------------------- Change Project link -----------------------------------------------------%>
                           <c:if test="${currentUser.username == 'admin' || currentUser.userId == project.owner.userId}">
                            <li class="mao-list-entry">

                                <a href="/editProject?projectId=${project.projectId}" class="btn btn-info">
                                    Edit Project
                                </a>

                            </li>
                           </c:if>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>


    </li>
    </ul>


    <%--------------------------------------------------------------Change Task - MODAL -----------------------------------------------------------------------%>

    <div class="modal fade" id="changeTaskModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="changemodal">Change Task</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                        <%--  MIT AJAX MACHEN ?  --%>
                    <! ---------------- Task Name & Description ---------------- -->
                        <%--@elvariable id="task" type="at.fhj.ima.kanbancollab.kanbancollab.entities.Task"--%>
                    <form:form id="changeTaskForm" method="POST" action="/changeTask">
                        <div class="container">
                            <div class="row changeTask">
                                <label for="ctask_name">Task Name: </label>
                            </div>
                            <div class="row changeTask">
                                <input type="text" id="ctask_name" maxlength="64" value="${task.name}"
                                       required="required">
                                    <%-- <form:input type="text" value="" id="task_name_input"/> --%>

                            </div>
                            <div class="row changeTask">
                                <label for="ctask_description">Description: </label>
                            </div>
                            <div class="row changeTask">
                                <textarea id="ctask_description" maxlength="240"></textarea>
                                    <%-- <form:input type="text" path="description" id="task_description_input"/> --%>
                            </div>
                            <input type="hidden" id="ctask_id" name="tId" value="${task.taskId}"/>

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" id="task_submit" class="btn btn-secondary">Change</button>
                        </div>
                    </form:form>


                </div>
                <div class="modal-footer">


                </div>

            </div>
        </div>
    </div>
    <%-------------------------------------------------- End of Modal -----------------------------------------------------------------%>


    </div>


</layout:page-container>

