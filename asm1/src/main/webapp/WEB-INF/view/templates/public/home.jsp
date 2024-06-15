<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 1/25/2024
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <title>Donation website &mdash; Website Donation</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="author" content="Free-Template.co"/>
    <link rel="shortcut icon" href="ftco-32x32.png">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/custom-bs.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/static/assets/css/jquery.fancybox.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/static/user/assets/css/bootstrap-select.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/static/user/assets/fonts/icomoon/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/static/user/assets/fonts/line-icons/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/static/user/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/animate.min.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/style.css">

    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/stickyfill.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.easing.1.3.js"></script>

    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.animateNumber.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/custom.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body id="top">

<div id="overlayer"></div>
<div class="loader">
    <div class="spinner-border text-primary" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<div th:if="${msg}" class="toast" data-delay="1000"
     style="position:fixed; top: 100PX; left: 40PX;z-index: 2000;width: 300px">
</div>

<div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div>


    <!-- NAVBAR -->
    <header class="site-navbar mt-3">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="site-logo col-6"><a href="#">Website Quyên Góp</a></div>

            </div>
        </div>
    </header>

    <!-- HOME -->
    <section class="section-hero overlay inner-page bg-image"
             style="background-image: url('${pageContext.request.contextPath}/resources/static/user/assets/images/hero_1.jpg');"
             id="home-section">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <h1 class="text-white font-weight-bold">Danh sách các đợt quyên góp</h1>

                </div>
            </div>
        </div>
    </section>
    <section class="site-section">
        <div class="container">
            <div class="row mb-5 justify-content-center">
                <div class="col-md-7 text-center">
                    <h2 class="section-title mb-2">Các đợt quyên góp</h2>
                </div>
            </div>
            <table class="table table-striped">
                <tbody>
                <c:forEach var="tempDonation" items="${donations}">
                    <tr>
                        <td>
                            <div class="job-listing-position custom-width  mb-3 mb-sm-0"
                                 style="padding: 10px;width: 250px">
                                <h2><a class="bt" href="detail?id=${tempDonation.id}" style="text-decoration: none">
                                        ${tempDonation.name}
                                </a></h2>
                                <strong>
                                    <c:set var="status" value="${tempDonation.status}"/>
                                    <c:choose>
                                        <c:when test="${status eq 0}">
                                            Tạo mới
                                        </c:when>
                                        <c:when test="${status eq 1}">
                                            Đang quyên góp
                                        </c:when>
                                        <c:when test="${status eq 2}">
                                            Kết thúc
                                        </c:when>
                                        <c:otherwise>
                                            Đóng quyên góp
                                        </c:otherwise>
                                    </c:choose> </strong>
                            </div>
                        </td>
                        <td>
                            <div class="job-listing-location mb-3 mb-sm-0 custom-width w-10" style="padding: 10px;">
                                Ngày bắt đầu<br>
                                <strong>${tempDonation.startDate}</strong><br>
                            </div>
                        </td>
                        <td>
                            <div class="job-listing-location mb-3 mb-sm-0 custom-width w-10" style="padding: 10px;">
                                Ngày kết thúc<br>
                                <strong>${tempDonation.endDate}</strong><br>
                            </div>
                        </td>
                        <td>
                            <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25" style="padding: 10px;">
                                <span class="icon-room"></span> <span>${tempDonation.organizationName}</span><br>
                                <strong>${tempDonation.phoneNumber}</strong><br>
                            </div>
                        </td>
                        <td>
                            <div class="job-listing-meta custom-width w-20">
                                <c:set var="status" value="${tempDonation.status}"/>
                                <c:choose>
                                    <c:when test="${status eq 1}">
                                        <p style="margin-top: 20px" class="btn btn-primary py-2" data-toggle="modal"
                                           data-target="#idModel${tempDonation.id}">Quyên góp</p>
                                    </c:when>
                                </c:choose>
                            </div>
                        </td>
                        <!-- Modal -->
                        <div class="modal fade" id="idModel${tempDonation.id}" tabindex="-1"
                             aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Quyên góp:
                                            <span>${tempDonation.name}</span>
                                        </h5>
                                        <button type="button" class="btn-close" data-dismiss="modal"
                                                aria-label="Close">x
                                        </button>
                                    </div>
                                    <form:form action="addUserDonation" method="post">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="col-form-label">Họ tên:</label>
                                                    <input type="text" class="form-control"
                                                           name="name" placeholder="" required>
                                                    <label class="col-form-label">Số tiền quyên góp:</label>
                                                    <input type="number" class="form-control" placeholder=""
                                                           name="money" required>
                                                    <input type="hidden" class="form-control" placeholder=""
                                                           name="idU" value="${checkUser.id}">
                                                    <input type="hidden" class="form-control" placeholder=""
                                                           name="idD" value="${tempDonation.id}">
                                                    <%@ page import="java.text.SimpleDateFormat" %>
                                                    <% SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); %>
                                                    <% String formattedDate = dateFormat.format(new java.util.Date()); %>
                                                    <input type="hidden" class="form-control" placeholder=""
                                                           name="donationDate" value="<%=formattedDate %>">
                                                    <label class="col-form-label">Lời nhắn:</label>
                                                    <textarea rows="10" cols="3" class="form-control" name="text">
                                                </textarea>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Đóng
                                                </button>
                                                <button type="submit" class="btn btn-primary">Quyên góp
                                                </button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <form:form action="fiveDonation" method="post">
                <c:forEach begin="1" end="${page}" varStatus="loop">
                    <button type="submit" name="index" value="${loop.index}">${loop.index}</button>
                </c:forEach>
            </form:form>

        </div>
    </section>

</div>

</body>
</html>
