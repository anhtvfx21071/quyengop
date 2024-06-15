<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 1/25/2024
  Time: 9:19 PM
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

    <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
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
                <h1 class="mt-4">Danh sách đợt quyên góp</h1>
                <div class="card mb-4">
                    <!--Them-->
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
                                        <form method="post" action="addDonation">
                                            <div class="row">
                                                <div class="col-6">
                                                    <label class="col-form-label">Mã đợt quyên góp:</label>
                                                    <input type="text" class="form-control"
                                                           name="code" required>
                                                </div>
                                                <div class="col-6">
                                                    <label class="col-form-label">Tên đợt quyên góp:</label>
                                                    <input type="text" class="form-control"
                                                           name="name" required>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <label class="col-form-label">Ngày bắt đầu:</label>
                                                    <input type="date" class="form-control"
                                                           name="startDate" required>
                                                </div>
                                                <div class="col-6">
                                                    <label class="col-form-label">Ngày kết thúc:</label>
                                                    <input type="date" class="form-control"
                                                           name="endDate" required>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <label class="col-form-label">Tổ chức:</label>
                                                    <input type="text" class="form-control"
                                                           name="organizationName" required>
                                                </div>
                                                <div class="col-6">
                                                    <label class="col-form-label">Số điện thoại:</label>
                                                    <input type="tel" class="form-control"
                                                           name="phoneNumber" required pattern="0[0-9]{9,10}">
                                                </div>
                                                <div class="col-12">
                                                    <label class="col-form-label">Nội dung:</label>
                                                    <textarea name="description" class="form-control" cols="50"
                                                              rows="5">Nhập nội dung</textarea>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                    Đóng
                                                </button>
                                                <button type="submit" class="btn btn-primary">Thêm</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Modal Add-->
                    </div>
                    <!--Body-->
                    <div class="card-body">
                        <table id="datatable" class="table table-striped" style="border: 1px cadetblue">
                            <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Tên</th>
                                <th>Ngày bắt đầu</th>
                                <th>Ngày kết thúc</th>
                                <th>Tổ chức</th>
                                <th>Số điện thoại</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <input type="hidden" value="${donations.size()}" id="dodai"/>
                            <c:forEach var="tempDonation" items="${donations}">
                                <tr>
                                    <td>${tempDonation.code}</td>
                                    <td>${tempDonation.name}</td>
                                    <td>${tempDonation.startDate}</td>
                                    <td>${tempDonation.endDate}</td>
                                    <td>${tempDonation.organizationName}</td>
                                    <td>${tempDonation.phoneNumber}</td>
                                    <td>${tempDonation.money} VNĐ</td>
                                    <td>
                                        <c:set var="status" value="${tempDonation.status}"/>
                                        <c:choose>
                                            <c:when test="${status eq 0}">
                                                Tạo mới
                                            </c:when>
                                            <c:when test="${status eq 1}">
                                                Đang quyên góp
                                            </c:when>
                                            <c:when test="${status eq 2}">
                                                Hoàn thành quyên góp
                                            </c:when>
                                            <c:otherwise>
                                                Đóng quyên góp
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="width: 250px">
                                        <button type="button" style="width: 105px" class="btn btn-primary"
                                                data-bs-toggle="modal"
                                                data-bs-target="#exampleModal${tempDonation.id}">
                                            Cập nhật
                                        </button>
                                        <a style="width: 105px" class="btn btn-warning"
                                           href="detail?id=${tempDonation.id}">
                                            Chi tiết
                                        </a>
                                        <form:form action="statusDonation" method="post">
                                            <c:set var="status" value="${tempDonation.status}"/>
                                            <c:choose>
                                                <c:when test="${status eq 0}">
                                                    <button type="button" style="width: 105px"
                                                            class="btn btn-danger mt-1"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#idModelDel${tempDonation.id}">
                                                        Xóa
                                                    </button>
                                                    <button type="submit" style="width: 105px"
                                                            class="btn btn-success mt-1"
                                                            name="idDonationStatus" value="${tempDonation.id}">
                                                        Quyên góp
                                                    </button>
                                                </c:when>
                                                <c:when test="${status eq 1}">
                                                    <button type="submit" style="width: 105px"
                                                            class="btn btn-success mt-1"
                                                            name="idDonationStatus" value="${tempDonation.id}">
                                                        Kết thúc
                                                    </button>
                                                </c:when>
                                                <c:when test="${status eq 2}">
                                                    <button type="submit" style="width: 105px"
                                                            class="btn btn-success mt-1"
                                                            name="idDonationStatus" value="${tempDonation.id}">
                                                        Khóa
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>
                                            </c:choose>
                                        </form:form>
                                        <!--xoa nguoi dung-->
                                        <div class="modal fade" id="idModelDel${tempDonation.id}" tabindex="-1"
                                             aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Bạn chắc chắn muốn xóa ?</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Người dùng : ${tempDonation.name}
                                                        <form action="deleteDonation" method="post">
                                                            <input type="hidden" class="form-control" name="idDonation"
                                                                   value="${tempDonation.id}">
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
                                        <!-- Modal Update-->
                                        <div class="modal fade" tabindex="-1" id="exampleModal${tempDonation.id}"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-lg ">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabell">Cập nhật</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="updateDonation" method="post">
                                                            <input type="hidden" name="id" value="${tempDonation.id}">
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Mã đợt quyên
                                                                        góp:</label>
                                                                    <input type="text" class="form-control"
                                                                           placeholder="${tempDonation.code}"
                                                                           name="code" value="${tempDonation.code}"
                                                                           required>
                                                                </div>
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Tên đợt quyên
                                                                        góp:</label>
                                                                    <input type="text" class="form-control"
                                                                           placeholder="${tempDonation.name}"
                                                                           name="name" value="${tempDonation.name}"
                                                                           required>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Ngày bắt đầu:</label>
                                                                    <input type="date" class="form-control"
                                                                           placeholder="${tempDonation.startDate}"
                                                                           name="startDate"
                                                                           value="${tempDonation.startDate}" required>
                                                                </div>
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Ngày kết thúc:</label>
                                                                    <input type="date" class="form-control"
                                                                           placeholder="${tempDonation.endDate}"
                                                                           name="endDate"
                                                                           value="${tempDonation.endDate}" required>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Tổ chức:</label>
                                                                    <input type="text" class="form-control"
                                                                           name="organizationName"
                                                                           placeholder="${tempDonation.organizationName}"
                                                                           value="${tempDonation.organizationName}"
                                                                           required>
                                                                </div>
                                                                <div class="col-6">
                                                                    <label class="col-form-label">Số điện thoại:</label>
                                                                    <input type="number" class="form-control"
                                                                           placeholder="${tempDonation.phoneNumber}"
                                                                           value="${tempDonation.phoneNumber}"
                                                                           name="phoneNumber" required>
                                                                </div>
                                                                <div class="col-12">
                                                                    <label class="col-form-label">Nội dung:</label>
                                                                    <textarea name="description" class="form-control"
                                                                              placeholder="${tempDonation.description}"
                                                                              data-value="${tempDonation.description}"
                                                                              cols="50" rows="5"></textarea>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/2.0.0/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.0/js/dataTables.bootstrap5.js"></script>
<script>
    new DataTable('#datatable');
</script>
</body>

</html>
