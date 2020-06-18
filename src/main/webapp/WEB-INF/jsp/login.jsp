<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>


<layout:page-container title="Sign in to Github" activePage="login">
    <!-- loginProcessingUrl should correspond to FormLoginConfigurer#loginProcessingUrl. Don't forget to perform a POST -->
     <c:url value="/login" var="loginUrl"/>
      <form:form action="${loginUrl}" method="post">
         <div class="authForm">
             <div class="authFormHeader">
             <a class="navbar-brand" href="/">
                 <svg class="bi bi-kanban-fill" width="3em" height="3em" viewBox="0 0 16 16" fill="gray" xmlns="http://www.w3.org/2000/svg">
                     <path fill-rule="evenodd" d="M2.5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h11a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2h-11zm5 2a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h1a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1h-1zm-5 1a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1V3zm9-1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h1a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1h-1z"/>
                 </svg>
             </a><br>
             Sign in to KanbanCollab
             </div>
             <!-- use param.error assuming FormLoginConfigurer#failureUrl contains the query parameter error -->
             <c:if test="${param.error != null}">
                 <div>
                     Failed to login.
                     <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                       Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
                     </c:if>
                 </div>
             </c:if>
             <!-- the configured LogoutConfigurer#logoutSuccessUrl is /login?logout and contains the query param logout -->
             <c:if test="${param.logout != null}">
                 <div>
                     You have been logged out.
                 </div>
             </c:if>
             <div class="authInput">
                 <p>
                 <label class="inputFieldText" for="username">Username</label><br>
                 <input type="text" class="inputField" id="username" name="username"/>
                 </p>
                 <p>
                 <label class="inputFieldText" for="password">Password</label><br>
                 <input type="password" class="inputField" id="password" name="password"/>
                 </p>
                 <!-- if using RememberMeConfigurer make sure remember-me matches RememberMeConfigurer#rememberMeParameter -->
                 <p>
                 <label for="remember-me">Remember me?</label>
                 <input type="checkbox" id="remember-me" name="remember-me"/>
                 </p>
                 <div>
                     <button type="submit" style="width: 100%" class="btn btn-success">Log in</button>
                 </div>
             </div>
         </div>
        <div class="registerForm">
            New to KanbanCollab?<br>
            <a href="registerUser" style="color: #0366d6; font-size: 14px" class="btn btn-default">Create an account</a>
        </div>
      </form:form>
</layout:page-container>