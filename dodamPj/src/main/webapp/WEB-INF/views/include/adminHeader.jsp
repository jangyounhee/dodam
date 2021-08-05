<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">

<head>
<style>
	.inline{
border-bottom: 1px solid black;
}
</style>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>도담 동물 보호 센터</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/resources/img/favicon.png" rel="icon">
  <link href="/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="/resources/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/resources/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="/resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/css/style.css" rel="stylesheet">
  
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/resources/vendor/php-email-form/validate.js"></script>
  <script src="/resources/vendor/venobox/venobox.min.js"></script>
  <script src="/resources/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="/resources/vendor/counterup/counterup.min.js"></script>
  <script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
  <script src="https://kit.fontawesome.com/f08b10fb42.js" crossorigin="anonymous"></script>

  <!-- Template Main JS File -->
  <script src="/resources/js/main.js"></script>

  <!-- =======================================================
  * Template Name: Medilab - v2.1.1
  * Template URL: https://bootstrapmade.com/medilab-free-medical-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

 <div id="topbar" class="d-none d-lg-flex align-items-center">
			<div class="container d-flex">
				<div class="contact-info mr-auto"></div>
				<div class="social-links">
					<a href="/member/memberLogin" class="login">${sessionScope.loginVo.user_id}</a> 
					<a href="/main/main" class="myPage">사용자 페이지 이동</a>
					<a href="/admin/logout" class="joinMember">로그아웃</a>
				</div>
			</div>
		</div>
 <!-- ======= Top Bar ======= -->
 <!-- ======= Top Bar ======= -->
	
	<!-- ======= Header ======= -->
  <!-- ======= Header ======= -->
  <header id="header">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="/admin/adminPage"><i class="fas fa-paw"></i>DoDam(관리자)</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active">
          <li class="drop-down"><a href="#">공지사항 관리</a>
            <ul>
            	<li><a href="/admin/noticeList">- 공지 사항 목록</a></li>
            	<li><a href="/notice/noticeWriteForm">- 공지 사항 등록</a></li>
            </ul>
          </li>
         	<li class="drop-down"><a href="#">유실/유기동물 관리</a>
            <ul>
            	<li><a href="/admin/adminProtectList">- 보호동물 목록 관리</a></li>
				<li><a href="/admin/protectAnimalForm">- 보호동물 등록</a></li>
            </ul>
         	</li>
          <li class="drop-down"><a href="#">봉사활동  관리</a>
            <ul>
              <li><a href="/admin/adminReservation_status">- 봉사활동 신청 현황</a></li>
              <li><a href="/volunteer/volunReservList">- 봉사활동 조회</a></li>
            </ul>
          </li>
          <li class="drop-down"><a href="#">입양 관리</a>
            <ul>
              <li><a href="/admin/adoptList">- 입양 동물 목록 관리</a></li>
              <li><a href="/admin/animalInsertForm">- 입양 동물 등록</a></li>
            </ul>
          </li>
           <li class="drop-down"><a href="#">자유 게시판 관리</a>
           	<ul>
              <li><a href="/admin/adminFreeBoard">- 자유 게시판 관리</a></li>
              <li><a href="/admin/adminNewsBoard">- 동물 정보/뉴스 관리</a></li>
              <li><a href="/admin/adminCustomerBoard">- 고객센터 관리</a></li>
            </ul>
          </li>

        </ul>
      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->
  