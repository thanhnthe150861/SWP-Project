<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<!-- doccure/booking-success.html  30 Nov 2019 04:12:16 GMT -->
<head>
    <meta charset="utf-8">
    <title>Doccure</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<!-- Main Wrapper -->
<div class="main-wrapper">

    <!-- Header -->
    <header class="header">
        <nav class="navbar navbar-expand-lg header-nav">
            <div class="navbar-header">
                <a id="mobile_btn" href="javascript:void(0);">
							<span class="bar-icon">
								<span></span>
								<span></span>
								<span></span>
							</span>
                </a>
                <a href="home" class="navbar-brand logo">
                    <span class="text-primary">Clinic</span>-TATQ
                </a>
            </div>
            <div class="main-menu-wrapper">
                <div class="menu-header">
                    <a href="home" class="menu-logo">
                        <span class="text-primary" width="50" height="50">Clinic</span>
                    </a>
                    <a id="menu_close" class="menu-close" href="javascript:void(0);">
                        <i class="fas fa-times"></i>
                    </a>
                </div>
                <ul class="main-nav">
                    <li>
                        <a href="home">Trang chủ</a>
                    </li>
                    <li>
                        <a href="booking">Đặt lịch</a>
                    </li>
                </ul>
            </div>
            <ul class="nav header-navbar-rht">
                <li class="nav-item contact-item">
                    <div class="header-contact-img">
                        <i class="far fa-hospital"></i>
                    </div>
                    <div class="header-contact-detail">
                        <p class="contact-header">Liên hệ</p>
                        <p class="contact-info-header"> +84 868746275</p>
                    </div>
                </li>
                <!-- User Menu -->
                <li class="nav-item dropdown has-arrow logged-item">
                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
								<span class="user-img">
									<img class="rounded-circle" src="${sessionScope.patient.url}" width="31">
								</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="user-header">
                            <div class="avatar avatar-sm">
                                <img src="${sessionScope.patient.url}"
                                     class="avatar-img rounded-circle">
                            </div>
                            <div class="user-text">
                                <h6>${sessionScope.patient.name}</h6>
                                <p class="text-muted mb-0">Rank: ${sessionScope.patient.ranks.name}</p>
                            </div>
                        </div>
                        <a class="dropdown-item" href="patient_dashboard">Bảng điều khiển</a>
                        <a class="dropdown-item" href="patient_profile_settings">Cài đặt </a>
                        <a class="dropdown-item" href="login">Đăng xuất</a>
                    </div>
                </li>
                <!-- /User Menu -->
            </ul>
        </nav>
    </header>
    <!-- /Header -->

    <!-- Breadcrumb -->
    <div class="breadcrumb-bar">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-md-12 col-12">
                    <nav aria-label="breadcrumb" class="page-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Clinic TQTA</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Đặt lịch</li>
                        </ol>
                    </nav>
                    <h2 class="breadcrumb-title">Đặt lịch</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- /Breadcrumb -->

    <!-- Page Content -->
    <div class="content success-page-cont">
        <div class="container-fluid">

            <div class="row justify-content-center">
                <div class="col-lg-6">

                    <!-- Success Card -->
                    <div class="card success-card">
                        <div class="card-body">
                            <div class="success-cont">
                                <i class="fas fa-check"></i>
                                <h3>Gửi yêu cầu đặt lịch thành công!</h3>
                                <p>Lịch đặt vào ngày <strong>${sessionScope.date}
                                    <c:forEach items="${sessionScope.slotList}" var="sp">
                                        <c:if test="${sp.id == sessionScope.selectedSlot}">
                                            ${sp.name}
                                        </c:if>
                                    </c:forEach></strong></p>
                                <a href="patient_dashboard" class="btn btn-primary view-inv-btn">Xem trạng thái đặt
                                    lịch</a>
                            </div>
                        </div>
                    </div>
                    <!-- /Success Card -->

                </div>
            </div>

        </div>
    </div>
    <!-- /Page Content -->

    <!-- Footer -->
    <footer class="footer">

        <!-- Footer Top -->
        <div class="footer-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6">

                        <!-- Footer Widget -->
                        <div class="footer-widget footer-about">
                            <a href="home" class="navbar-brand logo">
                                <span class="text-primary">Clinic</span>-TATQ
                            </a>
                        </div>
                        <!-- /Footer Widget -->
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <!-- Footer Widget -->
                        <div class="footer-widget footer-menu">
                            <h2 class="footer-title">Đối với bệnh nhân</h2>
                            <ul>
                                <li><a href="my_doctor"><i class="fas fa-angle-double-right"></i>Bác sĩ của tôi</a>
                                </li>
                                <li><a href="booking"><i class="fas fa-angle-double-right"></i> Đặt lịch</a></li>
                                <li><a href="patient_dashboard"><i class="fas fa-angle-double-right"></i> Bảng điều
                                    khiển </a></li>
                            </ul>
                        </div>
                        <!-- /Footer Widget -->
                    </div>


                    <div class="col-lg-3 col-md-6">

                        <!-- Footer Widget -->
                        <div class="footer-widget footer-contact">
                            <h2 class="footer-title">Liên hệ chúng tôi</h2>
                            <div class="footer-contact-info">
                                <div class="footer-address">
                                    <span><i class="fas fa-map-marker-alt"></i></span>
                                    <p> FPT University<br> Hòa Lạc, Hà Nội </p>
                                </div>
                                <p>
                                    <i class="fas fa-phone-alt"></i>
                                    +84 868746275
                                </p>
                                <p class="mb-0">
                                    <i class="fas fa-envelope"></i>
                                    quyetlbche160252@fpt.edu.vn
                                </p>
                            </div>
                        </div>
                        <!-- /Footer Widget -->
                    </div>

                </div>
            </div>
        </div>
        <!-- /Footer Bottom -->

    </footer>
    <!-- /Footer -->

</div>
<!-- /Main Wrapper -->

<!-- jQuery -->
<script src="assets/js/jquery.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="assets/js/script.js"></script>

</body>

<!-- doccure/booking-success.html  30 Nov 2019 04:12:16 GMT -->
</html>