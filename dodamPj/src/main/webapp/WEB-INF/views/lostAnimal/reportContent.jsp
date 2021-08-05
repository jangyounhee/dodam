<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function() {
	$("#btnModify").click(function() {
		$("#btnModifyDone").show();
		$(".readonly").attr("readonly", false);
	});
	
	$("#btnDelete").click(function() {
		location.href="/lostAnimal/reportDeleteRun?b_no=${lostVo.b_no}";
	});
	
	$("#datepicker").datepicker({
		showOn: "button",
	    buttonImage: "/resources/img/calendar.gif",
	    buttonImageOnly: true,
	    buttonText: "Select date",
		dateFormat: "yy/mm/dd",
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
		changeMonth: true, //월 변경 가능
	    changeYear: true, //년 변경 가능
		showMonthAfterYear: true //년 뒤에 월 표시
	});
	
});
</script>

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
	<div class="col-md-10">
		<h2>분실 신고서 확인</h2>
		<hr/>
			<ul>
				<li>동물을 분실한 경우 동물정보를 올려 분실 동물을 찾을 수 있는 공간입니다.</li>
				<li>동물을 분실한 경우 동물보호법 제12조 제1항 및 같은 법 시행규칙 제8조 제1항 및 제9조 제2항에 따라 등록대상동물을
					10일 이내 시장, 군수, 구청장에게 분실 신고하셔야 합니다.<br>
					(다만, 동물보호관리시스템에서 소유자가 직접 동물상태 수정 가능)</li>
				<li>로그인 후 분실신고를 등록할 수 있습니다.</li>
			</ul>
			<br>
			<div class="row">
				<div class="col-md-12">
					<form role="form" action="/lostAnimal/reportModifyRun" method="post">
					<input type="hidden" name="b_no" value="${lostVo.b_no}">
					<input type="hidden" name="user_id" value="${lostVo.user_id}">
						<div class="form-group">
						<label for="b_title">제목</label>
						<input type="text" class="form-control readonly" id="b_title" name="b_title" value="${lostVo.b_title}" readonly/>
						</div>
						<div class="form-group">
						<label for="user_name">작성자</label>
						<input type="text" class="form-control" id="user_name" name="user_name" 
							value="${lostVo.user_name}" readonly/>
						</div>
						<div class="form-group">
						<label for="user_tel">연락처</label>
						<input type="text" class="form-control readonly" id="user_tel" name="user_tel" value="${lostVo.user_tel}" readonly/>
						</div>
						<div class="form-group">
						<label for="user_email">e-mail</label>
						<input type="text" class="form-control readonly" id="user_email" name="user_email" value="${lostVo.user_email}" readonly/>
						</div>
						<div class="form-group">
						<label for="p_name">동물 이름</label>
						<input type="text" class="form-control" id="p_name" name="p_name" value="${lostVo.p_name}" readonly/>
						</div>
						<div class="form-group">
						<label for="p_species">품종</label>
						<input type="text" class="form-control" id="p_species" name="p_species" value="${lostVo.p_species}" readonly/>
						</div>
						<div class="form-group">
						<label for="p_gender">성별</label>
						<input type="text" class="form-control" id="p_gender" name="p_gender" value="${lostVo.p_gender}" readonly/>
						</div>
						<div class="form-group">
						<label for="p_age">나이</label>
						<input type="text" class="form-control" id="p_age" name="p_age" value="${lostVo.p_age}" readonly/>
						</div>
						<div class="form-group">
						<label for="p_lostdate">실종 날짜</label><br>
						<input type="text" class="readonly" id="datepicker" name="p_lostdate" value="${lostVo.p_lostdate}" readonly/>
						</div>
						<div class="form-group">
						<label for="p_lostplace">실종 장소</label>
						<input type="text" class="form-control readonly" id="p_lostplace" name="p_lostplace" value="${lostVo.p_lostplace}" readonly/>
						</div>
						<div class="form-group">
						<label for="p_character">특징</label>
						<textarea class="form-control readonly" id="p_character" name="p_character" readonly>${lostVo.p_character}</textarea>
						</div>
						<label for="photo">사진</label> 
						<p><img style="height: 100px;" src="http://localhost/lostAnimal/displayImage?fileName=${lostVo.p_picture}" /></p>
						
						<a class="btn btn-info" href="/lostAnimal/reportList" style="margin-right:10px;">목록</a>
						<c:if test="${loginVo.user_id == lostVo.user_id}">
							<button type="button" class="btn btn-warning" style="margin-right:10px;"
						 			id="btnModify">수정</button>
							<button type="submit" class="btn btn-success" style="margin-right:10px; display: none;"
									id="btnModifyDone">수정완료</button>
							<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
						</c:if>
					</form>
				</div>
			</div>			
		</div>
  	</div>
</div>

<%@ include file="../include/footer.jsp" %>