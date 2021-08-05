<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<script>
$(document).ready(function() {	
// 	var msgDelete = "${msgDelete}";
// 	if (msgDelete == "success") {
// 		alert("글 삭제 완료");
// 	}

	$(".pagination > li > a").click(function(e) {
		e.preventDefault(); 
		var page = $(this).attr("href");
		var frmPaging = $("#frmPaging");
		frmPaging.find("[name=page]").val(page);
		frmPaging.submit();

	});
	
	// 글제목  (10개)
	$(".a_title").click(function(e) {
		e.preventDefault();
		var v_no = $(this).attr("data-vno"); // 489
		$("#frmPaging > input[name=v_no]").val(v_no);
		$("#frmPaging").attr("action", "/board/content");
		$("#frmPaging").submit();
	});
});
</script>

<form id="frmPaging" action="/volunteer/volunReservList" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}"/>
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${pagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
	<input type="hidden" name="v_no"/>
</form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<img style="margin-top: 10px; text-align: center;"
				src="/resources/img/volunteerBanner.jpg">
		</div>
	</div>
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-2">
			<div class="border-end bg-white" id="sidebar-wrapper">
				<div class="list-group list-group-flush">
					<a class="list-group-item" style="background-color: #CCF2F4;">
						<strong><i class="fas fa-paw"></i> 봉사활동</strong>
					</a> <a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="/volunteer/reservationForm">- 봉사활동 예약</a> <a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="/volunteer/volunReservList">- 봉사활동 현황</a>
				</div>
			</div>
		</div>
		<div class="col-md-10">
		
			<div class="jumbotron">
				<h2>봉사활동 현황</h2>
			</div>
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>이름</th>
							<th>나이</th>
							<th>신청 지역</th>
							<th>신청 날짜</th>
							<th>신청 시간</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="volunteerVo" items="${list}">
						<tr>
							<td>${volunteerVo.v_no}</td>
							<td>${volunteerVo.v_name}</td>
							<td>${volunteerVo.v_age}</td>
							<td>${volunteerVo.v_place}</td>
							<td>${volunteerVo.v_date}</td>
							<td>${volunteerVo.v_time}</td>
						</tr>
					
					</c:forEach>
	
					</tbody>
				</table>
			</div>

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
	
</div>
<%@ include file="../include/footer.jsp" %>