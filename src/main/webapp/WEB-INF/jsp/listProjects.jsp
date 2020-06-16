<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>

<layout:page-container title="KanbanCollab" activePage="editProject">
    <!-- simple button ----------------------------------------------------------- -->
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <p>
                <a href="/editProject" class="btn btn-success">Create New Project</a>
            </p>
        </div>
    </div>
    <!-- simple button ----------------------------------------------------------- -->


    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div id="accordion">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne"
                                    aria-expanded="true" aria-controls="collapseOne">
                                My Projects
                            </button>
                        </h5>
                    </div>
                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="row">
                                <%--<c:if test="${projects.owner.userId == currentUser.userId}">--%>
                            <c:forEach items="${projects}" var="project">
                                <c:if test="${project.owner.userId == currentUser.userId}">
                                    <!---- sicher nicht der perfomanteste Weg!!! ---->
                                    <div class="col-lg-4">
                                        <div class="card-body">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col">
                                                            <a href="viewProject?projectId=${project.projectId}"
                                                               class="card-link">
                                                                <h5 class="card-title"> ${project.name}</h5>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-1">
                                                            <a href="editProject?projectId=${project.projectId}"
                                                               class="card-link">
                                                                <svg class="bi bi-three-dots-vertical" height="1.2em"
                                                                     viewBox="0 0 16 16" fill="currentColor"
                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                    <path fill-rule="evenodd"
                                                                          d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                                                </svg>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <h6 class="col-lg-9">Created by: ${project.owner.username}</h6>
                                                        <div class="col-lg-3">
                                                            <form:form method="post"
                                                                       action="/deleteProject?projectId=${project.projectId}&name=${project.name}">
                                                                <button type="submit" class="btn btn-xs btn-danger">
                                                                    <svg class="bi bi-trash" width="0.8em" height="1em"
                                                                         viewBox="0 0 16 16" fill="currentColor"
                                                                         xmlns="http://www.w3.org/2000/svg">
                                                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                                        <path fill-rule="evenodd"
                                                                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                                    </svg>
                                                                </button>
                                                            </form:form>
                                                                <%--</div>--%>
                                                        </div>
                                                    </div>
                                                    <p class="card-text">${project.description}</p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingTwo">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo"
                                    aria-expanded="false" aria-controls="collapseTwo">
                                Shared with me
                            </button>
                        </h5>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                        <div class="row">
                            <c:forEach items="${sharedProjects}" var="project">
                                <div class="col-lg-4">
                                    <div class="card-body">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col">
                                                        <a href="viewProject?projectId=${project.projectId}"
                                                           class="card-link">
                                                            <h5 class="card-title"> ${project.name}</h5>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <h6 class="col-lg-9">Created by: ${project.owner.username}</h6>
                                                </div>
                                                <p class="card-text">${project.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                    <div class="card">
                        <div class="card-header" id="adminHeading">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse"
                                        data-target="#adminCollapse" aria-expanded="false"
                                        aria-controls="adminCollapse">
                                    All projects (admin view)
                                </button>
                            </h5>
                        </div>
                        <div id="adminCollapse" class="collapse" aria-labelledby="adminHeading"
                             data-parent="#accordion">
                            <div class="row">
                                <c:forEach items="${projects}" var="project">
                                    <div class="col-lg-4">
                                        <div class="card-body">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col">
                                                            <a href="viewProject?projectId=${project.projectId}"
                                                               class="card-link">
                                                                <h5 class="card-title"> ${project.name}</h5>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-2.5">
                                                            <a href="editProject?projectId=${project.projectId}"
                                                               class="card-link">
                                                                <svg class="bi bi-three-dots-vertical" width="1em"
                                                                     height="1em" viewBox="0 0 16 16"
                                                                     fill="currentColor"
                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                    <path fill-rule="evenodd"
                                                                          d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                                                </svg>
                                                            </a>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <h6 class="col-lg-9">Created by: ${project.owner.username}</h6>
                                                            <%--<a href="deleteProject?projectId=${project.projectId}" class="card-link">--%>
                                                            <%--<div class="row">--%>
                                                        <div class="col-lg-3">
                                                            <form:form method="post"
                                                                       action="/deleteProject?projectId=${project.projectId}">
                                                                <button type="submit" class="btn btn-xs btn-danger">
                                                                    <svg class="bi bi-trash" width="0.8em" height="1em"
                                                                         viewBox="0 0 16 16" fill="currentColor"
                                                                         xmlns="http://www.w3.org/2000/svg">
                                                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                                        <path fill-rule="evenodd"
                                                                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                                    </svg>
                                                                </button>
                                                            </form:form>
                                                                <%--</div>--%>
                                                        </div>
                                                    </div>
                                                    <p class="card-text">${project.description}</p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </sec:authorize>
            </div>
        </div>
    </div>


    </div> <!-- End of container -->
</layout:page-container>