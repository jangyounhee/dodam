<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="kor">

<head>
<script type="text/javascript">
 $(document).ready(function(){
	 $("#btnChatting").click(function(){
		 console.log("클릭");
		 $("#chattingId").submit();
	 });
 });
</script>
<style>
.inline {
	border-bottom: 1px solid black;
}
</style>

<style type="text/css">
	table {

	.ck ck-editor{
		max-width: 500px;
		overflow: scroll;
	}
	
	.ck-editor__editable{
		min-height: 500px;
		max-height: 500px;
		overflow: scroll;
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


 <!-- ======= Top Bar ======= -->
	<c:choose>
	<c:when test="${empty sessionScope.loginVo }">
		<div id="topbar" class="d-none d-lg-flex align-items-center">
			<div class="container d-flex">
				<div class="contact-info mr-auto"></div>
				<div class="social-links">
					<a href="/user/memberLogin" class="login">로그인</a> 
					<a href="/user/joinForm" class="joinMember">회원가입</a>
				</div>
			</div>
		</div>
	</c:when>
		<c:otherwise>
			<div id="topbar" class="d-none d-lg-flex align-items-center">
			<div class="container d-flex">
				<div class="contact-info mr-auto"></div>
				<div class="social-links">
					<a href="#" class="login">${sessionScope.loginVo.user_id}</a> 
					<c:choose>
						<c:when test="${loginVo.auth_level == 0}">
							<a href="/user/myPage?user_id=${memberVo.user_id}" 
								class="myPage">마이페이지</a>
							<a href="/volunteer/myReservation?user_id=${memberVo.user_id}" 
								class="myReservation">나의 예약 정보</a>
						</c:when>
						<c:otherwise>
							<a href="/admin/adminPage" class="adminPage">관리자 페이지로 이동</a>
						</c:otherwise>
					</c:choose>
					<a href="/user/logout" class="joinMember">로그아웃</a>
				</div>
			</div>
		</div>
		</c:otherwise>
	</c:choose>

  <!-- ======= Header ======= -->
   <header id="header">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="/"><i class="fas fa-paw"></i> DoDam</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active">
          <li class="drop-down"><a href="#">도담센터</a>
            <ul>
              <li><a href="/notice/noticeList">- 공지 사항</a></li>
              <li><a href="/notice/procedure">- 보호 절차</a></li>
              <li><a href="/notice/map">- 오시는 길</a></li>
            </ul>
          </li>
          <li class="drop-down"><a href="#">유실/유기동물</a>
            <ul>
              <li><a href="/protect/protectAnimal">- 보호중인 동물</a></li>
              <li><a href="/lostAnimal/reportList">- 분실 신고</a></li>
              <li><a href="/lostAnimal/infoGetAnimal">- 습득시 안내</a></li>              
            </ul>
          </li>
          <li class="drop-down"><a href="#">봉사활동</a>
            <ul>
              <li><a href="/volunteer/reservationForm">- 봉사활동 예약</a></li>
              <li><a href="/volunteer/volunReservList">- 봉사활동 조회</a></li>
            </ul>
          </li>
          <li class="drop-down"><a href="#">입양 관리</a>
            <ul>
              <li><a href="/adopt/adoptInfo">- 입양 안내</a></li>
              <li><a href="/adopt/applyAdopt">- 입양 신청</a></li>
              <li><a href="/adopt/applyList">- 입양 신청 조회</a></li>
            </ul>
          </li>
          <li class="drop-down"><a href="#">커뮤니티</a>
            <ul>
              <li><a href="/board/freeBoard">- 자유게시판</a></li>
              <li><a href="/newsboard/newsBoard">- 동물정보/뉴스</a></li>
              <li><a href="#"  onclick='javascript:window.open("http://192.168.0.234/user/chatting?user_id=${sessionScope.loginVo.user_id}","name99", "width=500px,height=650px,left=100px,top=100px");'>- 실시간 상담</a></li>
              <li><a href="/customerboard/customerBoard">- 고객센터</a></li>
            </ul>
          </li>
        </ul>
      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->
  
  