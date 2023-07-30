<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>TATQ Clinic</title>
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
    <style>
        /* Style for the form inputs */
        input[type="text"],
        select {
            font-size: 16px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box;
        }

        /* Style for the submit button */
        .submit-section button {
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            color: #fff;
            background-color: #007bff;
            cursor: pointer;
        }

        .submit-section button:hover {
            background-color: #0056b3;
        }
    </style>
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
                                <p class="text-muted mb-0">Xếp hạng: ${sessionScope.patient.ranks.name}</p>
                            </div>
                        </div>
                        <a class="dropdown-item" href="patient_dashboard">Bảng Điều Khiển</a>
                        <a class="dropdown-item" href="patient_profile_settings">Cài Đặt </a>
                        <a class="dropdown-item" href="login">Đăng Xuất</a>
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
                            <li class="breadcrumb-item active" aria-current="page">Bảng Điều Khiển</li>
                        </ol>
                    </nav>
                    <h2 class="breadcrumb-title">Bảng Điều Khiển</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- /Breadcrumb -->

    <!-- Page Content -->
    <div class="content">
        <div class="container-fluid">

            <div class="row">

                <!-- Profile Sidebar -->
                <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                    <div class="profile-sidebar">
                        <div class="widget-profile pro-widget-content">
                            <div class="profile-info-widget">
                                <a href="#" class="booking-doc-img">
                                    <img src="${sessionScope.patient.url}">
                                </a>
                                <div class="profile-det-info">
                                    <h3>${sessionScope.patient.name}</h3>
                                    <div class="patient-details">
                                        <h5><i class="fas fa-birthday-cake"></i> ${sessionScope.patient.dob}</h5>
                                        <h5>
                                            <i class="fas fa-${sessionScope.patient.gender eq 'Male' ? 'mars' : 'venus'}"></i>${sessionScope.patient.gender}
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="dashboard-widget">
                            <nav class="dashboard-menu">
                                <ul>
                                    <li class="active">
                                        <a href="patient_dashboard">
                                            <i class="fas fa-columns"></i>
                                            <span>Bảng điều khiển</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="my_doctor">
                                            <i class="fas fa-user-md"></i>
                                            <span>Bác sĩ của tôi</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="invoice_patient">
                                            <i class="fas fa-file-invoice"></i>
                                            <span>Hóa đơn</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="patient_profile_settings">
                                            <i class="fas fa-user-cog"></i>
                                            <span>Thông tin cá nhân</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="patient_change_password">
                                            <i class="fas fa-lock"></i>
                                            <span>Thay đổi mật khẩu</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="login">
                                            <i class="fas fa-sign-out-alt"></i>
                                            <span>Đăng xuất</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>
                <!-- / Profile Sidebar -->

                <div class="col-md-7 col-lg-8 col-xl-9">
                    <div class="card">
                        <div class="card-body pt-0">

                            <!-- Tab Menu -->
                            <nav class="user-tabs mb-4">
                                <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#">Chi tiết về lịch đặt</a>
                                    </li>
                                </ul>
                            </nav>
                            <!-- /Tab Menu -->

                            <!-- Tab Content -->
                            <div class="tab-content pt-0">

                                <!-- Appointment Tab -->
                                <div id="pat_appointments" class="tab-pane fade show active">
                                    <div class="card card-table mb-0">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <% String errorMessage = (String) request.getAttribute("messError"); %>
                                                <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                                                <div class="alert alert-danger" role="alert">
                                                    <%= errorMessage %>
                                                </div>
                                                <% } %>
                                                <% String messSuccess = (String) request.getAttribute("messSuccess"); %>
                                                <% if (messSuccess != null && !messSuccess.isEmpty()) { %>
                                                <div class="alert alert-success" role="alert">
                                                    <%= messSuccess %>
                                                </div>
                                                <% } %>
                                                <form action="appointment_details" method="post">
                                                    <table class="table table-hover table-center mb-0">
                                                        <tbody>
                                                        <tr>
                                                            <td>
                                                                <span>Mã đặt lịch</span>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="bid"
                                                                       value="${sessionScope.bid}"
                                                                       readonly>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span>Bác sĩ khám</span>
                                                            </td>
                                                            <td>
                                                                <c:if test="${sessionScope.bookingID.booking.doctor.id != 0}">
                                                                    <input type="text" name="did"
                                                                           value="${sessionScope.bookingID.booking.doctor.id}"
                                                                           hidden="hidden">
                                                                    <h2 class="table-avatar">
                                                                        <a href="doctor_profile?id=${sessionScope.bookingID.booking.doctor.id}"
                                                                           class="avatar avatar-sm mr-2">
                                                                            <img class="avatar-img rounded-circle"
                                                                                 src="${sessionScope.bookingID.booking.doctor.url}">
                                                                        </a>
                                                                        <a href="doctor_profile?id=${sessionScope.bookingID.booking.doctor.id}">
                                                                                ${sessionScope.bookingID.booking.doctor.name}
                                                                            <span>${sessionScope.bookingID.booking.doctor.specialty}</span>
                                                                        </a>
                                                                    </h2>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Ngày đặt</td>
                                                            <td>
                                                                ${sessionScope.bookingID.booking.date}<span
                                                                    class="d-block text-info">${sessionScope.bookingID.booking.slots.name}</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Nhóm bệnh</td>
                                                            <td>
                                                                <select name="diseaseGroup" disabled>
                                                                    <c:forEach items="${sessionScope.listSp}" var="ls">
                                                                        <option value="${ls.id}" ${sessionScope.bookingID.booking.specialty.id == ls.id ? 'selected' : ''}>
                                                                            Bệnh về ${ls.name}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span>Mô tả tình trạng bệnh</span>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="textReason"
                                                                       value="${sessionScope.bookingID.booking.booking_reason}" ${sessionScope.bookingID.booking.status == 'Canceled' ? 'readonly' : ''}>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Trạng thái</td>
                                                            <td>
                                                                <select name="status">
                                                                    <option value="Canceled" ${sessionScope.bookingID.booking.status == 'Canceled' ? 'selected' : ''} ${sessionScope.bookingID.booking.status == 'Canceled' ? 'disabled' : ''}>
                                                                        Canceled
                                                                    </option>
                                                                    <option value="Pending" ${sessionScope.bookingID.booking.status == 'Pending' ? 'selected' : ''} ${sessionScope.bookingID.booking.status == 'Canceled' ? 'disabled' : ''}>
                                                                        Pending
                                                                    </option>
                                                                    <option value="Confirmed" ${sessionScope.bookingID.booking.status == 'Confirmed' ? 'selected' : ''}
                                                                            disabled>
                                                                        Confirmed
                                                                    </option>
                                                                    <option value="Completed" ${sessionScope.bookingID.booking.status == 'Completed' ? 'selected' : ''}
                                                                            disabled>
                                                                        Completed
                                                                    </option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Ghi chú của nhân viên</td>
                                                            <td>
                                                                <input type="text" name="note" readonly
                                                                       value="${sessionScope.bookingID.booking.reason}">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td>
                                                                <div class="submit-section">
                                                                    <c:if test="${sessionScope.bookingID.booking.status == 'Canceled'}">
                                                                        <a href="patient_dashboard"
                                                                           class="btn btn-primary submit-btn">Quay
                                                                            lại</a>

                                                                    </c:if>
                                                                    <c:if test="${sessionScope.bookingID.booking.status != 'Canceled'}">
                                                                        <button type="submit"
                                                                                class="btn btn-primary submit-btn">
                                                                            Lưu
                                                                        </button>
                                                                    </c:if>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Appointment Tab -->

                            </div>
                            <!-- Tab Content -->

                        </div>
                    </div>
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
        <!-- /Footer Top -->

        <!-- Footer Bottom -->
        <div class="footer-bottom">
            <div class="container-fluid">

                <!-- Copyright -->


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

<!-- Sticky Sidebar JS -->
<script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
<script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

<!-- Custom JS -->
<script src="assets/js/script.js"></script>

</body>
</html>