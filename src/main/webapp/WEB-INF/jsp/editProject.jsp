<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="KanbanCollab" activePage="editProject">
    <%-- <c:if test="${currentUser.userId == project.owner.userId || currentUser.username == 'admin'}"> --%><!---- temporärer Fix---->
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                    <%--@elvariable id="project" type="at.fhj.ima.kanbancollab.kanbancollab.entities.Project"--%>
                <form:form modelAttribute="project" class="needs-validation form-horizontal" method="post"
                           action="changeProject" novalidate="novalidate">
                    <input type="hidden" name="projectId" value="<c:out value="${project.projectId}"/>">

                    <fieldset>
                        <c:if test="${project.projectId != null}">
                            <legend>Change "${project.name}"</legend>
                        </c:if>
                        <c:if test="${project.projectId == null}">
                            <legend>Create New Project</legend>
                        </c:if>

                        <! ---------------- Project Name ---------------- -->
                        <div class="form-group">
                            <label for="inputProjectName" class="col-md-2 control-label">Project Name*</label>
                            <div class="col-md-10">
                                <form:input id="inputProjectName" path="name" type="text" class="form-control"
                                            required="required"/>
                                <form:errors path="name" cssClass="invalid-feedback d-block"/>
                            </div>
                        </div>

                        <! ---------------- Project Owner ---------------- -->

                        <form:input id="inputProjectOwner" path="owner.userId" type="hidden"
                                    value="${project.owner.userId == null ? currentUser.userId : project.owner.userId}"
                                    readonly="${not empty project.owner.userId || not empty currentUser.userId}"
                                    cssClass="form-control"/>

                            <%-- <form:errors path="owner.userId" cssClass="invalid-feedback d-block" /> --%>

                        <! ---------------- Description ---------------- -->
                        <div class="form-group">
                            <label for="inputDescription" class="col-md-2 control-label">Description</label>
                            <div class="col-md-10">
                                <form:input id="inputDescription" path="description" type="text" class="form-control"/>
                                <form:errors path="description" cssClass="invalid-feedback d-block"/>
                            </div>
                        </div>

                        <! ---------------- Members ---------------- -->

                        <div class="form-group">
                            <label for="inputMembers" class="col-md-2 control-label">Members</label>
                            <div class="col-md-10">
                                <form:select id="inputMembers" path="members" class="js-example-basic-multiple"
                                             style="width: 100%">
                                    <form:options items="${usersWithoutOwner}" itemValue="userId" itemLabel="username"/>
                                </form:select>
                                <form:errors path="members" cssClass="invalid-feedback d-block"/>
                            </div>
                        </div>

                        <! ---------------- buttons ---------------- -->
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-2">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <a href="listProjects" class="btn btn-default">Cancel</a>
                                    <%--<a href="deleteProject?projectId=${project.projectId}" method="post "class="btn btn-default">Delete Project</a>--%>
                                    <%--<form:form method="post" action="/deleteProject?projectId=${project.projectId}">
                                        <button type="submit" class="btn btn-xs btn-danger">Delete</button>
                                    </form:form>--%>
                                    <%--<button type="submit" class="btn btn-xs btn-danger"><spring:message code="employees.delete"/></button>--%>

                            </div>
                        </div>

                    </fieldset>
                </form:form>
            </div>
        </div>
   <%-- </c:if> --%>
</layout:page-container>

