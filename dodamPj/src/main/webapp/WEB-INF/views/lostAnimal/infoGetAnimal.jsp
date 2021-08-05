<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

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
	<div class="col-md-10" style="margin-bottom:0px;">
		<h2>습득시 안내</h2>
		<hr/>
		<div style="text-align:center;">
			<img src="/resources/img/pickupAnimal.png">
			<br><br><br>
			<p>---------------------------------------------------------------------------------------------------------</p><br>
			<p>
				<i class="fas fa-comment"></i> 공공장소를 떠돌거나 버려진 동물을 발견한 경우 관할 시ㆍ군ㆍ구청과 해당 유기동물 보호시설에 신고해야 합니다.<br>
				<i class="fas fa-comment"></i> 유기동물을 주인 없는 동물이라 여겨 마음대로 잡아서 팔거나 죽이면 2년 이하의 징역 또는 2천만원 이하의 벌금을 내게 됩니다.<br>
				<i class="fas fa-comment"></i> 시장ㆍ군수ㆍ구청장은 관내에서 발견된 유기동물이 보호받을 수 있도록 필요한 조치를 해야 하며, 주인을 찾을 수 있도록 그 사실을 7 일 이상 공고해야 합니다.<br>
				<i class="fas fa-comment"></i> 공고 후 10일이 지나도 주인을 찾지 못한 경우, 해당 시ㆍ군ㆍ구등이 동물의 소유권을 갖게 되어 개인에게 기증하거나 분양할 수 있습니다.<br>
			</p>
		</div>
	</div>
  </div>
</div>  
<%@ include file="../include/footer.jsp" %>