<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2/8/2024
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Login - SB Admin</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
            crossorigin="anonymous"></script>
</head>
<body class="bg-primary">

<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Đăng nhập</h3></div>
                            <div class="card-body">
                                <form:form action="checkLogin" method='POST'>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputUserName" name="email" type="text"
                                               placeholder="anh@gmail"/>
                                        <label for="inputUserName">Email</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputPassword" name="password" type="password"
                                               placeholder="Password"/>
                                        <label for="inputPassword">Mật khẩu</label>
                                    </div>
                                    <c:set var="checkTk" value="${check}"/>
                                    <c:choose>
                                        <c:when test="${checkTk eq 1}">
                                            <p style="color: red"> Sai tài khoản hoặc mật khẩu</p>
                                        </c:when>
                                    </c:choose>
                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <button class="btn btn-primary" type="submit"
                                                style="margin-left: 350px !important;">Login
                                        </button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
</body>
</html>