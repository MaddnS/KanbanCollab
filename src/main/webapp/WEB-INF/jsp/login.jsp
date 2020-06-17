<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<c:url value="/login" var="loginUrl"/>


<form:form action="${loginUrl}" method="post">
    <c:if test="${param.error != null}">
        <p>
            Invalid username and password.
        </p>
    </c:if>
    <c:if test="${param.logout != null}">
        <p>
            You have been logged out.
        </p>
    </c:if>
    <p>
        <label for="username">Username</label>
        <input type="text" id="username" name="username"/>
    </p>
    <p>
        <label for="password">Password</label>
        <input type="password" id="password" name="password"/>
    </p>
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
    <button type="submit" class="btn">Log in</button>
</form:form>
<%--
	<!-- loginProcessingUrl should correspond to FormLoginConfigurer#loginProcessingUrl. Don't forget to perform a POST -->
	 <c:url value="/login" var="loginUrl"/>
	  <form:form action="${loginUrl}" method="post">
	     <fieldset>
	         <legend>Please Login</legend>
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
	         <p>
	         <label for="username">Username</label>
	         <input type="text" id="username" name="username"/>
	         </p>
	         <p>
	         <label for="password">Password</label>
	         <input type="password" id="password" name="password"/>
	         </p>
	         <!-- if using RememberMeConfigurer make sure remember-me matches RememberMeConfigurer#rememberMeParameter -->
	         <p>
	         <label for="remember-me">Remember Me?</label>
	         <input type="checkbox" id="remember-me" name="remember-me"/>
	         </p>
	         <div>
	             <button type="submit" class="btn">Log in</button>
	         </div>
	     </fieldset>
	  </form:form>
--%>