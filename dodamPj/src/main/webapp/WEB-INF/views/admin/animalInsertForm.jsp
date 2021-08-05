<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/adminHeader.jsp" %>
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
	
	$("#datepicker2").datepicker({
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
			<img src="/resources/img/adoptBanner.jpg">
		</div>
	</div>
	<div class="row" style="margin-top:10px;">
		<div class="col-md-2">
 			<div class="border-end bg-white" id="sidebar-wrapper">
   				<div class="list-group list-group-flush">
                	<a class="list-group-item" style="background-color:#CCF2F4;">
                		<strong><i class="fas fa-paw"></i> 입양 관리(Admin)</strong></a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/admin/adoptList">- 입양 동물 목록 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/admin/animalInsertForm">- 입양 동물 등록</a>
                </div>
            </div>
		</div>
	<div class="col-md-10">
		<h2>입양 가능 동물 등록</h2>
		<hr/>
			<div class="row">
				<div class="col-md-12">
					<form role="form" action="/admin/animalInsertRun" method="post" enctype="multipart/form-data">
						<div class="form-group">
						<label for="ad_species">종류</label><br>
							<input type="radio" name="ad_species" value="개" checked/>개&nbsp;
							<input type="radio" name="ad_species" value="고양이"/>고양이&nbsp;
							<input type="radio" name="ad_species" value="기타"/>기타
						</div>
						<div class="form-group">
						<label for="ad_kind">품종</label>
							<input type="text" class="form-control" id="ad_kind" name="ad_kind"/>
						</div>
						<div class="form-group">
						<label for="ad_color">색상</label>
							<input type="text" class="form-control" id="ad_color" name="ad_color"/>
						</div>
						<div class="form-group">
						<label for="ad_gender">성별</label><br>
							<input type="radio" name="ad_gender" value="수" checked/>수&nbsp;
							<input type="radio" name="ad_gender" value="암"/>암
						</div>
						<div class="form-group">
						<label for="ad_age">나이</label>
							<input type="text" class="form-control" id="ad_age" name="ad_age"/>
						</div>
						<div class="form-group">
						<label for="ad_weight">체중</label>
							<input type="text" class="form-control" id="ad_weight" name="ad_weight"/>
						</div>
						<div class="form-group">
						<label for="ad_findplace">발견장소</label>
							<input type="text" class="form-control" id="ad_findplace" name="ad_findplace"/>
						</div>
						<div class="form-group">
						<label for="ad_resqueday">구조일</label><br>
							<input type="text" id="datepicker" name="ad_resqueday"/>
						</div>
						<div class="form-group">
						<label for="ad_adoptpossible">입양가능일</label><br>
							<input type="text" id="datepicker2" name="ad_adoptpossible"/>
						</div>
						<div class="form-group">
						<label for="ad_adoptstate">입양상태</label><br>
							<input type="radio" name="ad_adoptstate" value="입양가능" checked/>입양 가능&nbsp;
							<input type="radio" name="ad_adoptstate" value="입양완료"/>입양 완료
						</div>
						<div class="form-group">
						<label for="ad_etc">기타정보</label>
							<textarea class="form-control" id="ad_etc" name="ad_etc"></textarea>
						</div>
						<label for="file">사진</label><br>
							<div class="form-group">
								<input type="file" class="form-control-file" id="file" name="file"/>
							</div>
						<button type="submit" class="btn btn-success">추가</button>
						<a class="btn btn-info" href="/admin/adoptList" style="margin-right:10px;">목록</a>
					</form>
					</div>
				</div>
			</div>			
		</div>
  	</div>

<%@ include file="../include/footer.jsp" %>