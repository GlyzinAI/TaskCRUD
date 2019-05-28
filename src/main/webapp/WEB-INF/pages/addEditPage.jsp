<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="icon" type="image/png" href="<c:url value="/res/add-editPage/images/icons/favicon.ico"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/res/add-editPage/images/icons/favicon.ico"/>"/>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/res/add-editPage/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/res/add-editPage/vendor/animate/animate.css"/>"/>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/res/add-editPage/vendor/css-hamburgers/hamburgers.min.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/res/add-editPage/vendor/select2/select2.min.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/res/add-editPage/css/util.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/res/add-editPage/css/main.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/res/add-editPage/css/style.css"/>"/>

    <c:choose>
        <c:when test="${empty comp.title}">
            <title>Add</title>
        </c:when>
        <c:otherwise>
            <title>Edit</title>
        </c:otherwise>
    </c:choose>
</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <a href="<c:url value="/?page=${page}"/>">
                    <img src="<c:url value="/res/add-editPage/images/img-01.png"/>" alt="IMG"/>
                </a>
            </div>

            <c:url value="/add" var="addUrl"/>
            <c:url value="/edit" var="editUrl"/>

            <form class="login100-form validate-form" action="${empty comp.title ? addUrl : editUrl}" name="comp"
                  method="POST">
                <c:choose>
                    <c:when test="${!empty comp.title}">
					<span class="login100-form-title">
                        <h2>Редактировать</h2>
					</span>

                        <input type="hidden" name="id" value="${comp.id}">

                    </c:when>
                    <c:otherwise>
                        <span class="login100-form-title">
                            <h2>Добавить</h2>
					</span>
                    </c:otherwise>
                </c:choose>

                <div class="wrap-input100 validate-input" data-validate="Пожалуйста, введите наименование">
                    <input class="input100" type="text" name="title" placeholder="Наименование" value="${comp.title}"
                           required>
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                        <i class="fa fa-sort-alpha-asc"></i>
						</span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Пожалуйста, введите число">
                    <input class="input100" type="number" name="quantity" placeholder="Количество"
                           value="${comp.quantity}" maxlength="4" size="4"
                           min="0" max="9999" required/>
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                        <i class="fa fa-sort-numeric-asc"></i>
						</span>
                </div>


                <div>
                    <label class="switch">
                        <c:if test="${comp.necessary == true}">
                            <input type="checkbox" name="necessary" id="necessary" value="${comp.necessary}" checked>
                        </c:if>
                        <c:if test="${comp.necessary != true}">
                            <input type="checkbox" name="necessary" id="necessary">
                        </c:if>
                        <span class="slider round"></span>
                        <span class="absolute-no">Опционально</span>
                    </label>
                </div>
                <div class="container-login100-form-btn">
                    <c:set value="add" var="add"/>
                    <c:set value="edit" var="edit"/>
                    <button type="submit" class="login100-form-btn" value="${empty comp.title ? add : edit}">
                        Сохранить
                    </button>
                </div>

                <div class="text-center p-t-12">
						<span class="txt1">
							<input type="reset" value="Сбросить все изменения">
						</span>
                </div>

                <div class="text-center p-t-136">
                    <a class="txt2" href="<c:url value="/?page=${page}"/>">
                        Вернуться назад
                        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="<c:url value="/res/add-editPage/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/res/add-editPage/vendor/bootstrap/js/popper.js"/>"></script>
<script src="<c:url value="/res/add-editPage/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/res/add-editPage/vendor/select2/select2.min.js"/>"></script>
<script src="<c:url value="/res/add-editPage/js/main.js"/>"></script>
<script src="<c:url value="/res/add-editPage/vendor/tilt/tilt.jquery.min.js"/>"></script>
<script src="<c:url value="https://unpkg.com/sweetalert/dist/sweetalert.min.js"/>"></script>

<c:if test="${message == 'Exist'}">
    <script>
        swal("Oops", "Компонент с таким наименованием уже существует!", "error")
    </script>
</c:if>


<script>
    $('.js-tilt').tilt({
        scale: 1.1
    })
</script>
</body>
</html>