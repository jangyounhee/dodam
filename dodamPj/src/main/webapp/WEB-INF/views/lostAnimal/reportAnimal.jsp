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
	
	$(".a_title").click(function(e) {
		e.preventDefault();
		var b_no = $(this).attr("data-bno");
		$("#frmPaging > input[name=b_no]").val(b_no);
		$("#frmPaging").attr("action", "/lostAnimal/reportContent");
		$("#frmPaging").submit();
	});
	
});
</script>
<form id="frmPaging" action="/lostAnimal/reportList" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}"/>
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${pagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
	<input type="hidden" name="b_no"/>
</form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin-top:10px; text-align:center;" >
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
		<h2>분실 신고</h2>
		<hr/>
			<ul>
				<li>동물을 분실한 경우 동물정보를 올려 분실 동물을 찾을 수 있는 공간입니다.</li>
				<li>동물을 분실한 경우 동물보호법 제12조 제1항 및 같은 법 시행규칙 제8조 제1항 및 제9조 제2항에 따라 등록대상동물을
					10일 이내 시장, 군수, 구청장에게 분실 신고하셔야 합니다.<br>
					(다만, 동물보호관리시스템에서 소유자가 직접 동물상태 수정 가능)</li>
				<li>로그인 후 분실신고를 등록할 수 있습니다.</li>
			</ul>
			<br>
			
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
											<c:when test="${pagingDto.searchType =='t'}">제목&nbsp;</c:when>
											<c:when test="${pagingDto.searchType =='un'}">작성자&nbsp;</c:when>
										</c:choose>
									</span>
									<div class="dropdown-menu" 
										aria-labelledby="navbarDropdownMenuLink">
										<a class="dropdown-item searchType" href="t">제목</a> 
										<a class="dropdown-item searchType" href="un">작성자</a> 
									</div>
								</li>
							</ul>
							<form class="form-inline">
								<input class="form-control mr-sm-2" type="text" placeholder="검색어를 입력해주세요."
									aria-label="Search" value="${pagingDto.keyword}" id="searchTxt"/>
								<button class="btn btn-primary my-2 my-sm-0" type="button" id="btnSearch">검색</button>
							</form>
						</div>
					</nav>
				</div>
			</div>
			<!-- 검색기능 end -->
			
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>No.</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="lostVo" items="${list}">
								<tr>
									<td>${lostVo.b_no}</td>
									<td>
										<a class="a_title" href="#" data-bno="${lostVo.b_no}">
											${lostVo.b_title}
										</a>
									</td>
									<td>${lostVo.user_name}</td>
									<td>${lostVo.write_date}</td>
									<td>${lostVo.b_viewcnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<a class="btn btn-info" href="/lostAnimal/reportAnimalForm">신고서 작성</a>
			
		<!-- 페이징 -->
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<nav>
				<ul class="pagination justify-content-center">
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.startPage - 1}">&laquo;</a>
					</li>
				</c:if>
				<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
					<li
						<c:choose>
							<c:when test="${pagingDto.page == v}">
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
				<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
					<li class="page-item">
						<a class="page-link" href="${pagingDto.endPage + 1}">&raquo;</a>
					</li>
				</c:if>
				</ul>
			</nav>
		</div>
	<!-- 페이징 end -->
	
	</div>
  </div>
</div>  
<%@ include file="../include/footer.jsp" %>