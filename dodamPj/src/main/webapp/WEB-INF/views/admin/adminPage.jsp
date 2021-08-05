<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/adminHeader.jsp"%>
<!-- 관리자용 헤더 사용 -->
<script>
	$(document).ready(function() {
		var href="/notice/noticeList";
		$("input[name=tabs]").click(function() {
			if ($("input[name=tabs]:checked").val() == "freeBoard") {
				console.log("자유게시판 클릭");
				$("#freeBoard").show();
				$("#notice").hide();
				href="/board/menu1";
				
			} else if ($("input[name=tabs]:checked").val() == "notice") {
				console.log("공지사항 클릭");
				$("#notice").show();
				$("#freeBoard").hide();
				href="/notice/noticeList";
			}
		});
		$("#btnPlus").click(function(){
			location.href=href;
		});
	});
</script>
<style>
	.border{
		border-bottom: 1px solid red;
	}
</style>

	<div class="container-fluid" style="margin-top: 20px">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="carousel slide" id="carousel-977979">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-977979" class="active"></li>
					<li data-slide-to="1" data-target="#carousel-977979"></li>
					<li data-slide-to="2" data-target="#carousel-977979"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap First"
							src="/resources/img/petAdoptCost.jpg" />
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second"
							src="/resources/img/petEtiquette.jpg" />
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third"
							src="/resources/img/personEtiquette.jpg" />
					</div>
				</div>
				<a class="carousel-control-prev" href="#carousel-977979"
					data-slide="prev"><span class="carousel-control-prev-icon"></span>
					<span class="sr-only">Previous</span></a> <a
					class="carousel-control-next" href="#carousel-977979"
					data-slide="next"><span class="carousel-control-next-icon"></span>
					<span class="sr-only">Next</span></a>
			</div>
			<div class="row">
				<div class="col-md-5">
					<div id="tabMenu">
						<input type="radio" id="noticeTab" name="tabs" value="notice"
							checked /> <label for="noticeTab"><i class="fas fa-dog"></i>
							공지사항</label> <input type="radio" id="freeBoardTab" name="tabs"
							value="freeBoard" /> <label for="freeBoardTab"><i
							class="fas fa-cat"></i> 자유게시판</label>
						<button type="button" class="btn btn-default" id="btnPlus" href="/notice/noticeList"
							style="margin-left: 210px;">+ 더보기</button>

						<%-- 						<c:choose> --%>
						<%-- 							<c:when test="${checked=checked }"> --%>
						<div id="notice" class="tabContent" >
							<c:forEach var="list" items="${noticeList }">
								<ul>
									<li><a href="/notice/content?n_no=${list.n_no }">${list.n_title }</a></li>
								</ul>
							</c:forEach>
						</div>

						<%-- 							</c:when> --%>
						<%-- 							<c:otherwise> --%>
						<div id="freeBoard" class="tabContent" style="display: none">
							<ul>
								<li><a href="#">레데리 못한지 오조오억년 된 것 같다.</a></li>
								<li><a href="#">GTA6 언제나올까?</a></li>
								<li><a href="#">[참가모집] 여름 방학 기간, 흉가 체험 하실분!</a></li>
								<li><a href="#">강아지랑 같이 갈만한 여행지 추천받아요ㅎㅎ</a></li>
								<li><a href="#">장마 겁나 싫어 비 오지게 내리네</a></li>
							</ul>
						</div>
						<%-- 							</c:otherwise> --%>
						<%-- 						</c:choose> --%>


					</div>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-5">
					<div id="tabMenu">
					<input type="radio" id="animalTab" name="tabs2" checked/>
					<label for="animalTab"><i class="fas fa-hand-holding-heart"></i> 유기동물 공고</label>
					<a class="btn btn-primary" href="/adopt/applyAdopt" style="margin-left:128px;">+ 유기동물 더 보러가기</a>
					<div class="card" style="max-width: 500px; margin-bottom:10px;">
						<p style="text-align:center; font-size:16px;">
							<strong><span style="color:blue;">반려 동물</span>, 사지 말고 <span style="color:red;">입양</span>하세요!</strong>
						</p>
    				<div class="row no-gutters">
       					<div class="col-sm-5" style="background: #868e96;">
          					<img class="card-img-top h-100" src="/resources/img/mung.jpg" alt="...">
       					</div>
       						<div class="col-sm-7">
            					<div class="card-body">
            						<ul>
            							<li>품종 : 믹스견</li>
            							<li>성별 /나이 : 수컷/1세(추정)</li>
            							<li>발견장소 : 북구 화봉동 788</li>
            						</ul>
           						</div>
       						</div>
   						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>

	