<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <%@page pageEncoding="UTF-8" %>
    <%@include file="imports.jsp"%>
    <%--    <style><%@include file="/WEB-INF/css/style.css"%></style>--%>
    <%--    <link href="<c:url value="/src/main/webapp/WEB-INF/css/main.css" />" >--%>
    <title>Employee Read</title>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-12">
                <c:if test="${not empty employee}">
                    <h3 class="card">${employee.id}.${employee.firstName} ${employee.lastName}  </h3>
                    <h4>Email: ${employee.email}</h4>
                    <h4>Gender: ${employee.gender}</h4>
                </c:if>


                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Category</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Date</th>
                        <th scope="col">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty devices}">
                        <c:forEach var="device" items="${devices}">
                            <tr>
                                <td>${device.id}</td>
                                <td>${device.category}</td>
                                <td>${device.name}</td>
                                <td>${device.price}</td>
                                <td>${device.date} </td>
                                <td>
                                    <a href="/employees/${employee.id}/device/${device.id}/delete" class="btn btn-danger">
                                        <i class="far fa-trash-alt">
                                        </i>
                                    </a>
                                        <%--                                <a href="/employees/${employee.id}/delete" class="btn btn-danger"><i--%>
                                        <%--                                        class="far fa-trash-alt"></i></a>--%>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>


                <a href="/employees" class="btn btn-secondary">All Employees List</a>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                    Add Device
                </button>
            </div>
        </div>
    </div>
    <%@include file="createDeviceModal.jsp"%>
</body>
</html>
