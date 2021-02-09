<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
...
<!doctype html>
<html lang="en">
<head>
    <%@page pageEncoding="UTF-8" %>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Create Device</title>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
</head>
<body>
<a href=""> | Add Device | </a>

<form:form modelAttribute="device" action="/employees/${id}/device" method="post">
    <input name="category"
           class="form-control <form:errors path="category">is-invalid</form:errors>"
           placeholder="Category"
           type="text">
    <form:errors path="category"/>
    <br><br>
    <input name="name"
           class="form-control <form:errors path="name">is-invalid</form:errors>"
           placeholder="name"
           type="text">
    <form:errors path="name"/>
    <br><br>
    <input name="price"
           class="form-control <form:errors path="price">is-invalid</form:errors>"
           placeholder="price"
           type="text">
    <form:errors path="price"/>
    <br><br>
    <label for="datepicker">Enter date:</label>
    <input type="text" name="date" id="datepicker">
    <br><br>
    <%--    <input type="submit" value="Submit"/>--%>
    <button type="submit" value="Submit" class="btn btn-primary btn-block">Создать</button>

    <h4> ${message} </h4>

    <a href="/employees">All Employees List</a>
</form:form>

</body>
</html>
