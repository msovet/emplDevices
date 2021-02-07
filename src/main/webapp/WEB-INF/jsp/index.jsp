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
        <h4>| ${employee.id} | ${employee.firstName} | ${employee.lastName} | ${employee.email} | ${employee.gender}</h4>
    </c:forEach>
</c:if>

<%--<a href="${pageContext.request.contextPath}/personList">Person List</a>--%>

</body>


</html>