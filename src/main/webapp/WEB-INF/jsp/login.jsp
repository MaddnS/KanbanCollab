<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/login.css">
    <title>Sign in to KanbanCollab</title>
</head>
<body>
    <c:url value="/login" var="loginUrl"/>
    <form:form action="${loginUrl}" method="post">
        <div class="authForm">
            <div class="authFormHeader">
                <a class="navbar-brand" href="/">
                    <svg class="bi bi-kanban-fill" width="3em" height="3em" viewBox="0 0 16 16" fill="gray"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M2.5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h11a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2h-11zm5 2a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h1a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1h-1zm-5 1a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1V3zm9-1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h1a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1h-1z"/>
                    </svg>
                </a><br>
                <spring:message code="login.signin"/>
            </div>
            <c:if test="${param.error != null}">
                <div>
                    Failed to login.
                    <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                        Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${param.logout != null}">
                <div>
                    You have been logged out.
                </div>
            </c:if>
            <div class="authInput">
                <p>
                    <label class="inputFieldText" for="username"><spring:message code="login.username"/></label><br>
                    <input type="text" class="inputField" id="username" name="username"/>
                </p>
                <p>
                    <label class="inputFieldText" for="password"><spring:message code="login.password"/></label><br>
                    <input type="password" class="inputField" id="password" name="password"/>
                </p>
                <!-- if using RememberMeConfigurer make sure remember-me matches RememberMeConfigurer#rememberMeParameter -->
                <p>
                    <label for="remember-me"><spring:message code="login.rememberme"/></label>
                    <input type="checkbox" id="remember-me" name="remember-me"/>
                </p>
                <div>
                    <button type="submit" style="width: 100%" class="btn btn-success">
                        <spring:message code="login.login"/></button>
                </div>
            </div>
        </div>
        <div class="registerForm">
            <spring:message code="login.new"/><br>
            <a href="registerUser" style="color: #0366d6; font-size: 14px" class="btn btn-default">
                <spring:message code="login.create"/></a>
        </div>
    </form:form>
</body>
<%--</layout:page-container>--%>