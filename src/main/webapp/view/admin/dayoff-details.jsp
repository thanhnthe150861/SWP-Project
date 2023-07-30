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
                    <li>
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
                    <li class="active">
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
                            <i class="fa fa-sign-out-alt"></i>
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
                        <h3 class="page-title">Xin chào ${sessionScope.staff.name}</h3>
                        <span>Nhân viên</span>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="staff_dashboard">Bảng điều khiển</a></li>
                            <li class="breadcrumb-item active">Danh sách xin nghỉ</li>
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
                                <form action="day_off_details" method="post">
                                    <table class="table table-bordered table-striped">
                                        <tbody>
                                        <tr>
                                            <td style="width: 180px;"><span>Mã đơn</span></td>
                                            <td>
                                                <input type="text" name="did" value="${sessionScope.dayOff.id}" readonly
                                                       class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><span>Bác sĩ</span></td>
                                            <td>
                                                <h2 class="table-avatar">
                                                    <a href="#" class="avatar avatar-sm mr-2">
                                                        <img class="avatar-img rounded-circle"
                                                             src="${sessionScope.dayOff.doctor.url}">
                                                    </a>
                                                    <a href="#">${sessionScope.dayOff.doctor.name}
                                                    </a>
                                                </h2>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ngày nghỉ</td>
                                            <td>
                                                <input type="date" name="date" value="${sessionScope.dayOff.date}"
                                                       class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ca xin nghỉ</td>
                                            <td>
                                                <select name="slotGroup" class="form-control">
                                                    <c:forEach items="${sessionScope.slotList}" var="sl">
                                                        <option value="${sl.id}" ${sessionScope.dayOff.slot_id == sl.id ? 'selected' : ''}>
                                                                ${sl.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><span>Lý do xin nghỉ</span></td>
                                            <td>
                                                <input type="text" name="textReason"
                                                       value="${sessionScope.dayOff.reason}"
                                                       class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ghi chú của nhân viên</td>
                                            <td>
                                                <input type="text" name="note"
                                                       value="${sessionScope.dayOff.note}"
                                                       class="form-control">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Trạng thái</td>
                                            <td>
                                                <select name="status" class="form-control">
                                                    <option value="Canceled" ${sessionScope.dayOff.status == 'Canceled' ? 'selected' : ''}>
                                                        Canceled
                                                    </option>
                                                    <option value="Pending" ${sessionScope.dayOff.status == 'Pending' ? 'selected' : ''}>
                                                        Pending
                                                    </option>
                                                    <option value="Confirmed" ${sessionScope.dayOff.status == 'Confirmed' ? 'selected' : ''}>
                                                        Confirmed
                                                    </option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div class="submit-section">
                                                    <button type="submit" class="btn btn-primary submit-btn">
                                                        Lưu
                                                    </button>
                                                    <a href="list_day_off_doctor" class="btn btn-secondary submit-btn">
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