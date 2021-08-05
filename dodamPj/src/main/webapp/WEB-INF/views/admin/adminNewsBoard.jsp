<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function() {
	// 페이징
	$(".pagination > li > a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		var frmPaging = $("#frmPaging");
		frmPaging.find("[name=page]").val(page);
		frmPaging.submit();
	});
	
	// 글제목  (10개)
	$(".a_title").click(function(e) {
		e.preventDefault(); // prevent:막다, 방지하다, default: 기본
		// $(this) -> 10개 중에서 클릭한 .a_title
		// attr: attribute(속성)
		var ab_no = $(this).attr("data-bno"); // 489
		$("#frmPaging > input[name=ab_no]").val(ab_no);
		$("#frmPaging").attr("action", "/admin/adminNewsBoard");
		$("#frmPaging").submit();
	});
	
	// 검색 옵션 선택
	$(".searchType").click(function(e) {
		e.preventDefault();
		var searchType = $(this).attr("href");
		$("#frmPaging > input[name=searchType]").val(searchType);
		$("#spanSearchType").text($(this).text());
	});
	
	// 검색버튼
	$("#btnSearch").click(function() {
		var searchType = 
			$("#frmPaging > input[name=searchType]").val();
		if (searchType == "") {
			alert("검색 옵션을 먼저 선택해 주세요");
			return;
		}
		var keyword = $("#txtSearch").val().trim();
		if (keyword == "") {
			alert("검색어를 입력해 주세요");
			return;
		}
		$("#frmPaging > input[name=keyword]").val(keyword);
		$("#frmPaging > input[name=page]").val("1");
		$("#frmPaging").submit();
	});
});
</script>
<form id="frmPaging" action="/admin/adminNewsBoard" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}"/>
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${pagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
	<input type="hidden" name="ab_no"/>
</form>
<!-- 배너 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<img style="margin-top:10px; text-align:center;" src="/resources/img/communityBanner.jpg">
		</div>
	</div>
	
	<!-- 검색 -->
	<div class="row">
			<div class="col-md-8"></div>
			<div class="col-md-4">
				<!--검색 -->
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown">검색옵션</button>
					<span id="spanSearchType" style="color:#336699; font-weight:bold;">
					<c:choose>
						<c:when test="${pagingDto.searchType == 't'}">제목</c:when>
						<c:when test="${pagingDto.searchType == 'tc'}">제목+내용</c:when>
						<c:when test="${pagingDto.searchType == 'u'}">작성자</c:when>
					</c:choose>
					</span>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					 <a class="dropdown-item searchType" href="t">제목</a> 
					 <a class="dropdown-item searchType" href="tc">제목+내용</a> 
					 <a class="dropdown-item searchType" href="u">작성자</a> 
					</div>
					<form
                     class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                     <div class="input-group">
                         <input type="text" class="form-control bg-light border-0 small" placeholder="검색어를 입력하세요"
                             aria-label="Search" aria-describedby="basic-addon2"
                             id="txtSearch" value="${pagingDto.keyword}">
                         <div class="input-group-append">
                             <button class="btn btn-default" type="button" id="btnSearch">
                                 <i class="fas fa-search fa-sm"></i>
                             </button>
                             <a href="adminNewsBoardWriteForm" class="btn btn-primary">글쓰기</a>
                         </div>
                     </div>
                 </form>
				</div>
			</div>
		</div>
		<!-- 검색끝 -->
			<!-- 카테고리 -->
			<div class="row">
				<div class="col-md-2">
		        	<div class="border-end bg-white" id="sidebar-wrapper">
		                <div class="list-group list-group-flush">
		                	<a class="list-group-item" style="background-color:#CCF2F4;">
		                		<strong><i class="fas fa-paw"></i> 커뮤니티</strong></a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/adminFreeBoard">- 자유게시판</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/adminNewsBoard">- 동물 정보/뉴스</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/adminCustomerBoard">- 고객센터</a>
		                </div>
		            </div>
				</div>
				<!-- 카테고리 끝 -->
			
			<!-- 게시판 -->	
			<div class="col-md-10">
				<h1>동물 정보/뉴스</h1>
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="newsBoardVo" items="${list}">
							<tr>
								<td>${newsBoardVo.ab_no}</td>
								<td><a class="ab_title" href="/admin/adminNewsBoardContent?ab_no=${newsBoardVo.ab_no}" data-bno="${newsBoardVo.ab_no}">${newsBoardVo.ab_title}</a></td>
								<td>${newsBoardVo.ab_count}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
<!-- 페이징 -->
		<div class="row">
			<div class="col-md-12">
				<nav>
					<ul class="pagination justify-content-center">
					<c:if test="${pagingDto.startPage != 1 }">
						<li class="page-item"><a class="page-link" href="${pagingDto.startPage - 1 }">&laquo;</a>
						</li>
					</c:if>
					<c:forEach var="v" begin="${pagingDto.startPage}" 
								   end="${pagingDto.endPage}">
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
					<c:if test="${pagingDto.endPage < pagingDto.totalPage }">
						<li class="page-item"><a class="page-link" href="${pagingDto.endPage + 1 }">&raquo;</a></li>
					</c:if>	
					</ul>
				</nav>
			</div>
		</div>
<%@ include file="../include/footer.jsp" %>