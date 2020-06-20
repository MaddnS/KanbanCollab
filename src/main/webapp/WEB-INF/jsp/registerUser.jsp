<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<head>
    <link rel="stylesheet" href="<c:url value="css/register.css"/>">
    <title><spring:message code="register.createbutton"/></title>
</head>
<%--<layout:page-container title="Create an account" activePage="registerUser">--%>
<body>
    <div class="registerForm">
        <%--@elvariable id="UserDto" type="at.fhj.ima.kanbancollab.kanbancollab.dto.UserDto"--%>
        <form:form modelAttribute="UserDto" class="needs-validation form-horizontal" method="post"
                   action="addUser" novalidate="novalidate">
            <div>
                <div style="font-size: 16px; text-align: center; padding-top: 40px; color: gray">
                    <spring:message code="register.join"/>
                </div>
                <div style="font-weight: 500; font-size: 48px; text-align: center; padding-bottom: 20px">
                    <spring:message code="register.create"/>
                </div>
                <! ---------------- FirstName ---------------- -->
                <div class="form-group">
                    <label for="inputFirstName" class="registerText"><spring:message code="register.firstname"/></label>
                    <div class="registerInput">
                        <form:input id="inputFirstName" path="firstName" type="text" class="form-control" maxlength="64"
                                    required="required"/>
                        <form:errors path="firstName" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- LastName ---------------- -->
                <div class="form-group">
                    <label for="inputLastName" class="registerText"><spring:message code="register.lastname"/></label>
                    <div class="registerInput">
                        <form:input id="inputLastName" path="lastName" type="text" class="form-control" maxlength="64"
                                    required="required"/>
                        <form:errors path="lastName" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- Username ---------------- -->
                <div class="form-group">
                    <label for="inputUsername" class="registerText"><spring:message code="register.username"/></label>
                    <div class="registerInput">
                        <form:input id="inputUsername" path="username" type="text" class="form-control" maxlength="32"
                                    required="required"/>
                        <form:errors path="username" cssClass="invalid-feedback d-block"/>
                        <div class="invalid-feedback">
                            usernamsdasiudsaijdasdsa
                        </div>
                    </div>
                </div>

                <! ---------------- Email ---------------- -->
                <div class="form-group">
                    <label for="inputEmail" class="registerText"><spring:message code="register.email"/></label>
                    <div class="registerInput">
                        <form:input id="inputEmail" path="email" type="email" class="form-control" maxlength="320"
                                    required="required"/>
                        <form:errors path="email" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- Password ---------------- -->
                <div class="form-group">
                    <label for="inputPassword" class="registerText"><spring:message code="register.password"/></label>
                    <div class="registerInput">
                        <form:input id="inputPassword" path="password" type="password" class="form-control"
                                    maxlength="128" required="required"/>
                        <form:errors path="password" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- Confirm Password ---------------- -->
                <div class="form-group">
                    <label for="inputConfirmPassword" class="registerText"><spring:message code="register.confirm"/></label>
                    <div class="registerInput">
                        <form:input id="inputConfirmPassword" path="confirmPassword" type="password" class="form-control"
                                    maxlength="128" required="required"/>
                        <form:errors path="confirmPassword" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- buttons ---------------- -->
                <div style="padding-top: 15px">
                        <button type="submit" style="width: 100%; padding:10px" class="btn btn-primary"><spring:message code="register.createbutton"/></button>
                </div>
                <! ---------------- buttons ---------------- -->
                <div style="text-align: center">
                <a href="login" style="color: gray; font-size: 14px" class="btn btn-default"><spring:message code="register.cancel"/></a>
                </div>
            </div>
        </form:form>
    </div>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <script type="text/javascript" src="<c:url value="/js/validation.js"/>"></script>
</body>
<%--</layout:page-container>--%>