<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Employee Read</title>
</head>
<body>

<c:if test="${not empty employee}">
    <h3>ONE EMPLOYEE</h3>
    <h4>| ${employee.id} | ${employee.firstName} | ${employee.lastName} | ${employee.email} | ${employee.gender}</h4>
</c:if>

<a href="/employees">All Employees List</a>
<a href="/employees/${employee.id}/device">Add device</a>

<%--<a href="${pageContext.request.contextPath}/personList">Person List</a>--%>

</body>


</html>