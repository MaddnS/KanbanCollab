<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">--%>


<layout:page-container title="Create an account" activePage="registerUser">
<div class="registerForm">
    <%--@elvariable id="UserDto" type="at.fhj.ima.kanbancollab.kanbancollab.dto.UserDto"--%>
    <form:form modelAttribute="UserDto" class="needs-validation form-horizontal" method="post"
               action="addUser" novalidate="novalidate">
        <div>
            <div style="font-size: 16px; text-align: center; padding-top: 40px; color: gray">
                Join KanbanCollab!
            </div>
            <div style="font-weight: 500; font-size: 48px; text-align: center; padding-bottom: 20px">
            Create your account
            </div>
            <! ---------------- FirstName ---------------- -->
            <div class="form-group">
                <label for="inputFirstName" class="registerText">First name *</label>
                <div class="registerInput">
                    <form:input id="inputFirstName" path="firstName" type="text" class="form-control"
                                required="required"/>
                    <form:errors path="firstName" cssClass="invalid-feedback d-block"/>
                </div>
            </div>

            <! ---------------- LastName ---------------- -->
            <div class="form-group">
                <label for="inputLastName" class="registerText">Last name *</label>
                <div class="registerInput">
                    <form:input id="inputLastName" path="lastName" type="text" class="form-control"
                                required="required"/>
                    <form:errors path="lastName" cssClass="invalid-feedback d-block"/>
                </div>
            </div>

            <! ---------------- Username ---------------- -->
            <div class="form-group">
                <label for="inputUsername" class="registerText">Username *</label>
                <div class="registerInput">
                    <form:input id="inputUsername" path="username" type="text" class="form-control"
                                required="required"/>
                    <form:errors path="username" cssClass="invalid-feedback d-block"/>
                </div>
            </div>

            <! ---------------- Email ---------------- -->
            <div class="form-group">
                <label for="inputEmail" class="registerText">Email address *</label>
                <div class="registerInput">
                    <form:input id="inputEmail" path="email" type="text" class="form-control"
                                required="required"/>
                    <form:errors path="email" cssClass="invalid-feedback d-block"/>
                </div>
            </div>

            <! ---------------- Password ---------------- -->
            <div class="form-group">
                <label for="inputPassword" class="registerText">Password *</label>
                <div class="registerInput">
                    <form:input id="inputPassword" path="password" type="password" class="form-control"
                                required="required"/>
                    <form:errors path="password" cssClass="invalid-feedback d-block"/>
                </div>
            </div>

            <! ---------------- Confirm Password ---------------- -->
            <div class="form-group">
                <label for="inputConfirmPassword" class="registerText">Confirm your password *</label>
                <div class="registerInput">
                    <form:input id="inputConfirmPassword" path="confirmPassword" type="password" class="form-control"
                                required="required"/>
                    <form:errors path="confirmPassword" cssClass="invalid-feedback d-block"/>
                </div>
            </div>

            <! ---------------- buttons ---------------- -->
            <div style="padding-top: 15px">
                    <button type="submit" style="width: 100%; padding:10px" class="btn btn-primary">Create account</button>
            </div>
            <! ---------------- buttons ---------------- -->
            <div style="text-align: center">
            <a href="login" style="color: gray; font-size: 14px" class="btn btn-default">Cancel</a>
            </div>
        </div>
    </form:form>
</div>
</layout:page-container>