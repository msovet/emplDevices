<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Employees</title>
</head>
<body>

<c:if test="${not empty employees}">
    <c:forEach var="employee" items="${employees}">
        <a href="/employees/${employee.id}"> Show | </a> <a href="/employees/${employee.id}/update"> Update </a>| ${employee.id} | ${employee.firstName} | ${employee.lastName} | ${employee.email} | ${employee.gender}
        <a href="/employees/${employee.id}/delete"> Delete | </a>
        <br>
        <br>
    </c:forEach>
</c:if>

<%--<a href="${pageContext.request.contextPath}/personList">Person List</a>--%>

</body>


</html>