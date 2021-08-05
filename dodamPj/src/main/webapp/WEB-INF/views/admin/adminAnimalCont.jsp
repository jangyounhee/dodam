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
	var text = "${adoptVo.ad_adoptstate}";
	console.log(text);
	if(text == "입양가능") {
		$("#ad_adoptstate").text("입양가능").css("color", "red");
	} else if(text == "입양완료") {
		$("#ad_adoptstate").text("입양완료").css("color", "blue");
	}
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
	<div class="col-md-10" style="margin-bottom:0px;">
		<h2>입양 동물 상세보기</h2>
		<hr/>
		<br>
			<input type="hidden" name="ad_no" value="${adoptVo.ad_no}">
			<div class="boardDetail">
				<div class="publicPhotoArea" style="text-align:center;">
					<img class="photoArea" src="http://localhost/adopt/displayImage?fileName=${adoptVo.ad_picture}"/>
				</div>
				<table class="table">
					<colgroup>
						<col width="120"/>
						<col width="*"/>
						<col width="120"/>
						<col width="*"/>
					</colgroup>
					<tr>
						<th>일련번호</th>
						<td colspan="3">${adoptVo.ad_no}</td>
					</tr>
					<tr>
						<th scope="row">품종</th>
						<td>${adoptVo.ad_species}&nbsp;</td>
						<th scope="row">종류</th>
						<td>${adoptVo.ad_kind}&nbsp;</td>
					</tr>
					<tr>
						<th>색상</th>
						<td colspan="3">${adoptVo.ad_color}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td colspan="3">${adoptVo.ad_gender}</td>
					</tr>
					<tr>
						<th>나이/체중</th>
						<td colspan="3">${adoptVo.ad_age}&nbsp;/ ${adoptVo.ad_weight}(Kg)</td>
					</tr>
					<tr>
						<th>발견장소</th>
						<td colspan="3">${adoptVo.ad_findplace}</td>
					</tr>
					<tr>
						<th>구조일</th>
						<td colspan="3">${adoptVo.ad_resqueday}</td>
					</tr>
					<tr>
						<th scope="row">입양가능일</th>
						<td>${adoptVo.ad_adoptpossible}&nbsp;</td>
						<th scope="row">입양상태</th>
						<td><span id="ad_adoptstate"></span></td>
					</tr>
					<tr>
						<th>기타정보</th>
						<td colspan="3">${adoptVo.ad_etc}</td>
					</tr>
				</table>
			</div>
			<a class="btn btn-primary" href="/admin/adoptList">목록</a>
		</div>
  </div>
</div>  
<%@ include file="../include/footer.jsp" %>