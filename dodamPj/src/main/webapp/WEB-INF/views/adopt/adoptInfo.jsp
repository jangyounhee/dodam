<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

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
	<div class="col-md-10" style="margin-bottom:0px;">
		<h2>입양 안내</h2>
		<hr/>
		<div style="text-align:center;">
			<img src="/resources/img/adoptPic.png">
			<br><br><br>
			<p>---------------------------------------------------------------------------------------------------------</p><br>
			<p style="text-align:left;">
				<span style="color:blue;"><i class="fas fa-baby-carriage"></i>&nbsp;<strong>입양 전 진지하게 점검해야 할 체크리스트</strong></span><br>
				<i class="fas fa-comment"></i> 반려동물을 맞이할 환경적 준비 및 마음의 각오는 되어 있습니까?<br>
				<i class="fas fa-comment"></i> 개, 고양이는 10~15년 이상 삽니다. 결혼, 임신, 유학, 이사 등으로 가정환경이 바뀌어도 한 번 인연을 맺은 동물은
											끝까지 책임지고 보살피겠다는 결심이 섰습니까?<br>
				<i class="fas fa-comment"></i> 모든 가족들과의 합의는 되었습니까?<br>
				<i class="fas fa-comment"></i> 반려동물을 기른 경험이 있습니까? 또는 내 동물을 위해 공부할 각오가 되어 있습니까?<br>
				<i class="fas fa-comment"></i> 아플 때 적절한 치료를 해주고, 중성화 수술(불임수술)을 실천할 생각입니까?<br>
				<i class="fas fa-comment"></i> 입양으로 인한 경제적 부담을 짊어질 의사와 능력이 있습니까?<br>
				<i class="fas fa-comment"></i> 우리 집에서 키우는 다른 동물과 잘 어울릴 수 있을지 고민해 보았습니까?<br>
				<br>
				<span style="color:blue;"><i class="fas fa-baby-carriage"></i>&nbsp;<strong>입양 시 일부 경비가 청구될 수 있습니다.</strong></span><br>
				<i class="fas fa-comment"></i> 시,군,구청에서 보호하고 있는 유기동물 중 공고한 지 10일이 지나도 주인이 나타나지 않는 경우는 일반인에게 분양할 수 있습니다.<br>
				<i class="fas fa-comment"></i> 입양 보호시설에 미리 전화로 문의하시고, 담당자의 안내에 따라 방문 일시 등을 예약합니다.<br>
				<i class="fas fa-comment"></i> 입양 시 신분증 복사본 2장과 필요한 반려동물 물품을 준비하고 보호시설을 방문해 입양계약서를 작성해야 합니다.<br>
				<i class="fas fa-comment"></i> 입양 보호시설에는 신청자 본인이 직접 방문해야 합니다.<br>
				<i class="fas fa-comment"></i> 미성년자에게는 반려동물을 분양하지 않습니다. 분양을 원하는 미성년자는 부모님의 허락을 얻어 반드시 부모님과 함께 방문해야 합니다.<br>
				<br>
				<span style="color:red;"><i class="far fa-frown"></i>&nbsp;<strong>입양 예약 노쇼 관련 안내</strong></span><br>
				입양예약 후 미 방문(노쇼)로 인해 입양을 원하시는 다른 시민 분들과 입양을 기다리는 동물 모두에게 큰 피해가 발생하고 있습니다.<br>
				<span style="color:red;">노쇼 3회 누적 시 추후 입양예약이 불가함(자동 취소)</span>을 알려드리니 신중한 예약 부탁드립니다.<br>
			</p>
		</div>
	</div>
  </div>
</div>  
<%@ include file="../include/footer.jsp" %>