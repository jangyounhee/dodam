<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
// 	$("#btnNotMemberForm").click(function() {
// 		location.href="/volunteer/reservationForm";
// 	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<img style="margin-top:10px; text-align:center;" src="/resources/img/volunteerBanner.jpg">
		</div>
	</div>
	<div class="row" style="margin-top:10px;">
		<div class="col-md-2">
        	<div class="border-end bg-white" id="sidebar-wrapper">
                <div class="list-group list-group-flush">
                	<a class="list-group-item" style="background-color:#CCF2F4;">
                		<strong><i class="fas fa-paw"></i> 봉사활동</strong></a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/volunteer/reservation">- 봉사활동 예약</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/volunteer/volunReservList">- 봉사활동 현황</a>
                </div>
            </div>
		</div>
		<div class="col-md-10">
			<div style="text-align: center;class="row">
				<div class="col-md-12">
					<button type="button" class="btn btn-lg btn-primary" style="margin-top:80px">회원으로 신청하기</button><br>
						<a id="btnNotMemberForm" type="button" class="btn btn-lg btn-warning" href="/volunteer/reservationForm" style="margin-top:20px ;">비회원으로 신청하기</a>
				</div>
			</div>
		</div>
   </div>					
</div>
<%@ include file="../include/footer.jsp"%>