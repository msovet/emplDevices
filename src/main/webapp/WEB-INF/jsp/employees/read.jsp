<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <%@page pageEncoding="UTF-8" %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
    <%--    <style><%@include file="/WEB-INF/css/style.css"%></style>--%>
    <%--    <link href="<c:url value="/src/main/webapp/WEB-INF/css/main.css" />" >--%>
    <title>Employee Read</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <c:if test="${not empty employee}">
                <h3 class="card">${employee.id}.${employee.firstName} ${employee.lastName}  </h3>
                <h4>Email: ${employee.email}</h4>
                <h4>Gender: ${employee.gender}</h4>
            </c:if>
            <c:if test="${not empty devices}">
            <c:forEach var="device" items="${devices}">
            <a href="/devices/${device.id}"> ${device.category} | ${device.name} | ${device.price} | ${device.date}
                |
                <a href="/employees/${employee.id}/device/${device.id}/delete">Delete Device</a>
                <br>
                    <%--        <a href="/employees/${employee.id}/delete"> | Delete | </a>--%>
                    <%--        <a href="/employees/create"> | Create | </a>--%>
                </c:forEach>
                </c:if>
                <a href="/employees" class="btn btn-secondary">All Employees List</a>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                    Add device
                    <%--                <a href="/employees/${employee.id}/device" class="btn btn-primary">Add device</a>--%>
                </button>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
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
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
