<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
$(document).ready(function() {
	var text = "${adoptVo.ad_adoptstate}";
	if(text == "입양완료") {
		$("#noApply").text("※ 입양완료 상태로 상담 예약 불가").css("color", "red");
		$(".readonly").prop("readonly", true);
	}
	
	$("#datepicker").datepicker({
		showOn: "button",
	    buttonImage: "/resources/img/calendar.gif",
	    buttonImageOnly: true,
	    buttonText: "Select date",
		dateFormat: "yy.mm.dd",
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
		changeMonth: true, //월 변경 가능
	    changeYear: true, //년 변경 가능
		showMonthAfterYear: true //년 뒤에 월 표시
	});
	
	var isCheckDupTime = false;
	var checkTime = "";
	var checkDate = "";
	$("#frmApply").submit(function() {
		if(isCheckDupTime == false) {
			alert("예약 가능 확인 버튼을 눌러 시간을 확인해 주세요.");
			$("btnCheckTime").focus();
			return false;
		}
	});
	
	$("#btnCheckTime").click(function() {
		var url = "/adopt/checkDupTime";
		var adopt_date = $("#datepicker").val();
		var adopt_time = $("#adopt_time").val();
		var sendData = {
				"adopt_date" : adopt_date,
				"adopt_time" : adopt_time
		};
		
		$.get(url, sendData, function(rData) {
			if(rData == "true") {
				$("#checkTimeResult").text(" ※ 이미 예약된 시간대입니다.").css("color", "red");
			} else {
				$("#checkTimeResult").text(" ※ 예약 가능한 시간대입니다.").css("color", "blue");
				isCheckDupTime = true;
				checkTime = adopt_time;
				checkDate = adopt_date;
			}
		});
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
		<ul style="list-style:none;">
			<li style="color:red;"><strong>※ 입양절차 안내</strong></li>
			<li><strong>① 공고 확인</strong> : 홈페이지에서 보호중인 아이들을 확인 후 상담 예약서를 작성합니다.</li>
			<li><strong>② 방문 상담</strong> : 보호중인 아이들은 수시로 입양되기 때문에 예약날짜에 직접 방문하여 관리사와 상담합니다.</li>
			<li><strong>③ 아이와의 만남</strong> : 관리사와 상담 후, 보호중인 아이와 만납니다.</li>
			<li><strong>④ 책임분양 계약서 작성</strong> : 전문가와의 상담으로 입양을 신중히 결정 후 책임분양계약서를 작성합니다.</li>
		</ul>
		
			<div class="row">
				<div class="col-md-12">
					<form role="form" id="frmApply" action="/adopt/insertApplyRun" method="post" enctype="multipart/form-data">	
					<input type="hidden" name="ad_no" value="${adoptVo.ad_no}">
					<input type="hidden" name="user_id" value="${sessionScope.loginVo.user_id}">
						<div class="form-group">
						<label for="ad_no">일련번호</label>
							<input type="text" class="form-control" id="ad_no" name="ad_no"
								value="${adoptVo.ad_no}" readonly/>
						</div>
						<div class="form-group">
						<label for="ad_adoptstate">입양상태&nbsp;</label><span id="noApply"></span>
							<input type="text" class="form-control" id="ad_adoptstate" name="ad_adoptstate" 
								value="${adoptVo.ad_adoptstate}" readonly/>
						</div>
						<div class="form-group">
						<label for="ad_kind">종류/품종</label>
							<input type="text" class="form-control" id="ad_kind" name="ad_kind"
								value="${adoptVo.ad_species}/${adoptVo.ad_kind}" readonly/>
						</div>
						<div class="form-group">
						<label for="ad_age">성별/나이</label>
							<input type="text" class="form-control" id="ad_age" name="ad_age"
								value="${adoptVo.ad_gender}/${adoptVo.ad_age}" readonly/>
						</div>
						<c:choose>
							<c:when test="${empty sessionScope.loginVo}">
							</c:when>
							<c:otherwise>
								<div class="form-group">
									<label for="user_name">입양자 성명</label>
									<input type="text" class="form-control readonly" id="user_name" name="user_name"
										value="${sessionScope.loginVo.user_name}" readonly/>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="form-group">
						<label for="user_tel">연락처</label>
							<input type="text" class="form-control readonly" id="user_tel" name="user_tel"
								maxlength="13"/>
						</div>
						<div class="form-group">
						<label for="adopt_date">상담 예정 날짜</label><br>
							<input type="text" id="datepicker" name="adopt_date" placeholder="날짜를 선택해 주세요."/>
						</div>
						<div class="form-group">
						<label for="adopt_time">상담 예정 시간&nbsp;</label>
						<button type="button" class="btn btn-outline-danger btn-sm" id="btnCheckTime">
							예약 가능 확인</button><span id="checkTimeResult"></span><br>
							<select id="adopt_time" name="adopt_time">
								<option value="10:00 ~ 11:00">10:00 ~ 11:00</option>
								<option value="11:00 ~ 12:00">11:00 ~ 12:00</option>
								<option value="13:00 ~ 14:00">13:00 ~ 14:00</option>
								<option value="14:00 ~ 15:00">14:00 ~ 15:00</option>
								<option value="15:00 ~ 16:00">15:00 ~ 16:00</option>
							</select>
						</div>
						<div class="form-group">
						<label for="form_title">제목</label>
							<input type="text" class="form-control readonly" id="form_title" name="form_title"/>
						</div>
						<div class="form-group">
						<label for="form_content">내용</label>
							<textarea class="form-control readonly" id="form_content" name="form_content" 
							placeholder="상담하실 동물의 일련번호를 남겨주세요" ></textarea>
						</div>
						<button type="submit" class="btn btn-success">작성</button>
						<a class="btn btn-info" href="/adopt/applyAdopt" style="margin-right:10px;">목록</a>
					</form>
					</div>
				</div>
			</div>			
		</div>
  	</div>

<%@ include file="../include/footer.jsp" %>