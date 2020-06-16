<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<html>
<head></head>
<body>
<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <%--@elvariable id="UserDto" type="at.fhj.ima.kanbancollab.kanbancollab.dto.UserDto"--%>
        <form:form modelAttribute="UserDto" class="needs-validation form-horizontal" method="post"
                   action="addUser" novalidate="novalidate">
            <fieldset>
                <legend>Create your account</legend>

                <! ---------------- FirstName ---------------- -->
                <div class="form-group">
                    <label for="inputFirstName" class="col-md-2 control-label">First name*</label>
                    <div class="col-md-10">
                        <form:input id="inputFirstName" path="firstName" type="text" class="form-control"
                                    required="required"/>
                        <form:errors path="firstName" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- LastName ---------------- -->
                <div class="form-group">
                    <label for="inputLastName" class="col-md-2 control-label">Last name*</label>
                    <div class="col-md-10">
                        <form:input id="inputLastName" path="lastName" type="text" class="form-control"
                                    required="required"/>
                        <form:errors path="lastName" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- Username ---------------- -->
                <div class="form-group">
                    <label for="inputUsername" class="col-md-2 control-label">Username*</label>
                    <div class="col-md-10">
                        <form:input id="inputUsername" path="username" type="text" class="form-control"
                                    required="required"/>
                        <form:errors path="username" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- Email ---------------- -->
                <div class="form-group">
                    <label for="inputEmail" class="col-md-2 control-label">Email address*</label>
                    <div class="col-md-10">
                        <form:input id="inputEmail" path="email" type="text" class="form-control"
                                    required="required"/>
                        <form:errors path="email" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- Password ---------------- -->
                <div class="form-group">
                    <label for="inputPassword" class="col-md-2 control-label">Password*</label>
                    <div class="col-md-10">
                        <form:input id="inputPassword" path="password" type="password" class="form-control"
                                    required="required"/>
                        <form:errors path="password" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- Confirm Password ---------------- -->
                <div class="form-group">
                    <label for="inputConfirmPassword" class="col-md-2 control-label">Confirm your password*</label>
                    <div class="col-md-10">
                        <form:input id="inputConfirmPassword" path="confirmPassword" type="password" class="form-control"
                                    required="required"/>
                        <form:errors path="confirmPassword" cssClass="invalid-feedback d-block"/>
                    </div>
                </div>

                <! ---------------- buttons ---------------- -->
                <div class="form-group">
                    <div class="col-md-10 col-md-offset-2">
                        <button type="submit" class="btn btn-primary">Create account</button>
                    </div>
                </div>
            </fieldset>
        </form:form>
    </div>
</div>
</body>
</html>