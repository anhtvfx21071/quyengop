<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 1/25/2024
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Quản trị</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

    <script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/datatables-simple-demo.js"></script>

    <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
</head>

<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/admin/">QUẢN TRỊ</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="login" role="button"><i
                        class="fas fa-user fa-fw"></i><span> Logout</span></a>

            </li>
        </ul>
    </nav>
</nav>

<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <div th:fragment="html_menu">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <a class="nav-link" href="account">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Quản lý người dùng
                        </a>
                        <a class="nav-link" href="donation">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Quản lý đợt quyên góp
                        </a>
                    </div>
                </div>

            </nav>
        </div>
    </div>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Chi tiết đợt quyên góp</h1>
                <div class="card mb-4">

                    <div class="card-body">
                        <!--Detail-->
                        <div class="row">
                            <div class="col-6">
                                <label class="col-form-label">Mã đợt quyên góp:</label>
                                <input type="text" class="form-control"
                                       name="code" value="${donation.code}" readonly="readonly">
                            </div>
                            <div class="col-6">
                                <label class="col-form-label">Tên đợt quyên góp:</label>
                                <input type="text" class="form-control"
                                       name="name" value="${donation.name}" readonly="readonly">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label class="col-form-label">Ngày bắt đầu:</label>
                                <input type="text" class="form-control"
                                       name="startDate" value="${donation.startDate}" readonly="readonly">
                            </div>
                            <div class="col-6">
                                <label class="col-form-label">Ngày kết thúc:</label>
                                <input type="text" class="form-control"
                                       name="endDate" value="${donation.endDate}" readonly="readonly">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label class="col-form-label">Tổng tiền quyên góp:</label>
                                <input type="text" class="form-control"
                                       name="money" value="${donation.money} VNĐ" readonly="readonly">
                            </div>
                            <div class="col-6">
                                <label class="col-form-label">Trạng thái:</label>
                                <c:set var="status" value="${donation.status}"/>
                                <c:choose>
                                    <c:when test="${status eq 0}">
                                        <input type="text" class="form-control"
                                               name="end" value="Mới tạo" readonly="readonly">
                                    </c:when>
                                    <c:when test="${status eq 1}">
                                        <input type="text" class="form-control"
                                               name="end" value="Đang quyên góp" readonly="readonly">
                                    </c:when>
                                    <c:when test="${status eq 2}">
                                        <input type="text" class="form-control"
                                               name="end" value="Kết thúc quyên góp" readonly="readonly">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control"
                                               name="end" value="Đóng quyên góp" readonly="readonly">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label class="col-form-label">Tổ chức:</label>
                                <input type="text" class="form-control"
                                       name="organizationName" value="${donation.organizationName}" readonly="readonly">
                            </div>
                            <div class="col-6">
                                <label class="col-form-label">Số điện thoại:</label>
                                <input type="number" class="form-control"
                                       name="phoneNumber" value="${donation.phoneNumber}" readonly="readonly">
                            </div>
                            <div class="col-12">
                                <label class="col-form-label">Nội dung:</label>
                                <textarea name="description" class="form-control" placeholder="${donation.description}"
                                          cols="50" readonly="readonly"></textarea>
                            </div>
                        </div>
                        <!--Detail-->
                        <h3 class="mt-4">Danh sách những người quyên góp</h3>
                        <table id="datatablesSimple">
                            <thead>
                            <tr style="background-color: red !important;">
                                <th>Họ Tên</th>
                                <th>Tiền quyên góp</th>
                                <th>Ngày quyên góp</th>
                                <th>Nội dung</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="tempUD" items="${userDonations}">
                                <tr>
                                    <td>${tempUD.name}</td>
                                    <td>${tempUD.money} VNĐ</td>
                                    <td>${tempUD.donationDate}</td>
                                    <td>${tempUD.text}</td>
                                    <td>
                                        <c:set var="status" value="${tempUD.status}"/>
                                        <c:choose>
                                            <c:when test="${status eq 0}">
                                                Chờ xác nhận
                                            </c:when>
                                            <c:when test="${status eq 1}">
                                                Đã xác nhận
                                            </c:when>
                                            <c:otherwise>
                                                Hủy xác nhận
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="display: flex;justify-content: space-between">
                                        <form:form action="statusUserDonation" method="post">
                                            <input type="hidden" name="idUD" value="${tempUD.id}">
                                            <input type="hidden" name="idD" value="${donation.id}">
                                            <c:set var="status" value="${tempUD.status}"/>
                                            <c:choose>
                                                <c:when test="${status eq 0}">
                                                    <button type="submit" style="width: 105px" class="btn btn-success"
                                                            value="1" name="satusUD">
                                                        Xác nhận
                                                    </button>
                                                    <button type="submit" style="width: 150px" class="btn btn-danger"
                                                            value="2" name="satusUD">
                                                        Hủy xác nhận
                                                    </button>
                                                </c:when>
                                            </c:choose>
                                        </form:form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </main>

        <script>

            ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
                console.log("da" + eidt);
            })
                .catch(error => {
                    console.error(error);
                });

        </script>
        <script>

            var dodai = document.getElementById("dodai").value;
            var a = parseInt(dodai);
            for (var i = 1; i <= a + 10; i++) {
                var name = "#editor" + i
                ClassicEditor.create(document.querySelector(name)).then(eidt => {
                    console.log("da" + eidt);
                })
                    .catch(error => {
                        console.error(error);
                    });
            }


        </script>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">

            </div>
        </footer>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/JQuery3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/datatables-simple-demo.js"></script>
</body>
</body>

</html>
