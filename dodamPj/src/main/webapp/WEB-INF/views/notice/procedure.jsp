<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
#btnWrite {
	margin-left: 50px;
}

#search {
	
}
</style>
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
						<h2>유기동물 보호절차</h2>
					</div>

					<p class="subTitle">도담 동물보호센터에서 실행하는 유기동물 보호절차에 대해 알려 드립니다.</p>
					<div class="proteBox">

						<img alt="유기동물 발생 및 신고: 각 자치구"
							src="/resources/img/procedure01.jpg"> 유기동물 발생 및 신고: 각 자치구
						<br> <br> <img alt="다음" src="/resources/img/arrow.png"> <img
							alt="각 자치구에서 구조 및 야간 발생 시 임시 보호 조치"
							src="/resources/img/procedure02.jpg"> 각 자치구에서 구조 및 야간 발생 시 임시 보호
						조치 <br> <br> <img alt="다음" src="/resources/img/arrow.png"> <img
							alt="구조장소 및 신고자 등 자치구에 확인 후 동물보호소에 입소, 번호 부여"
							src="/resources/img/procedure03.jpg"> 구조장소 및 신고자 등 자치구에 확인 후
						동물보호소에 입소, 번호 부여 <br> <br> <img alt="다음"
							src="/resources/img/arrow.png"> <img
							alt="기본진료, 전염병(홍역, 파보, 심장사상충)확인, 보호실 배정"
							src="/resources/img/procedure04.jpg"> 기본진료, 전염병 (홍역, 파보,
						심장사상충)확인, 보호실 배정 <br> <br> <img alt="다음"
							src="/resources/img/arrow.png"> <img
							alt="10일간의 공고기간 동안 주인 반환 대기" src="/resources/img/procedure05.jpg">
						10일간의 공고기간 동안 주인 반환 대기 <br> <br> <img alt="다음"
							src="/resources/img/arrow.png"> <img alt="10일 보호 이후 입양 대기"
							src="/resources/img/procedure06.jpg"> 10일 보호 이후 입양 대기
						<br>


					</div>
				</div>
			</div>
		</div>
	</div>	
</div>	
<%@ include file="../include/footer.jsp"%>