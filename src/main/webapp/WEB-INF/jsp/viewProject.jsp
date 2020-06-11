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

    <div class = "container">
        <div class="row">
            <div class="col-lg-4 text-center" style="border-right: 1px solid #ccc;" >

            <h1>ToDo</h1>
            <c:forEach items="${tasks}" var="task">

                <c:if test="${task.segment == 1}">
            <div class="col text-left">
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
            </div>
                </c:if>
            </c:forEach>


            </div>
            <div class="col-lg-4 text-center" style="border-right: 1px solid #ccc;" >

                <h1>In Progress</h1>
                <c:forEach items="${tasks}" var="task">
                    <%--${listOfTasks = tasks} --%>

                    <c:if test="${task.segment == 2}">
                        <div class="col text-left">
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
                        </div>
                    </c:if>
                </c:forEach>


            </div>
            <div class="col-lg-4 text-center" >

                <h1>Done</h1>
                <c:forEach items="${tasks}" var="task">
                    <%--${listOfTasks = tasks} --%>

                    <c:if test="${task.segment == 3}">
                        <div class="col text-left">
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
                        </div>
                    </c:if>
                </c:forEach>


            </div>
        </div>
    </div>
    </form:form>
</layout:page-container>

