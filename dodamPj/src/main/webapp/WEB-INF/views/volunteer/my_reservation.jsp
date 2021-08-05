<%@page import="com.kh.dodamPj.vo.VolunteerVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<!-- datepicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
$(document).ready(function() {
	$("#v_date").datepicker();

	var check = false;
	
	$("#frmReserv").submit(function() {
		if(check == false) {
			alert("예약 가능 여부를 확인해주세요.");
			return false;
		} 	
	});
	
	$("#ableCheck").click(function() {
		var url = "/volunteer/checkDateAndTime";
		var v_date = $("#v_date").val();
		var v_time = $("#v_time").val();
		var v_place = $("#v_place").val();
		var sendData = {
				"v_date" : v_date,
				"v_time" : v_time,
				"v_place" : v_place
		};
		
		$.get(url, sendData, function(rData) {
			console.log(rData);	
			if (rData == "true") {
				$("#check").text("해당 지역의 일정은 이미 예약이 완료 되었습니다. 다시 선택해 주세요.")
					.css("color", "red");		
			} else {
				$("#check").text("예약 가능한 일정입니다.").css("color", "blue");
				check = true;
			}
		});	
	});
	
	var msg = "${msg}";
	if(msg == "success") {
		alert("예약이 완료되었습니다.")
	}
	
	$("#reservTable").on("click", ".modifyModal", function() {
		var v_no = $("#reservTable").find("td").eq(0).text();
		var user_id = $("#reservTable").find("td").eq(2).text();
		var v_name = $("#reservTable").find("td").eq(4).text();
		var v_age = $("#reservTable").find("td").eq(6).text();
		var v_place = $("#reservTable").find("td").eq(8).text();
		var v_date = $("#reservTable").find("td").eq(10).text();
		var v_time = $("#reservTable").find("td").eq(12).text();
		var v_phonenum = $("#reservTable").find("td").eq(14).text();
		var v_email = $("#reservTable").find("td").eq(16).text();
		var v_etc = $("#reservTable").find("td").eq(18).text();
		$("#user_id").val(user_id);
		$("#v_name").val(v_name);
		$("#v_age").val(v_age);
		$("#v_place").val(v_place);
		$("#v_date").val(v_date);
		$("#v_time").val(v_time);
		$("#v_phonenum").val(v_phonenum);
		$("#v_email").val(v_email);
		$("#v_etc").val(v_etc);
		$("#btnModifyFinish").attr("data-vno", v_no);
	});
	
	$("#btnModifyFinish").click(function() {
		var v_no = $(this).attr("data-vno");
		var user_id = $(".user_id").val();
		var v_name = $(".v_name").val();
		var v_age = $(".v_age").val();
		var v_place = $(".v_place").val();
		var v_date = $(".v_date").val();
		var v_time = $(".v_time").val();
		var v_phonenum = $(".v_phonenum").val();
		var v_email = $(".v_email").val();
		var v_etc = $(".v_etc").val();
		var url = "/volunteer/modifyReserv";
		var sendData = {
				"v_no" : v_no,
				"user_id" : user_id,
				"v_name" : v_name,
				"v_age" : v_age,
				"v_place" : v_place,
				"v_date" : v_date,
				"v_time" : v_time,
				"v_phonenum" : v_phonenum,
				"v_email" : v_email,
				"v_etc" : v_etc
		};
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post",	
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(receivedData) {
				console.log(receivedData);
				if (receivedData == "success") {
					alert("예약 변경이 완료되었습니다.")
					$("#btnModalClose").trigger("click");
					location.href = "/volunteer/myReservation";
				}
			}
		});
	});
	
	var msgCancel = "${msgCancel}";
	if (msgCancel == "true") {
		alert("예약이 취소되었습니다.");
	} else if (msgCancel == "false") {
		alert("예약 취소에 실패했습니다.");
	}
	
});

</script>

<!-- 예약 수정 모달 -->
	<div class="row">
		<div class="col-md-12">
			<div class="modal fade" id="modal-container-418737" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">예약 정보 변경</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<div class="form-group">
							<label for="user_id"> 아이디 : </label> 
							<input type="text" class="form-control user_id" id="user_id" name="user_id" readonly/>
						</div>
						<div class="form-group">
							<label for="v_name"> 이름 : </label> 
							<input type="text" class="form-control v_name" id="v_name" name="v_name" readonly/>
						</div>
						<div class="form-group">
							<label for="v_age"> 나이 : </label> 
							<input type="text" class="form-control v_age" id="v_age" name="v_age" readonly/>
						</div>
						<div class="form-group">
							<label for="v_place">신청 지역 : </label> 
							<select name="v_place" id="v_place" class="v_place">
								<option value="남구">남구</option>
								<option value="중구">중구</option>
								<option value="북구">북구</option>
								<option value="동구">동구</option>
								<option value="울주군">울주군</option>
							</select>
						</div>
						<div class="form-group">
							<label for="v_date"> 신청 날짜 : </label> 
							<input type="text" id="v_date" name="v_date" class="v_date">
						</div>
						<div class="form-group">
							<label for="v_time">신청 시간 : </label> 
							<select name="v_time" id="v_time" class="v_time">
								<option value="09:00 ~ 12:00">09:00 ~ 12:00</option>
								<option value="12:00 ~ 15:00">12:00 ~ 15:00</option>
								<option value="15:00 ~ 18:00">15:00 ~ 18:00</option>
							</select>
							<button type="button" class="btn btn-info" id="ableCheck">예약
								가능 여부</button><br>
							<span id="check"></span>
						</div>
						<div class="form-group">
							<label for="v_phonenum"> 연락처 : </label> 
							<input type="text" class="form-control v_phonenum" id="v_phonenum" name="v_phonenum"/>
						</div>
						<div class="form-group">
							<label for="v_email"> 이메일 : </label>
							<input type="text" class="form-control v_email" id="v_email" name="v_email"/>
						</div>
						<div class="form-group">
							<label for="v_etc"> 비고 : </label> 
							<input type="text" class="form-control v_etc" id="v_etc"
								placeholder="궁금한 점이나 문의사항이 있으면 글을 남겨주세요." name="v_etc"/>
						</div>
					</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info" id="btnModifyFinish">수정완료</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="btnModalClose">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- /예약 수정 모달 -->

<div class="container mt-3">
  <h2>나의 예약 조회</h2>
  <br>
	<div class="row">
		<div class="col-md-12">
			<c:choose>
				<c:when test="${not empty list}">
					<table class="table" id="reservTable">
						<tbody>
						<c:forEach var="volunteerVo" items="${list}">
							<input type="hidden" name="user_id" value="${volunteerVo.user_id}"/>
							<input type="hidden" name="v_no" value="${volunteerVo.v_no}"/>
							<tr class="table-warning">
								<th>예약 번호</th>
								<td>${volunteerVo.v_no}</td>
								<td>
									<a class="btn btn-info btn-sm modifyModal" id="modal-418737" href="#modal-container-418737" role="button" class="btn" data-toggle="modal">예약 정보 변경</a>
									<a type="button" class="btn btn-danger btn-sm cancelReserv" id="btnCancel"
										href="/volunteer/cancelReserv?v_no=${volunteerVo.v_no}">예약 취소</a>
								</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td>${volunteerVo.user_id}</td>
								<td></td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${volunteerVo.v_name}</td>
								<td></td>
							</tr>
							<tr>
								<th>나이</th>
								<td>${volunteerVo.v_age}</td>
								<td></td>
							</tr>
							<tr>
								<th>신청 지역</th>
								<td>${volunteerVo.v_place}</td>
								<td></td>
							</tr>
							<tr>
								<th>신청 날짜</th>
								<td>${volunteerVo.v_date}</td>
								<td>(mm/dd/yyyy)</td>
							</tr>
							<tr>
								<th>신청 시간</th>
								<td>${volunteerVo.v_time}</td>
								<td></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${volunteerVo.v_phonenum}</td>
								<td></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${volunteerVo.v_email}</td>
								<td></td>
							</tr>
							<tr>
								<th>비고</th>
								<td>${volunteerVo.v_etc}</td>
								<td></td>
							</tr>	
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="col-md-12">
						<div class="alert alert-dismissable alert-warning">
							<h4>등록 된 예약 정보가 없습니다.</h4>
						</div>	
						<a type="button" class="btn btn-outline-secondary" href="/volunteer/reservationForm">예약하러 가기</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>