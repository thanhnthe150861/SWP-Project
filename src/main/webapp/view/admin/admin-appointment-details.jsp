<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>TATQ CLINIC - STAFF DASHBOARD</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="view/admin/assets/img/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="view/admin/assets/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="view/admin/assets/css/font-awesome.min.css">

    <!-- Feathericon CSS -->
    <link rel="stylesheet" href="view/admin/assets/css/feathericon.min.css">

    <link rel="stylesheet" href="view/admin/assets/plugins/morris/morris.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="view/admin/assets/css/style.css">

    <!--[if lt IE 9]>
    <script src="view/admin/assets/js/html5shiv.min.js"></script>
    <script src="view/admin/assets/js/respond.min.js"></script>
    <![endif]-->
    <style>
        /* Định dạng các hàng chẵn và lẻ trong bảng */
        table tr:nth-child(odd) {
            background-color: #f2f2f2;
        }

        table tr:nth-child(even) {
            background-color: #ffffff;
        }

        /* Tùy chỉnh padding và khoảng cách giữa các cột */
        table th, table td {
            padding: 10px;
        }

        /* Định dạng tiêu đề của bảng */
        table th {
            background-color: #007bff;
            color: #ffffff;
            text-align: center;
        }

        /* Định dạng nút Lưu và Quay lại */
        .submit-btn {
            margin-right: 10px;
        }

        /* Định dạng các thông báo lỗi và thành công */
        .alert {
            margin-bottom: 10px;
        }
    </style>

</head>
<body>

<!-- Main Wrapper -->
<div class="main-wrapper">

    <!-- Header -->
    <div class="header">

        <!-- Logo -->
        <div class="header-left">
            <a href="staff_dashboard" class="logo">
                <span class="text-primary">Clinic</span>-TATQ
            </a>
            <a href="staff_dashboard" class="logo logo-small">
                <span class="text-primary" width="50" height="50">Clinic</span>
            </a>
        </div>
        <!-- /Logo -->

        <a href="javascript:void(0);" id="toggle_btn">
            <i class="fe fe-text-align-left"></i>
        </a>

        <!-- Mobile Menu Toggle -->
        <a class="mobile_btn" id="mobile_btn">
            <i class="fa fa-bars"></i>
        </a>
        <!-- /Mobile Menu Toggle -->

        <!-- Header Right Menu -->
        <ul class="nav user-menu">

            <!-- User Menu -->
            <li class="nav-item dropdown has-arrow">
                <a class="dropdown-toggle nav-link" data-toggle="dropdown">
                    <span class="user-img"><img class="rounded-circle"
                                                src="view/admin/assets/img/profiles/avatar-01.jpg" width="31"
                    ></span>
                </a>
                <div class="dropdown-menu">
                    <div class="user-header">
                        <div class="avatar avatar-sm">
                            <img src="view/admin/assets/img/profiles/avatar-01.jpg"
                                 class="avatar-img rounded-circle">
                        </div>
                        <div class="user-text">
                            <h6>Administrator</h6>
                        </div>
                    </div>
                    <a class="dropdown-item" href="admin_dashboard">Hồ Sơ</a>
                    <a class="dropdown-item" href="login">Đăng Xuất</a>
                </div>
            </li>
            <!-- /User Menu -->

        </ul>
        <!-- /Header Right Menu -->

    </div>
    <!-- /Header -->

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul>
                    <li class="menu-title">
                        <span>Main</span>
                    </li>
                    <li>
                        <a href="admin_dashboard"><i class="fe fe-home"></i> <span>Bảng Điều Khiển</span></a>
                    </li>
                    <li class="active">
                        <a href="appointment_list"><i class="fe fe-layout"></i> <span>Cuộc Hẹn</span></a>
                    </li>
                    <li>
                        <a href="staff_list"><i class="fe fe-users"></i> <span>Nhân Viên</span></a>
                    </li>
                    <li>
                        <a href="doctor_list"><i class="fe fe-user-plus"></i> <span>Bác Sĩ</span></a>
                    </li>
                    <li>
                        <a href="patient_list"><i class="fe fe-user"></i> <span>Bệnh Nhân</span></a>
                    </li>
                    <li>
                        <a href="day_off_doctor">
                            <i class="fe fe-calendar"></i>
                            <span>Danh sách xin nghỉ</span></a>
                    </li>
                    <li>
                        <a href="invoice_list"><i class="fe fe-document"></i> <span>Hóa Đơn</span></a>
                    </li>
                    <li>
                        <a href="profile"><i class="fe fe-user-plus"></i> <span>Hồ Sơ</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-document"></i> <span>Thêm Mới/Cập Nhật</span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;" class="active">
                            <li><a href="form_details?str=doctor">Bác Sĩ</a></li>
                            <li><a href="form_details?str=patient">Bệnh Nhân</a></li>
                            <li><a href="form_details?str=staff">Nhân Viên</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="login">
                            <span>Đăng Xuất</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /Sidebar -->

    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <h3 class="page-title">Cuộc Hẹn</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="admin_dashboard">Bảng Điều Khiển</a></li>
                            <li class="breadcrumb-item active">Cuộc Hẹn</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="content container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
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
                                    <table class="table table-bordered table-striped">
                                        <tbody>
                                        <tr>
                                            <td style="width: 180px;"><span>Mã đặt lịch</span></td>
                                            <td>
                                                <input type="text" name="bid" value="${sessionScope.bid}" readonly
                                                       class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><span>Bác sĩ khám</span></td>
                                            <td>
                                                <select name="did">
                                                    <option value="0">Chưa có bác sĩ khám</option>
                                                    <c:forEach items="${sessionScope.doctors}" var="d">
                                                        <option value="${d.id}" ${sessionScope.bookingID.booking.doctor.id == d.id ? 'selected' : ''} >
                                                                ${d.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ngày đặt</td>
                                            <td>
                                                ${sessionScope.bookingID.booking.date}<br>
                                                <span class="text-info">${sessionScope.bookingID.booking.slots.name}</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Nhóm bệnh</td>
                                            <td>
                                                <select name="diseaseGroup" class="form-control">
                                                    <c:forEach items="${sessionScope.listSp}" var="ls">
                                                        <option value="${ls.id}" ${sessionScope.bookingID.booking.specialty.id == ls.id ? 'selected' : ''} >
                                                            Bệnh về ${ls.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><span>Mô tả tình trạng bệnh</span></td>
                                            <td>
                                                <input type="text" name="textReason"
                                                       value="${sessionScope.bookingID.booking.booking_reason}"
                                                       class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Trạng thái</td>
                                            <td>
                                                <select name="status" class="form-control">
                                                    <option value="Canceled" ${sessionScope.bookingID.booking.status == 'Canceled' ? 'selected' : ''} >
                                                        Canceled
                                                    </option>
                                                    <option value="Pending" ${sessionScope.bookingID.booking.status == 'Pending' ? 'selected' : ''} >
                                                        Pending
                                                    </option>
                                                    <option value="Confirmed" ${sessionScope.bookingID.booking.status == 'Confirmed' ? 'selected' : ''} >
                                                        Confirmed
                                                    </option>
                                                    <option value="Completed" ${sessionScope.bookingID.booking.status == 'Completed' ? 'selected' : ''}>
                                                        Completed
                                                    </option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ghi chú của nhân viên</td>
                                            <td>
                                                <input type="text" name="note"
                                                       value="${sessionScope.bookingID.booking.reason}" required
                                                       class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div class="submit-section">
                                                    <button type="submit" class="btn btn-primary submit-btn">
                                                        Lưu
                                                    </button>
                                                    <a href="appointment_list" class="btn btn-secondary submit-btn">
                                                        Quay lại
                                                    </a>
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
            </div>
        </div>
    </div>
</div>
<!-- /Page Wrapper -->

</div>
<!-- /Main Wrapper -->

<!-- jQuery -->
<script src="view/admin/assets/js/jquery-3.2.1.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="view/admin/assets/js/popper.min.js"></script>
<script src="view/admin/assets/js/bootstrap.min.js"></script>

<!-- Slimscroll JS -->
<script src="view/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="view/admin/assets/plugins/raphael/raphael.min.js"></script>
<script src="view/admin/assets/plugins/morris/morris.min.js"></script>
<script src="view/admin/assets/js/chart.morris.js"></script>

<!-- Custom JS -->
<script src="view/admin/assets/js/script.js"></script>

</body>
</html>