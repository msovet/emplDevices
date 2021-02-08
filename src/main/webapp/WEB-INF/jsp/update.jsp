<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">
<head>
    <%@page pageEncoding="UTF-8" %>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Update</title>
</head>
<body>

<form:form modelAttribute="employee" action="/employees/${employee.id}/update" method="post">
    <label for="firstName">Username</label>

    <input name="firstName"
           id="firstName"
           class="form-control <form:errors path="firstName">is-invalid</form:errors>"
           type="text"
           value="<c:if test="${not empty employee}">${employee.firstName}</c:if>">
    <form:errors path="firstName"/>
    <br><br>
    <label for="lastName">Surname</label>
    <input name="lastName"
           id="lastName"
           class="form-control <form:errors path="lastName">is-invalid</form:errors>"
           type="text"
           value="<c:if test="${not empty employee}">${employee.lastName}</c:if>">
    <form:errors path="lastName"/>
    <br><br>
    <label for="email">Email</label>
    <input name="email"
           id="email"
           class="form-control <form:errors path="email">is-invalid</form:errors>"
           placeholder="email"
           type="text"
           value="<c:if test="${not empty employee}">${employee.email}</c:if>">
    <form:errors path="email"/>
    <br><br>
    <%--    <input type="submit" value="Submit"/>--%>
    <button type="submit" value="Submit" class="btn btn-primary btn-block">Обновить</button>

    <h4> ${message} </h4>
</form:form>

</body>
</html>
