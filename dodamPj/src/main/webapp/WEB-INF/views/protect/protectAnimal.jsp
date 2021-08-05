<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
	$(".pagination > li > a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		var frmPaging = $("#frmPaging");
		frmPaging.find("[name=page]").val(page);
		frmPaging.submit();
	});
	
	$(".searchType").click(function(e) {
		e.preventDefault();
		var searchType = $(this).attr("href");
		$("#frmPaging > input[name=searchType]").val(searchType);
		$("#spanSearchType").text($(this).text());
	});
	
	$("#btnSearch").click(function() {
		var searchType = $("#frmPaging > input[name=searchType]").val();
		if(searchType == "") {
			alert("검색 옵션을 선택해 주세요");
			return;
		}
		var keyword = $("#searchTxt").val().trim();
		if(keyword == "") {
			alert("검색어를 입력해 주세요");
			return;
		}
		
		$("#frmPaging > input[name=keyword]").val(keyword);
		$("#frmPaging > input[name=page]").val("1");
		$("#frmPaging").submit();
	});
});
</script>

<form id="frmPaging" action="/protect/protectAnimal" method="get">
	<input type="hidden" name="page" value="${aPagingDto.page}"/>
	<input type="hidden" name="perPage" value="${aPagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${aPagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${aPagingDto.keyword}"/>
</form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin-top:5px; text-align:center;" >
			<img src="/resources/img/lostBanner.jpg">
		</div>
	</div>
	<div class="row" style="margin-top:10px;">
		<div class="col-md-2">
 			<div class="border-end bg-white" id="sidebar-wrapper">
   				<div class="list-group list-group-flush">
                	<a class="list-group-item" style="background-color:#CCF2F4;">
                		<strong><i class="fas fa-paw"></i> 유실/유기동물</strong></a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/protect/protectAnimal">- 보호중인 동물</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/lostAnimal/reportList">- 분실 신고</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/lostAnimal/infoGetAnimal">- 습득시 안내</a>
                </div>
            </div>
		</div>
	<div class="col-md-10" style="margin-bottom:0px;">
		<h2>보호중인 동물</h2>
		<hr/>
		<ul>
			<li>동물을 분실한 경우 동물정보를 올려 분실 동물을 찾을 수 있는 공간입니다.</li>
			<li>동물을 분실한 경우 동물보호법 제12조 제1항 및 같은 법 시행규칙 제8조 제1항 및 제9조 제2항에 따라 등록대상동물을
				10일 이내 시장, 군수, 구청장에게 분실 신고하셔야 합니다.</li>
		</ul>
		
		<!-- 검색기능 -->
			<div class="row">
				  <div class="col-md-12">
					<nav class="navbar navbar-expand">
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="navbar-nav">
								<li class="nav-item dropdown">
								<button class="btn btn-default dropdown-toggle" type="button" 
								id="dropdownMenuButton" data-toggle="dropdown">검색</button>
									<span id="spanSearchType" style="color:#000; font-weight:bold;">
										<c:choose>
											<c:when test="${aPagingDto.searchType =='species'}">품종&nbsp;</c:when>
											<c:when test="${aPagingDto.searchType =='gender'}">성별&nbsp;</c:when>
											<c:when test="${aPagingDto.searchType =='age'}">나이&nbsp;</c:when>
											<c:when test="${aPagingDto.searchType =='place'}">발견장소&nbsp;</c:when>
										</c:choose>
									</span>
									<div class="dropdown-menu" 
										aria-labelledby="navbarDropdownMenuLink">
										<a class="dropdown-item searchType" href="species">품종</a> 
										<a class="dropdown-item searchType" href="gender">성별</a> 
										<a class="dropdown-item searchType" href="age">나이</a> 
										<a class="dropdown-item searchType" href="place">발견장소</a> 
									</div>
								</li>
							</ul>
							<form class="form-inline">
								<input class="form-control mr-sm-2" type="text" placeholder="검색어를 입력해주세요."
									aria-label="Search" value="${aPagingDto.keyword}" id="searchTxt"/>
								<button class="btn btn-primary my-2 my-sm-0" type="button" id="btnSearch">검색</button>
							</form>
						</div>
					</nav>
				</div>
			</div>
			<!-- 검색기능 end -->
			
			<div class="row">
				<div class="col-md-12">
					<section class="py-5">
						<div class="container px-4 px-lg-5 mt-5">
							<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							<c:forEach var="animalVo" items="${aList}">
								<div class="col mb-5">
									<div class="card h-100">
										<!-- Product image-->
										<img class="card-img-top" style="height:160px; width:236.5px;" src="http://localhost/protect/displayImage?fileName=${animalVo.a_picture}" alt="..." />
										<div class="card-body" style="padding:0px; margin-top:5px; margin-right:5px;">
											<ul style="padding-left:30px;">
												<li><span>품종 : </span>${animalVo.a_species}</li>
												<li><span>성별 : </span>${animalVo.a_gender}</li>
												<li><span>나이 : </span>${animalVo.a_age}</li>
												<li><span>발견장소 : </span>${animalVo.a_findplace}</li>
												<li><span>상태 : </span>${animalVo.a_state}</li>
											</ul>
										</div>
										<!-- Product actions-->
										<div class="card-footer pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-outline-dark mt-auto" style="margin-bottom:2px;"
													href="/protect/protectAnimalCont?a_no=${animalVo.a_no}">자세히보기</a><br>		
											</div>
										</div>
									</div>
								</div>
							</c:forEach>						
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
		
		<!-- 페이징 -->
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<nav>
				<ul class="pagination justify-content-center">
				<c:if test="${aPagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${aPagingDto.startPage - 1}">&laquo;</a>
					</li>
				</c:if>
				<c:forEach var="v" begin="${aPagingDto.startPage}" end="${aPagingDto.endPage}">
					<li
						<c:choose>
							<c:when test="${aPagingDto.page == v}">
								class="page-item active"
							</c:when>
							<c:otherwise>
								class="page-item"
							</c:otherwise>
						</c:choose>
					>
						<a class="page-link" href="${v}">${v}</a>
					</li>
				</c:forEach>
				<c:if test="${aPagingDto.endPage < aPagingDto.totalPage}">
					<li class="page-item">
						<a class="page-link" href="${aPagingDto.endPage + 1}">&raquo;</a>
					</li>
				</c:if>
				</ul>
			</nav>
		</div>
	<!-- 페이징 end -->
		
  </div>
</div>  
<%@ include file="../include/footer.jsp" %>