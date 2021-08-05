<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
	$("#btnModify").click(function() {
		$("#btnModifyDone").show();
		$(".readonly").prop("readonly", false);
	});
	
	$("#btnDelete").click(function() {
		location.href="/adopt/deleteApplyRun?au_no=${applyUserVo.au_no}";
	});

});
</script>

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
		<h2>입양 예약</h2>
		<hr/>
			<div class="row">
				<div class="col-md-12">
					<form role="form" id="frmApply" action="/adopt/modifyApplyRun" method="post">	
					<input type="hidden" name="au_no" value="${applyUserVo.au_no}">
					<input type="text" name="user_id" value="${applyUserVo.user_id}">
						<div class="form-group">
						<label for="user_name">입양자 성명</label>
							<input type="text" class="form-control" id="user_name" name="user_name"
								value="${applyUserVo.user_name}" readonly/>
						</div>
						<div class="form-group">
						<label for="user_tel">연락처</label>
							<input type="text" class="form-control readonly" id="user_tel" name="user_tel"
								value=<c:if test="${applyUserVo.user_tel ne null && applyUserVo.user_tel != ''}">
								${fn:substring(applyUserVo.user_tel,0,fn:length(applyUserVo.user_tel)-7)}**-****
								</c:if> readonly/>
						</div>
						<div class="form-group">
						<label for="adopt_date">상담 예정 날짜</label>
						<span style="color:silver;">&nbsp;&nbsp; <i class="far fa-arrow-alt-circle-right"></i>
							상담 예정 날짜 및 시간 변경은 센터로 직접 연락하셔야 가능합니다.</span>
							<input type="text" class="form-control" id="adopt_date" name="adopt_date"
								value="${applyUserVo.adopt_date}" readonly/>
						</div>
						<div class="form-group">
						<label for="adopt_time">상담 예정 시간</label>
						<span style="color:silver;">&nbsp;&nbsp; <i class="far fa-arrow-alt-circle-right"></i>
							상담 예정 날짜 및 시간 변경은 센터로 직접 연락하셔야 가능합니다.</span>
							<input type="text" class="form-control" id="adopt_time" name="adopt_time"
								value="${applyUserVo.adopt_time}" readonly/>
						</div>
						<div class="form-group">
						<label for="form_title">제목</label>
							<input type="text" class="form-control readonly" id="form_title" name="form_title"
								value="${applyUserVo.form_title}" readonly/>
						</div>
						<div class="form-group">
						<label for="form_content">내용</label>
							<textarea class="form-control readonly" id="form_content" name="form_content" 
							readonly>${applyUserVo.form_content}</textarea>
						</div>
						<a class="btn btn-info" href="/adopt/applyList">목록</a>
						<c:if test="${loginVo.user_id == applyUserVo.user_id}">
							<button type="button" class="btn btn-success" id="btnModify">수정</button>
							<button type="submit" class="btn btn-warning" id="btnModifyDone"
								style="display:none;">수정완료</button>
							<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
						</c:if>
						
					</form>
					</div>
				</div>
			</div>			
		</div>
  	</div>

<%@ include file="../include/footer.jsp" %>