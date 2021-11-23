<!-- Modal -->
<%@page pageEncoding="UTF-8"%>
<%@include file="imports.jsp" %>

<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
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
                    <select name="category" id="categorySelect" class="form-control">
                        <option value="#" selected="selected" disabled="disabled" style="background: cadetblue">
                            Choose category
                        </option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.getId()}" class="fa-optin-monster">
                                    ${category.getName()}
                            </option>
                        </c:forEach>
                    </select>
                    <br>
                    <input name="name"
                           class="form-control <form:errors path="name">is-invalid</form:errors>"
                           placeholder="name"
                           type="text">
                    <form:errors path="name"/>
                    <br>
                    <input name="price"
                           class="form-control <form:errors path="price">is-invalid</form:errors>"
                           placeholder="price"
                           type="text">
                    <form:errors path="price"/>
                    <br>
                    <label for="datepicker">Enter given date Berilgen kuni:</label>
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