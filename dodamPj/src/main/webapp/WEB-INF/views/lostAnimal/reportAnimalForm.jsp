<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<script>
$(document).ready(function() {
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
	
	$("#user_tel").keydown(function(e) {
		var key = e.charCode || e.keyCode || 0;
		$text = $(this);
		if(key != 8 && key != 9) {
			if($text.val().length == 3) {
				$text.val($text.val() + "-");
			}
			if($text.val().length == 8) {
				$text.val($text.val() + "-");
			}
		}
		return(key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) ||
			(key >= 96 && key <= 105));
		// key 8번 백스페이스, key 9번 탭, key 46번 delete부터 0~9까지, key 96~105까지 넘버패드
		// jQuery 0~9 숫자, 백스페이스, 탭, delete키 및 넘버패드외에는 입력안됨
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
		<h2>분실 신고서 작성</h2>
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
					<form role="form" action="/lostAnimal/reportRun" method="post" id="frmWrite" enctype="multipart/form-data">
					<c:choose>
						<c:when test="${empty sessionScope.loginVo}">
						</c:when>
						<c:otherwise>
						<div class="form-group">
						<label for="b_title">제목</label>
						<input type="text" class="form-control" id="b_title" name="b_title"/>
						</div>
						<div class="form-group">
						<label for="user_name">작성자</label>
						<input type="text" class="form-control" id="user_name" name="user_name" 
							value="${sessionScope.loginVo.user_name}" readonly/>
						</div>
						<div class="form-group">
						<label for="user_tel">연락처</label>
						<input type="text" class="form-control" id="user_tel" name="user_tel" maxlength="13"
							value="${sessionScope.loginVo.phoneNum}"/>
						</div>
						<div class="form-group">
						<label for="user_email">e-mail</label>
						<input type="text" class="form-control" id="user_email" name="user_email"
							value="${sessionScope.loginVo.user_email}"/>
						</div>
						</c:otherwise>
					</c:choose>
						<div class="form-group">
						<label for="p_name">동물 이름</label>
						<input type="text" class="form-control" id="p_name" name="p_name"/>
						</div>
						<div class="form-group">
						<label for="p_species">품종</label>
						<input type="text" class="form-control" id="p_species" name="p_species" placeholder="ex)믹스견, 코리안 숏헤어.."/>
						</div>
						<div class="form-group">
						<label for="p_gender">성별</label>
						<input type="radio" name="p_gender" value="수컷" checked/>수컷
						<input type="radio" name="p_gender" value="암컷"/>암컷
						</div>
						<div class="form-group">
						<label for="p_age">나이</label>
						<input type="text" class="form-control" id="p_age" name="p_age" placeholder="ex)n살, n개월.."/>
						</div>
						<div class="form-group">
						<label for="p_lostdate">실종 날짜</label><br>
						<input type="text" id="datepicker" name="p_lostdate" placeholder="날짜를 선택해 주세요"/>
						</div>
						<div class="form-group">
						<label for="p_lostplace">실종 장소</label>
						<input type="text" class="form-control" id="p_lostplace" name="p_lostplace" placeholder="정확히 기재할수록 좋습니다."/>
						</div>
						<div class="form-group">
						<label for="p_character">특징</label>
						<textarea class="form-control" id="p_character" name="p_character"
							placeholder="중성화, 미용상태, 피부상태 등 아이 파악에 도움될 정보를 작성해주세요."></textarea>
						</div>
						<label for="file">사진 첨부</label><br>
							<div class="form-group">
								<input type="file" class="form-control-file" id="file" name="file"/>
							</div>
						<button type="submit" class="btn btn-success">등록</button>
						<a class="btn btn-info" href="/lostAnimal/reportList" style="margin-right:10px;">목록</a>
					</form>
					</div>
				</div>
			</div>			
		</div>
  	</div>

<%@ include file="../include/footer.jsp" %>