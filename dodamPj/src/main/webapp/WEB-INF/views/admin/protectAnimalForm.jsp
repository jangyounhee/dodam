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
                		<strong><i class="fas fa-paw"></i> 유실/유기동물(Admin)</strong></a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/admin/adminProtectList">- 보호동물 목록 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/admin/protectAnimalForm">- 보호동물 등록</a>
                </div>
            </div>
		</div>
	<div class="col-md-10">
		<h2>보호중 동물 추가하기</h2>
		<hr/>
			<div class="row">
				<div class="col-md-12">
					<form role="form" action="/admin/insertAnimalRun" method="post" enctype="multipart/form-data">
						<div class="form-group">
						<label for="a_species">품종</label>
							<input type="text" class="form-control" id="a_species" name="a_species"/>
						</div>
						<div class="form-group">
						<label for="a_color">색상</label>
							<input type="text" class="form-control" id="a_color" name="a_color"/>
						</div>
						<div class="form-group">
						<label for="a_gender">성별</label><br>
							<input type="radio" name="a_gender" value="수컷" checked/>수컷&nbsp;
							<input type="radio" name="a_gender" value="암컷"/>암컷
						</div>
						<div class="form-group">
						<label for="a_age">나이</label>
							<input type="text" class="form-control" id="a_age" name="a_age"/>
						</div>
						<div class="form-group">
						<label for="a_weight">체중</label>
							<input type="text" class="form-control" id="a_weight" name="a_weight"/>
						</div>
						<div class="form-group">
						<label for="a_findplace">발견장소</label>
							<input type="text" class="form-control" id="a_findplace" name="a_findplace"/>
						</div>
						<div class="form-group">
						<label for="a_enterdate">접수일시</label><br>
							<input type="text" id="datepicker" name="a_enterdate"/>
						</div>
						<div class="form-group">
						<label for="a_neut">중성화 상태</label><br>
							<input type="radio" name="a_neut" value="예"/>예&nbsp;
							<input type="radio" name="a_neut" value="아니오" checked/>아니오
						</div>
						<div class="form-group">
						<label for="a_character">특징</label>
							<textarea class="form-control" id="a_character" name="a_character"
								placeholder="발견시 전반적 상태 상세하게 작성"></textarea>
						</div>
						<div class="form-group">
						<label for="a_state">상태</label><br>
							<input type="radio" name="a_state" value="보호중" checked/>보호중&nbsp;
							<input type="radio" name="a_state" value="사망"/>사망
						</div>
						<label for="file">사진 첨부</label><br>
							<div class="form-group">
								<input type="file" class="form-control-file" id="file" name="file"/>
							</div>
						<button type="submit" class="btn btn-success">추가</button>
						<a class="btn btn-info" href="/admin/adminProtectList" style="margin-right:10px;">목록</a>
					</form>
					</div>
				</div>
			</div>			
		</div>
  	</div>

<%@ include file="../include/footer.jsp" %>