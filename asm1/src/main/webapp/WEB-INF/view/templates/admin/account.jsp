<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 1/25/2024
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <nav th:fragment="html_nav" class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
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
                <h1 class="mt-4">Danh sách người dùng</h1>
                <div class="card mb-4">
                    <div class="card-header">
                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                data-bs-target="#exampleModalAdd">
                            Thêm mới
                        </button>
                        <!-- Modal Add-->
                        <div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form:form action="addUser" method="post">
                                            <div class="row">
                                                <div class="col-6">
                                                    <label class="col-form-label">Name:</label>
                                                    <input type="text" class="form-control" name="fullName" required>
                                                </div>
                                                <div class="col-6">
                                                    <label class="col-form-label">Email:</label>
                                                    <input type="email" class="form-control" name="email" required>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <label class="col-form-label">Số điện thoại:</label>
                                                    <input type="tel" class="form-control" name="phoneNumber" required
                                                           pattern="0[0-9]{9,10}">
                                                </div>
                                                <div class="col-6">
                                                    <label class="col-form-label">Địa chỉ:</label>
                                                    <input type="text" class="form-control" name="address" required>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <label class="col-form-label">Tài khoản:</label>
                                                    <input type="text" class="form-control" name="userName" required>
                                                </div>
                                                <div class="col-6">
                                                    <label class="col-form-label">Mật khẩu:</label>
                                                    <input type="password" class="form-control" name="password"
                                                           required>
                                                </div>
                                                <div class="col-6">
                                                    <label class="col-form-label">Vai trò:</label>
                                                    <select class="form-control" name="role">
                                                        <option value="Admin" selected>Admin</option>
                                                        <option value="User" selected>User</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                    Đóng
                                                </button>
                                                <button type="submit" class="btn btn-primary">Thêm</button>
                                            </div>
                                        </form:form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Add 1-->

                    <div class="card-body">
                        <table id="datatablesSimple" class="table table-striped">
                            <thead>
                            <tr>
                                <th>Họ tên</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Tài khoản</th>
                                <th>Vai trò</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <input type="hidden" value="${users.size()}" id="dodai"/>
                            <c:forEach var="tempUser" items="${users}">
                                <tr>
                                    <td>${tempUser.getFullName()}</td>
                                    <td>${tempUser.email}</td>
                                    <td>${tempUser.phoneNumber}</td>
                                    <td>${tempUser.userName}</td>
                                    <td>${tempUser.getRole1()}</td>
                                    <td>
                                        <c:set var="status" value="${tempUser.status}"/>
                                        <c:choose>
                                            <c:when test="${status eq 1}">
                                                <p style="color: #1c7430;font-weight: bold">Hoạt động</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p style="color: red;font-weight: bold">Đã Khóa</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="width : 270px">
                                        <button type="button" style="width: 120px" class="btn btn-success"
                                                data-bs-toggle="modal"
                                                th:data-bs-target="'#idModelMail'+${user.id}">
                                            Gửi
                                        </button>
                                        <button type="submit" style="width: 120px" class="btn btn-primary"
                                                data-bs-toggle="modal"
                                                data-bs-target="#exampleModal${tempUser.id}">
                                            Sửa
                                        </button>
                                        <button type="button" style="width: 120px" class="btn btn-warning"
                                                data-bs-toggle="modal"
                                                th:data-bs-target="'#idModelDetail'+${user.id}">
                                            Chi tiết
                                        </button>
                                        <button type="button" style="width: 120px" class="btn btn-danger mt-1"
                                                data-bs-toggle="modal"
                                                data-bs-target="#idModelDel${tempUser.id}">
                                            Xóa
                                        </button>
                                        <form:form action="statusChange" method="post">
                                            <c:if test="${tempUser.status == 0}">
                                                <input type="hidden" class="form-control" name="idUser"
                                                       value="${tempUser.id}">
                                                <button type="submit" class="btn btn-success" style="width: 120px">Mở
                                                </button>
                                            </c:if>
                                            <c:if test="${tempUser.status == 1}">
                                                <input type="hidden" class="form-control" name="idUser"
                                                       value="${tempUser.id}">
                                                <button type="submit" class="btn btn-danger" style="width: 120px">Khóa
                                                </button>
                                            </c:if>
                                        </form:form>
                                        <!--xoa nguoi dung-->
                                        <div class="modal fade" id="idModelDel${tempUser.id}" tabindex="-1"
                                             aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Bạn chắc chắn muốn xóa ?</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Người dùng : ${tempUser.getFullName()}
                                                        <form action="deleteUser" method="post">
                                                            <input type="hidden" class="form-control" name="idUser"
                                                                   value="${tempUser.id}">
                                                            <div class="modal-footer" style="margin-top: 20px">
                                                                <button type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">
                                                                    Close
                                                                </button>
                                                                <button type="submit" class="btn btn-danger">Xóa
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!-- Modal Update 2-->
                                        <div class="modal fade" id="exampleModal${tempUser.id}" tabindex="-1"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg ">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabell">Cập nhật</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="updateUser" method="post">
                                                            <input type="hidden" name="idUser" value="${tempUser.id}">
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Họ và tên:</label>
                                                                    <input type="text" class="form-control"
                                                                           name="fullName"
                                                                           placeholder="${tempUser.fullName}"
                                                                           value="${tempUser.fullName}" required>
                                                                </div>
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Email:</label>
                                                                    <input readonly type="email" class="form-control"
                                                                           name="email"
                                                                           value="${tempUser.email}"
                                                                           placeholder="${tempUser.email}" required>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Số điện thoại:</label>
                                                                    <input type="number" class="form-control"
                                                                           name="phoneNumber"
                                                                           placeholder="${tempUser.phoneNumber}"
                                                                           value="${tempUser.phoneNumber}" required>
                                                                </div>
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Địa chỉ:</label>
                                                                    <input type="text" class="form-control"
                                                                           name="address"
                                                                           placeholder="${tempUser.address}"
                                                                           value="${tempUser.address}" required>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Tài khoản:</label>
                                                                    <input readonly type="text" class="form-control"
                                                                           name="userName"
                                                                           placeholder="${tempUser.userName}"
                                                                           value="${tempUser.userName}" required>
                                                                    <input readonly type="hidden" class="form-control"
                                                                           name="id"
                                                                           value="${tempUser.id}" required>
                                                                    <input readonly type="hidden" class="form-control"
                                                                           name="password"
                                                                           value="${tempUser.password}" required>
                                                                    <input readonly type="hidden" class="form-control"
                                                                           name="status"
                                                                           value="${tempUser.status}" required>
                                                                </div>
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Vai trò:</label>
                                                                    <c:set var="roleName" value="${tempUser.role}"/>
                                                                    <select class="form-control" name="role">
                                                                        <c:choose>
                                                                            <c:when test="${roleName eq 'Admin'}">
                                                                                <option value="Admin" selected>Admin
                                                                                </option>
                                                                                <option value="User">User</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option value="User" selected>User
                                                                                </option>
                                                                                <option value="Admin">Admin</option>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">Đóng
                                                                </button>
                                                                <button type="submit" class="btn btn-primary">Lưu
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
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
        <footer th:replace="admin/fragments :: footer" class="py-4 bg-light mt-auto">
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

</html>
