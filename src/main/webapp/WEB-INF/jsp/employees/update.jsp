<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">
<head>
    <%@page pageEncoding="UTF-8" %>
    <%@include file="imports.jsp"%>
    <title>Update</title>
</head>
    <body style="height: 100%">
        <div class="mt-5" style="height: 100%">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <form:form modelAttribute="employee" action="/employees/${employee.id}/update" method="post">
                            <!-- 2 column grid layout with text inputs for the first and last names -->
                            <div class="row mb-4">
                                <div class="col">
                                    <div class="form-outline d-flex flex-column">
                                        <input type="text" id="form6Example1" name="firstName"
                                               class="form-control <form:errors path="firstName">is-invalid</form:errors>/>"
                                               value="<c:if test="${not empty employee}">${employee.firstName}</c:if>">
                                        <div class="d-flex justify-content-center align-items-center">
                                            <label class="form-label text-center" for="form6Example1">First name</label>
                                            <form:errors path="firstName"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-outline d-flex flex-column">
                                        <input type="text" id="form6Example2" name="lastName"
                                               class="form-control <form:errors path="lastName">is-invalid</form:errors>"
                                               value="<c:if test="${not empty employee}">${employee.lastName}</c:if>"/>
                                        <div class="d-flex justify-content-center align-items-center">
                                            <label class="form-label" for="form6Example2">Last name</label>
                                            <form:errors path="lastName"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <div class="form-outline d-flex flex-column">
                                    <input type="email" id="form6Example5" name="email"
                                           class="form-control <form:errors path="email">is-invalid</form:errors>"
                                           value="<c:if test="${not empty employee}">${employee.email}</c:if>"/>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <label class="form-label" for="form6Example5">Email</label>
                                        <form:errors path="email"/>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" value="Submit" class="btn btn-primary btn-block mb-4">Обновить</button>

                            <h4> ${message} </h4>

                            <div class="col-md-12 text-center">
                                <button class="btn btn-link">
                                    <a href="/employees">All Employees List</a>
                                </button>
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#exampleModalCenter">
                                    Add Device
                                </button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal -->
        <%@include file="createDeviceModal.jsp"%>
    </body>
</html>
