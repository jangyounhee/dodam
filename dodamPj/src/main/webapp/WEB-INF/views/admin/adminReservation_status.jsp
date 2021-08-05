<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/adminHeader.jsp"%>

<script>
	$(document).ready(function() {

						$(".pagination > li > a").click(function(e) {
							e.preventDefault();
							var page = $(this).attr("href");
							var frmPaging = $("#frmPaging");
							frmPaging.find("[name=page]").val(page);
							frmPaging.submit();

						});

						// 검색 옵션 선택
						$(".searchType").click(
								function(e) {
									e.preventDefault();
									var searchType = $(this).attr("href");
									$("#frmPaging > input[name=searchType]")
											.val(searchType);
									$("#spanSearchType").text($(this).text());
								});

						// 검색버튼
						$("#btnSearch")
								.click(
										function() {
											var searchType = $(
													"#frmPaging > input[name=searchType]")
													.val();
											if (searchType == "") {
												alert("검색 옵션을 먼저 선택해 주세요");
												return;
											}
											var keyword = $("#txtSearch").val()
													.trim();
											if (keyword == "") {
												alert("검색어를 입력해 주세요");
												return;
											}
											$(
													"#frmPaging > input[name=keyword]")
													.val(keyword);
											$("#frmPaging > input[name=page]")
													.val("1");
											$("#frmPaging").submit();
										});

						// 글제목  (10개)
						$(".a_title").click(function(e) {
							e.preventDefault();
							var v_no = $(this).attr("data-vno"); // 489
							$("#frmPaging > input[name=v_no]").val(v_no);
							$("#frmPaging").attr("action", "/board/content");
							$("#frmPaging").submit();
						});
						
						//승인 버튼 클릭
						$(".btnOk").click(function() {
							var v_no = $(this).attr("data-v_no");
							var result ="승인";
							var url = "/admin/adminReservation_statusUpdate";
							var sendData ={
									"v_no" : v_no,
									"result" : result
						
							}
				
							$.get(url,sendData,function(rData){
								console.log(rData);
								location.reload(); // 새로고침
							});
							
						});
						
						//취소 버튼 클릭
						$(".btnCancle").click(function(){
							var v_no = $(this).attr("data-v_no");
							var result ="";
							var url = "/admin/adminReservation_statusUpdate";
							var sendData ={
									"v_no" : v_no,
									"result" : result
						
							}
				
							$.get(url,sendData,function(rData){
								console.log(rData);
								location.reload(); //새로 고침
							});
						});
						
						//거부 버튼 클릭
						$(".btnDenial").click(function(){
							var v_no = $(this).attr("data-v_no");
							var result ="거부";
							var url = "/admin/adminReservation_statusUpdate";
							var sendData ={
									"v_no" : v_no,
									"result" : result
						
							}
				
							$.get(url,sendData,function(rData){
								console.log(rData);
								location.reload(); //새로 고침
							});
						});
						
						
						
					});
</script>

<form id="frmPaging" action="/volunteer/volunReservList" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}" /> <input
		type="hidden" name="perPage" value="${pagingDto.perPage}" /> <input
		type="hidden" name="searchType" value="${pagingDto.searchType}" /> <input
		type="hidden" name="keyword" value="${pagingDto.keyword}" /> <input
		type="hidden" name="v_no" />
</form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<img style="margin-top: 10px; text-align: center;"
				src="/resources/img/banner2.jpg">
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
						href="/volunteer/reservation">- 봉사활동 예약</a> <a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="/volunteer/volunReservList">- 봉사활동 조회</a>
				</div>
			</div>
		</div>
		<div class="col-md-10">

			<!-- 검색 -->
			<div class="row">
				<div class="col-md-12">
					<div class="dropdown">

						<button class="btn btn-default dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown">조회옵션</button>
						<span id="spanSearchType"
							style="color: #336699; font-weight: bold;"> 
							<c:choose>
								<c:when test="${pagingDto.searchType == 'p'}">지역별</c:when>
								<c:when test="${pagingDto.searchType == 't'}">시간별</c:when>
								<c:when test="${pagingDto.searchType == 'n'}">신청자</c:when>
							</c:choose>

						</span>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item searchType" href="p">지역별</a> <a
								class="dropdown-item searchType" href="t">시간별</a> <a
								class="dropdown-item searchType" href="n">신청자</a>
						</div>
						<form
							class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
							<div class="input-group">
								<input type="text" class="form-control bg-light border-0 small"
									placeholder="검색어 입력..." aria-label="Search"
									aria-describedby="basic-addon2" id="txtSearch"
									value="${pagingDto.keyword}">
								<div class="input-group-append">
									<button class="btn btn-default" type="button" id="btnSearch">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- // 검색 -->
			
			<div class="jumbotron">
				<h2>봉사활동 조회</h2>
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
							<th>연락처</th>
							<th>이메일</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="volunteerVo" items="${volunList}">
							<tr id="${volunteerVo.v_no}" class="v_no">
								<td>${volunteerVo.v_no}</td>
								<td>${volunteerVo.v_name}</td>
								<td>${volunteerVo.v_age}</td>
								<td>${volunteerVo.v_place}</td>
								<td>${volunteerVo.v_date}</td>
								<td>${volunteerVo.v_time}</td>
								<td>${volunteerVo.v_phonenum}</td>
								<td>${volunteerVo.v_email}</td>
								<td>${volunteerVo.v_etc}</td>
								<td>${volunteerVo.result }</td>
								<c:choose>

									<c:when test="${empty volunteerVo.result  }">
										<td><button type="button" class="btn btn-success btnOk"data-v_no="${volunteerVo.v_no}" value="승인">승인</button></td>
										<td><button type="button" class="btn btn-danger btnDenial"data-v_no="${volunteerVo.v_no}" vlaue="거부">거부</button></td>
									</c:when>

									<c:otherwise>
										<td><button type="button" class="btn btn-warning btnCancle"data-v_no="${volunteerVo.v_no}">취소</button></td>
									</c:otherwise>
								</c:choose>
								
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
						<li class="page-item"><a class="page-link"
							href="${pagingDto.startPage - 1}">&laquo;</a></li>
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
						</c:choose>>
							<a class="page-link" href="${v}">${v}</a>
						</li>
					</c:forEach>
					<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
						<li class="page-item"><a class="page-link"
							href="${pagingDto.endPage + 1}">&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>

</div>
<%@ include file="../include/footer.jsp"%>