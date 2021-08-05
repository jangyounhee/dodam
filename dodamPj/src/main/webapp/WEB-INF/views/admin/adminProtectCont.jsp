<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/adminHeader.jsp" %>

<style>  
table, tr, th, td { 
  border: 1px solid black; 
  border-collapse: collapse;
  margin-top: 10px;
}

table.table th {  
  background-color: silver;
}  

</style>

<script>
$(document).ready(function() {
	var text = "${animalVo.a_state}";
	if(text == "사망") {
		$("#a_state").text("사망").css("color", "red");
	} else if(text == "보호중") {
		$("#a_state").text("보호중").css("color", "blue");
	}
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin-top:5px; text-align:center;" >
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
	<div class="col-md-10" style="margin-bottom:0px;">
		<h2>동물 상세보기</h2>
		<hr/>
		<br>
			<input type="hidden" name="a_no" value="${animalVo.a_no}">
			<div class="boardDetail">
				<div class="publicPhotoArea" style="text-align:center;">
					<img class="photoArea" src="http://localhost/admin/displayImage?fileName=${animalVo.a_picture}"/>
				</div>
				<table class="table">
					<colgroup>
						<col width="120"/>
						<col width="*"/>
						<col width="120"/>
						<col width="*"/>
					</colgroup>
					<tr>
						<th>품종</th>
						<td colspan="3">${animalVo.a_species}</td>
					</tr>
					<tr>
						<th>색상</th>
						<td colspan="3">${animalVo.a_color}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td colspan="3">${animalVo.a_gender}</td>
					</tr>
					<tr>
						<th>나이/체중</th>
						<td colspan="3">${animalVo.a_age}&nbsp;/ ${animalVo.a_weight}(Kg)</td>
					</tr>
					<tr>
						<th>발견장소</th>
						<td colspan="3">${animalVo.a_findplace}</td>
					</tr>
					<tr>
						<th scope="row">접수일시</th>
						<td>${animalVo.a_enterdate}&nbsp;</td>
						<th scope="row">중성화</th>
						<td>${animalVo.a_neut}&nbsp;</td>
					</tr>
					<tr>
						<th>특징</th>
						<td colspan="3">${animalVo.a_character}</td>
					</tr>
					<tr>
						<th>상태</th>
						<td colspan="3"><span id="a_state"></span></td>
					</tr>
				</table>
			</div>
			<a class="btn btn-primary" href="/admin/adminProtectList">목록</a>
		</div>
  </div>
</div>  
<%@ include file="../include/footer.jsp" %>