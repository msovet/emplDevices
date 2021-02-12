<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <%@include file="imports.jsp"%>
    <title>Employees</title>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">FirstName</th>
                    <th scope="col">Lastname</th>
                    <th scope="col">Email</th>
                    <th scope="col">Devices List</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty employees}">
                    <c:forEach var="employee" items="${employees}">
                        <tr>
                            <td>${employee.id}</td>
                            <td>${employee.firstName}</td>
                            <td>${employee.lastName}</td>
                            <td>${employee.email}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty employee.getDevices()}">
                                        <select class="form-control">
                                            <option value="#" selected="selected" disabled="disabled" style="background: cadetblue">
                                                Devices
                                            </option>
                                            <c:forEach var="device" items="${employee.getDevices()}">
                                                <option value="${device.getName()}" class="fa-optin-monster" disabled="disabled">
                                                        ${device.getName()}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </c:when>
                                    <c:otherwise>
                                        Empty Devices
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="/employees/${employee.id}" class="btn btn-primary">
                                    <i class="far fa-eye"></i>
                                </a>
                                <a href="/employees/${employee.id}/update" class="btn btn-primary"><i
                                        class="fas fa-edit"></i></a>
                                <a href="/employees/${employee.id}/delete" class="btn btn-danger"><i
                                        class="far fa-trash-alt"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
            <br>
            <a href="/employees/create" class="btn btn-primary">Create Employee</a>

        </div>
    </div>
</div>


<%--<a href="${pageContext.request.contextPath}/personList">Person List</a>--%>

</body>


</html>