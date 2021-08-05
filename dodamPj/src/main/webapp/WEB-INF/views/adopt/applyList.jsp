<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form id="frmPaging" action="/adopt/applyList" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}"/>
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${pagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
</form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin-top:10px; text-align:center;" >
			<img src="/resources/img/adoptBanner.jpg">
		</div>
	</div>
	<div class="row" style="margin-top:10px;">
		<div class="col-md-2">
 			<div class="border-end bg-white" id="sidebar-wrapper">
   				<div class="list-group list-group-flush">
                	<a class="list-group-item" style="background-color:#CCF2F4;">
                		<strong><i class="fas fa-paw"></i> 입양 관리</strong></a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/adopt/adoptInfo">- 입양 안내</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/adopt/applyAdopt">- 입양 신청</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/adopt/applyList">- 입양 신청 조회</a>
                </div>
            </div>
		</div>
	<div class="col-md-10">
		<h2>입양 신청 및 상담 시간 조회</h2>
		<hr/>
		<img src="/resources/img/adoptInfoBanner.jpg"/>
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
											<c:when test="${pagingDto.searchType =='un'}">작성자&nbsp;</c:when>
											<c:when test="${pagingDto.searchType =='date'}">상담예정일&nbsp;</c:when>
										</c:choose>
									</span>
									<div class="dropdown-menu" 
										aria-labelledby="navbarDropdownMenuLink">
										<a class="dropdown-item searchType" href="un">작성자</a> 
										<a class="dropdown-item searchType" href="date">상담예정일</a> 
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
								<th>상담 예정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="applyUserVo" items="${auList}">
								<tr>
									<td>${applyUserVo.au_no}</td>
									<td><a href="/adopt/applyContent?au_no=${applyUserVo.au_no}">${applyUserVo.form_title}</a></td>
									<td>${applyUserVo.user_name}</td>
									<td>${applyUserVo.adopt_date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
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
<%@ include file="../include/footer.jsp" %>