<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="icon" type="image/png" href="<c:url value="/res/images/icons/favicon.ico"/>">
    <link href="<c:url value="/res/css/main.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/res/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>" rel="stylesheet"
          type="text/css"/>
    <link href="<c:url value="/res/vendor/animate/animate.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/res/vendor/select2/select2.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/res/vendor/perfect-scrollbar/perfect-scrollbar.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/res/css/util.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/res/css/main.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/res/css/style.css"/>" rel="stylesheet" type="text/css"/>
    <script src="<c:url value="/res/js/1.js"/>"></script>
    <script src="<c:url value="/res/js/2.js"/>"></script>
    <script src="<c:url value="https://cdn.jsdelivr.net/npm/sweetalert2@8"/>"></script>
    <script src="<c:url value="https://unpkg.com/sweetalert/dist/sweetalert.min.js"/>"></script>
    <title>Components</title>
</head>
<body>
<div class="limiter">
    <div class="container-table100">
        <div class="wrap-table100">
            <p class="table100">
            <div>
                <div class="header">
                    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                        <a class="navbar-brand" href="/search"><img src="<c:url value="/res/computer2.png"/>" width="45"
                                                                    height="45" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false"
                                aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarCollapse">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <h5><a class="nav-link" href="/search">Главная <span
                                            class="sr-only">(current)</span></a></h5>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" onClick="myScript(${compCount}, ${buildPC})">Склад</a>
                                </li>
                                <form style="margin-left: 25px" method="POST" action="/select">
                                    <select class="custom-select mr-sm-2" id="inlineFormCustomSelect"
                                            style="width: 230px" onchange="this.form.submit()"
                                            name="needSelect">
                                        <option value="all" ${needSelect == "all" ? "selected" : ""}>Все компоненты
                                        </option>
                                        <option value="need" ${needSelect == "need" ? "selected" : ""}>Только
                                            необходимые
                                        </option>
                                        <option value="notNeed" ${needSelect == "notNeed" ? "selected" : ""}>Только
                                            опциональные
                                        </option>
                                    </select>
                                </form>
                            </ul>
                            <form class="form-inline mt-2 mt-md-0" method="post" action="/search" name="searchName">
                                <input class="form-control mr-sm-2" type="text" name="searchName"
                                       placeholder="Искать здесь..." aria-label="Search">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                            </form>
                        </div>
                    </nav>
                </div>
                <table>
                    <thead>
                    <tr class="table100-head">
                        <th class="column1">Наименование</th>
                        <th class="column2">Необходимость</th>
                        <th class="column3">Количество</th>
                        <th class="column4"></th>
                        <th class="column5"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="components" items="${compList1}">
                        <tr>
                            <td class="column1">${components.title}</td>


                            <c:if test="${components.necessary}">
                                <td class="column2">Да</td>
                            </c:if>
                            <c:if test="${!components.necessary}">
                                <td class="column2">Нет</td>
                            </c:if>


                            <td class="column3">${components.quantity}</td>
                            <td class="column4"><a href="/edit/${components.id}"><img
                                    src="<c:url value="/res/edit.png"/>" alt="Edit" width="40px" height="40"></a>
                            </td>
                            <td class="column5"><a onclick="youSure(${components.id})"><img
                                    src="<c:url value="/res/delete9.png"/>" alt="Delete" width="39px" height="39px"></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <table style="margin-top: 15px">
                <tbody id="ttable">
                <tr>
                    <td class="newcol1">
                        <span>Всего: ${compCount} </span>
                    </td>

                    <td colspan="3" class="newcol1">
                        <div class="pag">
                            <nav aria-label="...">
                                <ul style="margin: 2px 50px" class="pagination pagination-sm p-l-200">
                                    <c:url value="/" var="url">
                                        <c:param name="page" value="${page - 1}"/>
                                    </c:url>
                                    <c:if test="${page > 1}">
                                        <li class="page-item"><a class="page-link" href="${url}"
                                                                 aria-label="Previous"><span
                                                aria-hidden="true">&laquo;</span></a></li>
                                    </c:if>

                                    <c:forEach begin="${1}" end="${pagesCount}" step="1" varStatus="i">
                                        <c:url value="/" var="url">
                                            <c:param name="page" value="${i.index}"/>
                                        </c:url>
                                        <c:set value="current-page" var="current"/>
                                        <c:set value="" var="perspective"/>
                                        <c:if test="${page == i.index}">
                                            <li class="page-item active"><a class="page-link"
                                                                            href="${url}">${i.index}</a></li>
                                        </c:if>
                                        <c:if test="${page != i.index}">
                                            <li class="page-item"><a class="page-link" href="${url}">${i.index}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:url value="/" var="url">
                                        <c:param name="page" value="${page + 1}"/>
                                    </c:url>

                                    <c:if test="${page < pagesCount}">
                                        <li class="page-item"><a class="page-link" href="${url}" aria-label="Next"><span
                                                aria-hidden="true">&raquo;</span></a></li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </td>

                    <td class="newcol2">
                        <span class="build">Можно собрать: ${buildPC} ПК </span>
                    </td>
                </tr>
                </tbody>
            </table>


            <c:url value="/add" var="add"/>
            <a href="${add}">
                <button style="float: right" type="button"
                        class="mt-3 btn color btn-success btn-lg rounded">Добавить
                </button>
            </a>
        </div>
    </div>
</div>


<script src="<c:url value="/res/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/res/vendor/bootstrap/js/popper.js"/>"></script>
<script src="<c:url value="/res/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/res/vendor/select2/select2.min.js"/>"></script>
<script src="<c:url value="/res/js/main.js"/>"></script>


</body>
</html>