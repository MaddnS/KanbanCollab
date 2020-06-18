<%@ attribute name="title" required="true" %>
<%@ attribute name="activePage" required="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <bootstrap:bootstrap-metadata/>
        <title>${title}</title>
        <bootstrap:bootstrap-css/>

        <c:if test="${activePage == 'listProjects' or activePage == 'editProjects'}">
                <link rel="stylesheet" href="<c:url value="/css/custom.css"/>">
        </c:if>

        <c:if test="${activePage == 'viewProject'}">
                <meta name="_csrf" content="${_csrf.token}">
                <meta name="_csrf_header" content="${_csrf.headerName}">
                <link rel="stylesheet" href="<c:url value="/css/kanban.css"/>">
        </c:if>

        <%--<c:if test="${activePage == 'login'}">
                <link rel="stylesheet" href="<c:url value="/css/login.css"/>">
        </c:if>

        <c:if test="${activePage == 'registerUser'}">
                <link rel="stylesheet" href="<c:url value="/css/register.css"/>">
        </c:if>--%>

</head>
<body>
        <c:if test="${activePage == 'listProjects' or  activePage == 'editProject' or  activePage == 'viewProject'}">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                <a class="navbar-brand" href="/">
                        <svg class="bi bi-kanban-fill" width="1.4em" height="1.4em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M2.5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h11a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2h-11zm5 2a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h1a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1h-1zm-5 1a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1V3zm9-1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h1a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1h-1z"/>
                        </svg> KanbanCollab</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="nav navbar-nav navbar-center" style="font-size: large; font-weight: bold">

                <%-- <c:if test="${activePage == 'listProjects' or activePage == 'editProjects'}">
                    <c:set var="projectsMenuActive">active</c:set>
                </c:if> --%>

                        <c:if test="${activePage == 'viewProject'}">
                                ${project.name}
                        </c:if>
                <%-- <li class="nav-item ${projectsMenuActive} dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                Projects
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="/listProjects">List Projects</a>
                <%--<sec:authorize access="hasAuthority('ROLE_ADMIN')">
                        <a class="dropdown-item" href="/editEmployee">Create Employee</a>
                </sec:authorize>--%>


                    <%--    </div>
                </li> --%>
                </ul>
                <ul class="navbar-nav ml-auto" style="white-space: normal ">
                        <c:if test="${currentUser.username != null}">
                        <div style="align-self: center">
                        Logged in as ${currentUser.username} |
                        </div>
                        </c:if>
                        <form:form method="post" action="/logout">
                                <button class="btn btn-link" style="align-items: center" type="submit">Log Out</button>
                        </form:form>
                </ul>
                </div>
                </div>
                </nav>
        </c:if>
        <div class="container" role="main">
        <div class="page-header" style="margin-bottom:25px"/>
        <!-- Messages ----------------------------------------------------------- -->

        <!-- Error message ----------------------------------------------------------- -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">${errorMessage}</div>
        </c:if>
        <!-- Error message ----------------------------------------------------------- -->

        <!-- Warning message ----------------------------------------------------------- -->
        <c:if test="${not empty warningMessage}">
            <div class="alert alert-warning" role="warning">${warningMessage}</div>
        </c:if>
        <!-- Warning message ----------------------------------------------------------- -->

        <!-- successful message ----------------------------------------------------------- -->
        <c:if test="${not empty message}">
            <div class="alert alert-success" role="warning">${message}</div>
        </c:if>
        <!-- successful message ----------------------------------------------------------- -->

        <!-- Messages ----------------------------------------------------------- -->
        <jsp:doBody/>

        </div>
        <bootstrap:bootstrap-js/>
        <script type="text/javascript" src="<c:url value="/js/custom.js"/>"></script>
</body>
</html>
