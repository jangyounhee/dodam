<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hnzhq1px47"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<img style="margin-top: 10px; text-align: center;"
					src="/resources/img/centerBanner.jpg">
				<div class="row" style="margin-top: 10px;">
					<div class="col-md-2">
						<div class="border-end bg-white" id="sidebar-wrapper">
							<div class="list-group list-group-flush">
								<a class="list-group-item" style="background-color:#CCF2F4;">
                			<strong><i class="fas fa-paw"></i> 도담센터</strong></a>
                   			<a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    			href="/notice/noticeList">- 공지 사항</a>
                   			<a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    			href="/notice/procedure">- 보호절차</a>
                  			<a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    			href="/notice/map">- 오시는 길</a>
							</div>
						</div>
					</div>

					<div class="col-md-10">
						<div class="jumbotron">
							<h2>오시는길</h2>
						</div>
						<div id="map" style="w idth: 50%; height: 350px;"></div>
					
	<script>
		var mapOptions = {
			center : new naver.maps.LatLng(35.535078472924496, 129.31086858555648),
			zoom : 150
		};

		var map = new naver.maps.Map('map', mapOptions);

		var markerOptions = {
			position : new naver.maps.LatLng(35.535078472924496, 129.31086858555648),
			map : map
		}

		var marker = new naver.maps.Marker(markerOptions);
	</script>
	<br><br>
	<div class="listU margin_auto tmgn10 bmgn10" style="width:942px;">
	<p style="font-size:30px;"><em><strong>대중교통 이용 시</strong></em></p>
	<ul>
		<li style="list-style-type:square !important; line-height:18px; margin:5px 0 5px 20px">
			<span class="bold lspacing05">주&nbsp;&nbsp;&nbsp;소</span> :  (446-77) 울산광역시 남구 삼산로35번길 19 (신정동)</li>
				<li style="list-style-type:square !important; line-height:18px; margin:5px 0 5px 20px">
					<span class="bold lspacing05">버&nbsp;&nbsp;&nbsp;스</span> :
					<div>
						<strong>- 지선 :</strong> 921<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>922<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>928<br>
						<strong>- 일반 :</strong> 106<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>107<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>124<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>126<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>127<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>134<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>205<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>205 (지원)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>216<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>226<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>235<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>235 (지원)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>256<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>266<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>307<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>317<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>327<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>337<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;357<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>401<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>406<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>411<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>412<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>413<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>415<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>417<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>417 (지원)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>426<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>427<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>432<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;432 (지원)(달천농공단지입구-율리공영차고지종점)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>432 (지원)(율리공영차고지-달천회관앞)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>433<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>453<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;453 (지원)(달천농공단지입구-율리공영차고지종점)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>453 (지원)(율리공영차고지-달천농공단지입구)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>472<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>482<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>527<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>527 (지원)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;705<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>708<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>708 (지원)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>713<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>714<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>715<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>718<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>718 (지원)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>724<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>728<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>732<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>732 (지원)<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>733<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>744<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>807<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>824<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>837<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;837 (지원)(LH2단지,호반베르디움-태화강역)<br>
						<strong>- 좌석 :</strong> 1127<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>1137<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>1401<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>1703<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>1713<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>1723<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>2100<span class="gray">&nbsp;&nbsp;|&nbsp;&nbsp;</span>2300<br>
						<strong>- 급행 :</strong> 5004
					</div>
				</li>
			</ul>
		</div>
	</div>
	</div>
	</div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>