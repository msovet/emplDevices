<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<%--    <link rel="stylesheet" type="text/css" href="/WEB-INF/view/style/styles.css">--%>
    <title>Employees</title>
</head>
<body>

<c:if test="${not empty employees}">
    <c:forEach var="employee" items="${employees}">
        <a href="/employees/${employee.id}"> Show | </a> <a href="/employees/${employee.id}/update"> Update </a>| ${employee.id} | ${employee.firstName} | ${employee.lastName} | ${employee.email} | ${employee.gender}
        <a href="/employees/${employee.id}/delete" class="btn btn-primary"> | Delete | </a>
        <a href="/employees/create" class="navbar-brand">| Create | </a>
        <br>
        <br>
    </c:forEach>
</c:if>

<%--<a href="${pageContext.request.contextPath}/personList">Person List</a>--%>

</body>


</html>