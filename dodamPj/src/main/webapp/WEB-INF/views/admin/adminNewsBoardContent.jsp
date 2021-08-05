<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminHeader.jsp"%>
<script src="https://cdn.ckeditor.com/ckeditor5/23.0.0/classic/ckeditor.js?ver=2"></script>
<script src="/resources/js/my-script.js"></script>
<script>
$(document).ready(function() {
	$("#btnDelete").click(function() {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "/admin/adminNewsBoardDeleteRun?ab_no=${newsBoardVo.ab_no}";
		}
	});
	
	// 댓글 목록
	$("#btnCommentList").click(function() {
		var url = "/comment/getCommentList/${newsBoardVo.ab_no}";
		
		$.get(url, function(receivedData) {
			var cloneTr;
			$("#commentTable > tbody > tr:gt(0)").remove();
			$.each(receivedData, function() {
				var cloneTr = $("#commentTable > tbody > tr:first").clone();
				var td = cloneTr.find("td");
				td.eq(0).text(this.c_no);
				td.eq(1).text(this.c_content);
				td.eq(2).text(this.user_id);
				td.eq(3).text(changeDateString(this.c_regdate));
				td.eq(5).find("button").attr("data-cno", this.c_no);
				$("#commentTable > tbody").append(cloneTr);
				cloneTr.show("slow");
			});
			
		});
		
	});
	
	// 댓글 삭제
	$("#commentTable").on("click", ".commentDelete", function() {
		var c_no = $(this).attr("data-cno");
		console.log(c_no);
		var url = "/comment/deleteComment/" + c_no + "/${newsBoardVo.ab_no}";
		if (confirm("댓글을 삭제하시겠어요?")) {
			$.get(url, function(receivedData) {
				console.log(receivedData);
				if (receivedData == "success") {
					$("#btnCommentList").trigger("click");
				}
			});
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
					<input type="hidden" name="ab_no" value="${newsBoardVo.ab_no }"/>
					<div class="form-group">
						<span style="font-size:30px"><label style="font-weight:bold">동물 정보/뉴스</label></span>
						<table class="table">
						<tbody>
							<tr>
								<td align="center">제목</td>
								<td align="center"></td>
								<td><input type="text" class="form-control" id="ab_title" name="ab_title" value="${newsBoardVo.ab_title }" readonly/></td>
							</tr>
							<tr>
							
								<td align="center">내용</td>
								<td align="center"></td>
								<td>
									<div id="content"></div>
									<script language="javascript">
										var tmpStr = "${newsBoardVo.ab_content }";
										tmpStr = tmpStr.replaceAll("&lt;", "<");
										tmpStr = tmpStr.replaceAll("&gt;", "<");
										tmpStr = tmpStr.replaceAll("&amp;lt;", "<");
										tmpStr = tmpStr.replaceAll("&amp;gt;", ">");
										tmpStr = tmpStr.replaceAll("&amp;nbsp;", " ");
										tmpStr = tmpStr.replaceAll("&amp;amp;", "&");
										document.getElementById('content').innerHTML=tmpStr;
									</script>
									<c:choose>
										<c:when test="${empty newsBoardVo.ab_picture }">
											<label> </label>
										</c:when>
										<c:otherwise>
											<p><img style="height: 100px;" src="http://localhost/admin/displayImage?fileName=${newsBoardVo.ab_picture}" /></p>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</tbody>
					</table>
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<hr/>
							<button type="button" class="btn btn-success" id="btnCommentList">댓글보기</button>
							<hr/>
						</div>
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
										<td><button type="button" id="commentD"class="btn btn-danger btn-sm commentDelete">삭제</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
					
					<div class="row">
						<div class="col-md-12">
							<a class="btn btn-primary" id="btnModify" href="/admin/adminNewsBoardModifyForm?ab_no=${newsBoardVo.ab_no }">수정</a>
<!-- 							<button type="submit" class="btn btn-success" id="btnModifyFinish" style="display:none">수정완료</button> -->
							<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
							<a class="btn btn-warning" href="adminNewsBoard">목록</a>
						</div>
					</div>
				</form>
				
				
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>