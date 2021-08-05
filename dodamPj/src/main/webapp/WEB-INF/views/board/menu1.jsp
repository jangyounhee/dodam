<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<!-- 자유 게시판용 나중에 변경 -->
<style>
	#btnWrite{
		margin-left : 50px;
	}
	#search{
		
	}
</style>
<script>
	$(document).ready(function(){
			// 페이지 번호
		$(".pagination > li > a").click(function(e) {
			e.preventDefault(); // 페이지 이동 막기
			var page = $(this).attr("href");
			var frmPaging = $("#frmPaging");
			frmPaging.find("[name=page]").val(page);
			frmPaging.submit();
			// -> 주소창에 : http://localhost/board/listAll?page=1&perPage=10&searchType=&keyword=
		});
			
		// 글제목  (10개)
		$(".a_title").click(function(e) {
			e.preventDefault(); // prevent:막다, 방지하다, default: 기본
			// $(this) -> 10개 중에서 클릭한 .a_title
			// attr: attribute(속성)
			var t_no = $(this).attr("data-tno"); // 489
			$("#frmPaging > input[name=t_no]").val(t_no);
			$("#frmPaging").attr("action", "/board/content");
			$("#frmPaging").submit();
		});
	});
</script>
<br/>
<br/>
<br/>
<form id="frmPaging" action="/board/menu1" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}"/>
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${pagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
	<input type="hidden" name="t_no"/>
</form>
<div class="row">
<form action="/board/writeForm" method="get">
	<input type="hidden" name="user_id" value="${sessionScope.loginVo.user_id}"/>

</form>
	<div class="col-md-12">
		<input type="search" id="search" placeholder="검색"/>
		<c:choose>
			<c:when test="${empty sessionScope.loginVo.user_id}">
				
			</c:when>
			<c:otherwise>
				<a href="/board/writeForm" class="btn btn-success" id="btnWrite">글쓰기</a>
			</c:otherwise>
		</c:choose>
		
	</div>
	<div>
		
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<table class="table">
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list }">
				<tr>
				
					<th>${list.t_no}</th>
					<th><a class="a_title" href="#" data-bno=""${list.t_no}">${list.t_title }</a></th>
					<th>${list.t_readcount }</th>
					<th>${list.user_id }</th>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="row">
		<div class="col-md-12">
			<nav>
				<ul class="pagination justify-content-center">
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" 
							href="${pagingDto.startPage - 1}">&laquo;</a>
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
				<c:if test="${pagingDto.endPage < pagingDto.totalPage}">	
					<li class="page-item">
						<a class="page-link" 
							href="${pagingDto.endPage + 1}">&raquo;</a>
					</li>
				</c:if>
				</ul>
			</nav>
		</div>
	</div>

<%@ include file="../include/footer.jsp"%>