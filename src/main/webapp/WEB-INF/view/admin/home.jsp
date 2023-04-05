<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>List Customer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Responsive bootstrap 4 admin template" name="description">
    <meta content="Coderthemes" name="author">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- App favicon -->
    <%--    <link href="assets\libs\sweetalert2\sweetalert2.min.css" rel="stylesheet" type="text/css">--%>
    <link rel="shortcut icon" href="assets\images\favicon.ico">
    <link href="assets/js/sweetalert2.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-stylesheet">
    <link href="assets\css\icons.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body data-layout="horizontal">

<!-- Begin page -->
<div id="wrapper">
<%--    <h1 style="background-color: palegoldenrod; color: white">APPLE SHOP 123</h1>--%>
    <jsp:include page="/WEB-INF/view/admin/header.jsp"></jsp:include>
    <!-- Navigation Bar-->
    <!-- End Navigation Bar-->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content-fluid">
            <!-- Start Content-->
           <div class="row">
               <image style="width: 75%" src="https://beedesign.com.vn/wp-content/uploads/2020/08/Thiet-ke-logo-dien-thoai-apple-123-11.jpg"></image>
               <div class="col-md-3 btn-create">
                   <a href="customer" class="btn btn-outline-success">Customer Manager</a>
                   <a href="product" class="btn btn-outline-success mt-4">Product Manager</a>
                   <p class="mt-4" style="text-underline: #0c4876; color: #0c4876">Địa chỉ:</p>
                   <p>28 Nguyễn Tri Phương, phường Phú Nhuận, TP Huế</p>
                   <p class="mt-4" style="text-underline: #0c4876; color: #0c4876">Số điện thoại:</p>
                   <p>0932357659</p>
                   <p class="mt-4" style="text-underline: #0c4876; color: #0c4876">Tiktok nè: </p>
                   <a href="https://www.tiktok.com/@thaynamlumvechai2">1 triệu tym <3</a>
                   <p class="mt-4" style="text-underline: #0c4876; color: #0c4876">FB nè: </p>
                   <a href="https://www.facebook.com/Sauletb109">Ngàn Năm Cô Đơn</a>
               </div>
           </div>
            <!-- end col -->

        </div>
        <!-- end row -->
        <!-- end container-fluid -->

    </div>


    <!-- end content -->
    <!-- Footer Start -->
    <jsp:include page="/WEB-INF/view/admin/footer.jsp"></jsp:include>

    <!-- end Footer -->

</div>

<!-- ============================================================== -->
<!-- End Page content -->
<!-- ============================================================== -->

</div>
<!-- END wrapper -->

<!-- Right Sidebar -->
<!-- Vendor js -->

<jsp:include page="/WEB-INF/view/admin/vendor.jsp"></jsp:include>

<%--    <jsp:param name="vendor_js" value="index"></jsp:param>--%>

</body>

</html>