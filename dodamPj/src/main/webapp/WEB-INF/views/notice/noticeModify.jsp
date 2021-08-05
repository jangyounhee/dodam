<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/adminHeader.jsp"%>
<!-- 공지사항 수정처리 / 관리자 페이지에서 사용 -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin-top:5px; text-align:center;" >
			<img src="/resources/img/centerBanner.jpg">
		</div>
	</div>
	<div class="row" style="margin-top:10px;">
		<div class="col-md-2">
 			<div class="border-end bg-white" id="sidebar-wrapper">
   				<div class="list-group list-group-flush">
                	<a class="list-group-item" style="background-color:#CCF2F4;">
                		<strong><i class="fas fa-paw"></i> 도담센터(Admin)</strong></a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/notice/noticeWriteForm">- 공지 사항 등록</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/notice/noticeModify">- 공지 사항 수정</a>
                </div>
            </div>
		</div>
		
		
<div class="row">
	<div class="col-md-12">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성시간</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list2 }">
					<tr>
						<td>${list.n_no }</td>
						<td>${list.n_title }</td>
						<td>${list.n_date }</td>
						<td><a href="/notice/noticeModifyForm?n_no=${list.n_no }">수정</a>
						<td><a href="/notice/noticeDeleteRun?n_no=${list.n_no }">삭제</a>

					</tr>
				</c:forEach>


			</tbody>
		</table>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>

