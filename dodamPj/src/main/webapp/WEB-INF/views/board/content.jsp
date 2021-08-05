<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/23.0.0/classic/ckeditor.js?ver=2"></script>
<script src="/resources/js/my-script.js"></script>
<script>
$(document).ready(function() {
	$("#btnDelete").click(function() {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "/board/deleteRun?b_no=${boardVo.b_no}";
		}
	});
	
	var loginVoId = "${loginVo.user_id}";
	
	// 댓글 목록
	$("#btnCommentList").click(function() {
		var url = "/comment/getCommentList/${boardVo.b_no}";
		
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
				td.eq(4).find("button").attr("data-cno", this.c_no);
				td.eq(5).find("button").attr("data-cno", this.c_no);
				
				var user = td.eq(2).text();
// 				console.log(loginVoId);
// 				console.log(user);
				$("#commentTable > tbody").append(cloneTr);
				cloneTr.show("slow");
				if(loginVoId == user){
					td.eq(4).find("#commentM").attr("style","display:content");
					td.eq(5).find("#commentD").attr("style","display:content");
				}
			});
		});
	});
	
	// 댓글 입력
	$("#btnCommentInsert").click(function() {
		var c_content = $("#c_content").val();
		var b_no = parseInt("${boardVo.b_no}");
		var url = "/comment/insertComment";
		var sendData = {
				"c_content" : c_content,
				"b_no"	    : b_no
		};
		console.log(sendData);
		console.log(JSON.stringify(sendData));
		
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
				// 처리가 잘 되었다면, 댓글 목록 버튼을 클릭시켜서 목록을 새로 얻음
				if (receivedData == "success") {
					$("#btnCommentList").trigger("click");
				}
			}
		});
	});
	
	// 댓글 삭제
	$("#commentTable").on("click", "#commentD", function() {
		var c_no = $(this).attr("data-cno");
		console.log(c_no);
		var url = "/comment/deleteComment/" + c_no + "/${boardVo.b_no}";
		if (confirm("댓글을 삭제하시겠어요?")) {
			$.get(url, function(receivedData) {
				console.log(receivedData);
				if (receivedData == "success") {
					$("#btnCommentList").trigger("click");
				}
			});
		}
	});
	
	// 댓글 수정
	$("#commentTable").on("click", ".commentModify", function() {
		$("#updateCommentText").show(1000);
		// 모달창 보이기
		var c_no = $(this).parent().parent().find("td").eq(0).text();
		var c_content = $(this).parent().parent().find("td").eq(1).text();
		console.log(c_content);
		$(".modal-body > .c_content").val(c_content);
		$("#btnModalOk").attr("data-cno", c_no);
		$("#modal-284734").trigger("click");
	});
	
	// 모달 수정완료 버튼
	$("#btnModalOk").click(function() {
		var c_no = $(this).attr("data-cno");
		var c_content = $(".modal-body > .c_content").val();
		var url = "/comment/updateComment";
		var sendData = {
				"c_no" : c_no,
				"c_content" : c_content
		};
		console.log(sendData);
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
					$("#btnModalClose").trigger("click");
					$("#btnCommentList").trigger("click");
				}
			}
		});
	});
});
</script>
<!-- 모달창 -->
<div class="row">
	<div class="col-md-12">
		 <a style="display:none" id="modal-284734" href="#modal-container-284734" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
		 <div class="modal fade" id="modal-container-284734" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							댓글 수정
						</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control c_content"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							id="btnModalOk">
							수정완료
						</button> 
						<button type="button" class="btn btn-secondary" data-dismiss="modal"
							id="btnModalClose">
							닫기
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- // 모달창 -->

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
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/board/freeBoard">- 자유게시판</a>
		                     <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/newsboard/newsBoard">- 동물 정보/뉴스</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/customerboard/customerBoard">- 고객센터</a>
                </div>
            </div>
		</div>
			<div class="col-md-10">
				<form role="form">
					<input type="hidden" name="user_id" value="${boardVo.user_id }"/>
					<input type="hidden" name="b_no" value="${boardVo.b_no }"/>
					<div class="form-group">
						<span style="font-size:30px"><label style="font-weight:bold">자유게시판</label></span>
						<table class="table">
						<tbody>
							<tr>
								<td align="center">이름</td>
								<td align="center"></td>
								<td><input type="text" class="form-control" id="user_id" name="user_id" value="${boardVo.user_id }" readonly/></td>
							</tr>
							<tr>
								<td align="center">제목</td>
								<td align="center"></td>
								<td><input type="text" class="form-control" id="b_title" name="b_title" value="${boardVo.b_title }" readonly/></td>
							</tr>
							<tr>
								<td align="center">내용</td>
								<td align="center"></td>
								<td>
								<div id="content"></div>
									<script language="javascript">
										var tmpStr = "${boardVo.b_content }";
										tmpStr = tmpStr.replaceAll("&lt;", "<");
										tmpStr = tmpStr.replaceAll("&gt;", "<");
										tmpStr = tmpStr.replaceAll("&amp;lt;", "<");
										tmpStr = tmpStr.replaceAll("&amp;gt;", ">");
										tmpStr = tmpStr.replaceAll("&amp;nbsp;", " ");
										tmpStr = tmpStr.replaceAll("&amp;amp;", "&");
										document.getElementById('content').innerHTML=tmpStr;
									</script>
									<c:choose>
										<c:when test="${empty boardVo.b_picture }">
											<label> </label>
										</c:when>
										<c:otherwise>
											<p><img style="height: 100px;" src="http://localhost/board/displayImage?fileName=${boardVo.b_picture}" /></p>
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
					
					<c:choose>
				<c:when test="${empty sessionScope.loginVo }">
			
				</c:when>
					<c:otherwise>
					<div class="row">
							<div class="col-md-2"></div>
								<div class="col-md-8">
									<input type="text" class="form-control"
										placeholder="댓글을 입력하세요..."
										id="c_content"/>
								</div>
								<div class="col-md-2">
									<button type="button" class="btn btn-primary"
										id="btnCommentInsert">입력</button>
								</div>
							</div>
							
					</c:otherwise>
				</c:choose>
				
				<div class="row">
					<div class="col-md-12">
						<table class="table" id="commentTable">
							<tbody>
								<tr style="display:none;">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><button style="display:none;" type="button" id="commentM"class="btn btn-warning btn-sm commentModify">수정</button></td>
									<td><button style="display:none;" type="button" id="commentD"class="btn btn-danger btn-sm commentDelete">삭제</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
					
					<div class="row">
						<div class="col-md-12">
						<c:if test="${loginVo.user_id == boardVo.user_id }">
							<a class="btn btn-primary" id="btnModify" href="/board/modifyForm?b_no=${boardVo.b_no }">수정</a>
							<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
						</c:if>
							<a class="btn btn-warning" href="freeBoard">목록</a>
						</div>
					</div>
				</form>
				
				
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>