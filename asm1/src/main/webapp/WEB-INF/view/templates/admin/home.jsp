<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 1/25/2024
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Quản trị</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>

    <link rel="stylesheet" href="/asm1_war_exploded/resources/static/admin1/assets/css/styles.css"/>

    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
            crossorigin="anonymous"
    ></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"
    ></script>

    <script src="/asm1_war_exploded/resources/static/admin1/assets/js/scripts.js"></script>

    <script
            src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
            crossorigin="anonymous"
    ></script>
    <script src="/asm1_war_exploded/resources/static/admin1/assets/js/datatables-simple-demo.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
</head>

<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"></nav>
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="/admin/">QUẢN TRỊ</a>
    <!-- Sidebar Toggle-->
    <button
            class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
            id="sidebarToggle"
            href="#!"
    >
        <i class="fas fa-bars"></i>
    </button>
    <!-- Navbar Search-->
    <form
            class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"
    ></form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle"
               href="login"
               role="button"
            ><i class="fas fa-user fa-fw"></i><span> Logout</span></a
            >
        </li>
    </ul>
</nav>

<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <a class="nav-link" href="account">
                        <div class="sb-nav-link-icon">
                            <i class="fas fa-tachometer-alt"></i>
                        </div>
                        Quản lý người dùng
                    </a>
                    <a class="nav-link" href="donation">
                        <div class="sb-nav-link-icon">
                            <i class="fas fa-tachometer-alt"></i>
                        </div>
                        Quản lý đợt quyên góp
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <div id="layoutSidenav_content">
        <main>
            <h1>Home admin</h1>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4"></div>
        </footer>
    </div>
</div>
<script>
    $("#exampleModalView1").on("hidden.bs.modal", function (e) {
        $("#exampleModalView1 iframe").attr(
            "src",
            $("#exampleModalView1 iframe").attr("src")
        );
    });
</script>
<script>
    $(document).ready(function () {
        $("#autoWidth,#autoWidth2").lightSlider({
            autoWidth: true,
            loop: true,
            onSliderLoad: function () {
                $("#autoWidth,#autoWidth2").removeClass("cS-hidden");
            },
        });
    });
</script>
<script>
    ClassicEditor.create(document.querySelector("#editor"))
        .then((eidt) => {
            console.log("da" + eidt);
        })
        .catch((error) => {
            console.error(error);
        });
</script>
<script>
    ClassicEditor.create(document.querySelector("#editor1"))
        .then((eidt) => {
            console.log("da" + eidt);
        })
        .catch((error) => {
            console.error(error);
        });
</script>
<script src="js/JQuery3.3.1.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"
></script>
<script src="js/scripts.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
        crossorigin="anonymous"
></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
