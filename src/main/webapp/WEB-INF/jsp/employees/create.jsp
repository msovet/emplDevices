<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">
<head>
    <%@page pageEncoding="UTF-8" %>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Create</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <form:form modelAttribute="employee" action="/employees/create" method="post">
                <!-- 2 column grid layout with text inputs for the first and last names -->
                <div class="row mb-4">
                    <div class="col">
                        <div class="form-outline">
                            <input type="text" id="form6Example1" name="firstName"
                                   class="form-control <form:errors path="firstName">is-invalid</form:errors>/>">
                            <label class="form-label" for="form6Example1">First name</label>
                            <form:errors path="firstName"/>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-outline">
                            <input type="text" id="form6Example2" name="lastName"
                                   class="form-control <form:errors path="lastName">is-invalid</form:errors>"/>
                            <label class="form-label" for="form6Example2">Last name</label>
                            <form:errors path="lastName"/>
                        </div>
                    </div>
                </div>

                <!-- Email input -->
                <div class="form-outline mb-4">
                    <input type="email" id="form6Example5" name="email" class="form-control <form:errors path="email">is-invalid</form:errors>"/>
                    <label class="form-label" for="form6Example5">Email</label>
                    <form:errors path="email"/>
                </div>


                Gender:
                <div class="form-check d-inline-block justify-content-center mb-4">
                    <input type="radio" name="gender" value="male" checked="checked" class="justify-content-center"/>
                    <p>Male</p>
                </div>
                <div class="form-check d-inline-block justify-content-center mb-4">
                    <input type="radio" name="gender" value="female" class="justify-content-center"/>
                    <p>Female</p>
                </div>

                <!-- Checkbox -->
<%--                <div class="form-check d-flex justify-content-center mb-4">--%>
<%--                    <input--%>
<%--                            class="form-check-input me-2"--%>
<%--                            type="checkbox"--%>
<%--                            value="male"--%>
<%--                            id="form6Example8"--%>
<%--                            checked--%>
<%--                    />--%>
<%--                </div>--%>

                <button type="submit" value="Submit" class="btn btn-primary btn-block mb-4">Создать</button>

                <h4> ${message} </h4>

                <a href="/employees">All Employees List</a>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
