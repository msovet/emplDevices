<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
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
            <a href="/employees/${employee.id}/device" class="btn btn-primary">Add device</a>
        </div>
    </div>
</div>
<%--<a href="${pageContext.request.contextPath}/personList">Person List</a>--%>

</body>


</html>