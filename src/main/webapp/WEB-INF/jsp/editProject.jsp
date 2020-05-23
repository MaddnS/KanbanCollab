<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--<layout:page-container title="KanbanCollab" activePage="editProject">--%>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <%--@elvariable id="project" type="at.fhj.ima.kanbancollab.kanbancollab.entities.Project"--%>
            <form:form modelAttribute="project" class="needs-validation form-horizontal" method="post" action="changeProject" novalidate="novalidate">
                <input type="hidden" name="id" value="<c:out value="${project.projectId}"/>">
                <fieldset>
                    <legend>Change Project ${project.projectId}</legend>

                    <! ---------------- Project Name ---------------- -->
                    <div class="form-group">
                        <label for="inputProjectName" class="col-md-2 control-label">Project Name*</label>
                        <div class="col-md-10">
                            <form:input id="inputProjectName" path="name" type="text" class="form-control" required="required"/>
                            <form:errors path="name" cssClass="invalid-feedback d-block"/>
                        </div>
                    </div>

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
                            <form:input id="inputMembers" path="members" type="text" class="form-control"/>
                            <form:errors path="members" cssClass="invalid-feedback d-block"/>
                        </div>
                    </div>

                    <! ---------------- buttons ---------------- -->
                    <div class="form-group">
                        <div class="col-md-10 col-md-offset-2">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <a href="listProjects" class="btn btn-default">Cancel</a>
                        </div>
                    </div>

                </fieldset>
            </form:form>
        </div>
    </div>
<%--</layout:page-container>--%>
