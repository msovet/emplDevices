<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">
<head>
    <%@page pageEncoding="UTF-8" %>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Create</title>
</head>
<body>

<form:form modelAttribute="employee" action="/employees/create" method="post">
    <input name="firstName"
           class="form-control <form:errors path="firstName">is-invalid</form:errors>"
           placeholder="Username"
           type="text">
    <form:errors path="firstName"/>
    <br><br>
    <input name="lastName"
           class="form-control <form:errors path="lastName">is-invalid</form:errors>"
           placeholder="lastName"
           type="text">
    <form:errors path="lastName"/>
    <br><br>
    <input name="email"
           class="form-control <form:errors path="email">is-invalid</form:errors>"
           placeholder="email"
           type="text">
    <form:errors path="email"/>
    <br><br>
    Gender: <input type="radio" name="gender" value="male" checked="checked"/> <p>Male</p>|
    <input type="radio" name="gender" value="female"/> <p>Female</p>
    <br><br>
    <%--    <input type="submit" value="Submit"/>--%>
    <button type="submit" value="Submit" class="btn btn-primary btn-block">Создать</button>

    <h4> ${message} </h4>

    <a href="/employees">All Employees List</a>
</form:form>

</body>
</html>
