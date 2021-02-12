<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <%@page pageEncoding="UTF-8" %>
    <%@include file="imports.jsp" %>
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


            <c:if test="${not empty devices}">
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

                                <button type="button" data-toggle="modal" data-target="#exampleModalCenterUpdate" class="btn btn-primary">
                                    <i class="fas fa-edit"></i>
                                </button>

                                    <%--                                <a href="/employees/${employee.id}/delete" class="btn btn-danger"><i--%>
                                    <%--                                        class="far fa-trash-alt"></i></a>--%>
                            </td>
                        </tr>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModalCenterUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
                             aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalCenterTitle">Add Device</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form:form modelAttribute="device" action="/employees/${id}/device" method="post">
                                            <input name="category"
                                                   class="form-control"
                                                   placeholder="Category"
                                                   type="text"
                                                   value="<c:if test="${not empty device}">${device.category}</c:if>">
<%--                                            <form:errors path="category"/>--%>
                                            <br>
                                            <input name="name"
                                                   class="form-control"
<%--                                                   <form:errors path="name">is-invalid</form:errors>--%>
                                                   placeholder="name"
                                                   type="text"
                                                   value="<c:if test="${not empty device}">${device.name}</c:if>">
<%--                                            <form:errors path="name"/>--%>
                                            <br>
                                            <input name="price"
                                                   class="form-control"
                                                   placeholder="price"
                                                   type="text"
                                                   value="<c:if test="${not empty device}">${device.price}</c:if>">
<%--                                            <form:errors path="price"/>--%>
                                            <br>
                                            <label for="datepicker">Enter date:</label>
                                            <input type="text" name="date" id="datepicker">
                                            <br><br>
                                            <button type="submit" value="Submit" class="btn btn-primary btn-block">
                                                Создать
                                            </button>
                                            <h4> ${message} </h4>

                                            <div class="col-md-12 text-center">
                                                <button class="btn btn-link">
                                                    <a href="/employees">All Employees List</a>
                                                </button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>


            <a href="/employees" class="btn btn-secondary">All Employees List</a>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                Add Device
            </button>
        </div>
    </div>
</div>
<%@include file="createDeviceModal.jsp" %>
</body>
</html>
