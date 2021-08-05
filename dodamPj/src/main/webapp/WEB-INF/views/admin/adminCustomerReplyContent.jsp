<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/23.0.0/classic/ckeditor.js?ver=2"></script>
<script src="/resources/js/my-script.js"></script>
<script>
$(document).ready(function() {
	$("#btnDelete").click(function() {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "/admin/adminCustomerDeleteRun?cb_no=${customerBoardVo.cb_no}";
		}
	});
	
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<img style="margin-top:10px; text-align:center;" src="/resources/img/communityBanner.jpg">
		</div>
	</div>
	<div class="row" style="margin-top:10px;">
		<div class="col-md-2">
        	<div class="border-end bg-white" id="sidebar-wrapper">
                <div class="list-group list-group-flush">
                	<a class="list-group-item" style="background-color:#CCF2F4;">
		                		<strong><i class="fas fa-paw"></i> 커뮤니티</strong></a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/adminFreeBoard">- 자유게시판</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/adminNewsBoard">- 동물 정보/뉴스</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/adminCustomerBoard">- 고객센터</a>
                </div>
            </div>
		</div>
			<div class="col-md-10">
				<form role="form">
					<input type="hidden" name="cb_no" value="${customerBoardVo.cb_no }"/>
					<div class="form-group">
						<span style="font-size:30px"><label style="font-weight:bold">고객센터</label></span>
						<table class="table">
						<tbody>
							<tr>
								<td align="center">제목</td>
								<td align="center"></td>
								<td><input type="text" class="form-control" id="cb_title" name="cb_title" value="${customerBoardVo.cb_title }" readonly/></td>
							</tr>
							<tr>
							
								<td align="center">내용</td>
								<td align="center"></td>
								<td>
									<div id="content"></div>
									<script language="javascript">
										var tmpStr = "${customerBoardVo.reply }";
										tmpStr = tmpStr.replaceAll("&lt;", "<");
										tmpStr = tmpStr.replaceAll("&gt;", "<");
										tmpStr = tmpStr.replaceAll("&amp;lt;", "<");
										tmpStr = tmpStr.replaceAll("&amp;gt;", ">");
										tmpStr = tmpStr.replaceAll("&amp;nbsp;", " ");
										tmpStr = tmpStr.replaceAll("&amp;amp;", "&");
										document.getElementById('content').innerHTML=tmpStr;
									</script>
								</td>
								
							</tr>
							
						</tbody>
					</table>
					</div>
				<div class="row">
					<div class="col-md-12">                                                
						<table class="table" id="commentTable">
							
							<tbody>
								<tr style="display:none;">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<c:choose>
									<c:when test="${empty sessionScope.loginVo }">
									</c:when>
										<c:otherwise>
											<td><button type="button" class="btn btn-warning btn-sm commentModify">수정</button></td>
											<td><button type="button" class="btn btn-danger btn-sm commentDelete">삭제</button></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
					
					<div class="row">
						<div class="col-md-12">
							<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
							<a class="btn btn-warning" href="adminCustomerBoard">목록</a>
						</div>
					</div>
				</form>
				
				
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>