<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function(){
	$("#btnCommentInsert").click(function() {
		var c_content = $("#c_content").val();
		var n_no = parseInt("${noticeVo.n_no}");
		var url = "/comment/insertComment";
		var sendData = {
				"c_content" : c_content,
				"n_no"	    : n_no
		};
		console.log(sendData);
		console.log(JSON.stringify(sendData));
		// $.get, $.post의 원형, JSON.stringify : json 데이터를 문자열로 변환
		
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
	
	$("#btnCommentList").click(function() {
		// 비동기 요청, $.ajax, $.get, $.post, $.getJSON
		var url = "/comment/getCommentList/${noticeVo.n_no}";
		
		$.get(url, function(receivedData) {
// 			console.log(receivedData);
			var cloneTr;
			$("#commentTable > tbody > tr:gt(0)").remove();
			// -> 기존에 달려 있던 댓글들 모두 삭제
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
});
</script>
	<h1>공지 사항 상세 보기</h1>
	<style>
#title {
	margin-bottom: 20px;
}

h2 {
	margin-top: 10px;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<img style="margin-top: 10px; text-align: center;"
				src="/resources/img/centerBanner.jpg">
			<div class="row" style="margin-top: 10px;">
				<div class="col-md-2">
					<div class="border-end bg-white" id="sidebar-wrapper">
						<div class="list-group list-group-flush">
							<a class="list-group-item" style="background-color:#CCF2F4;">
                				<strong><i class="fas fa-paw"></i> 도담센터</strong></a>
                   			 <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    				href="/notice/noticeList">- 공지 사항</a>
                    		<a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    				href="/notice/procedure">- 보호절차</a>
                    		<a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    				href="/notice/map">- 오시는 길</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<form action="/board/writeRun" method="post">

							<h2>게시글</h2>
							<div>
								<label for="t_title" style="background-color: yellow">제목</label>
								<input type="text" class="form-control" id="t_title"
									name="n_title" value="${noticeVo.n_title }" />

							</div>
							<div>
								<label for="t_date" style="background-color: yellow">작성
									시간</label> <input type="text" class="form-control" id="t_date"
									name="n_date" value="${noticeVo.n_date }" />
							</div>

							<!-- 			작성자<input type="text" id="user_id" value="user_id" /> -->

							<div>
								<label for="t_content" style="background-color: yellow">내용</label>
								<textarea class="form-control" id="t_content" name="n_content">${noticeVo.n_content }</textarea>
							</div>
							<div>
								<a href="javascript:history.back(-1)" id="btnWrite"
									class="btn btn-primary">뒤로 가기</a>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>
			<h2>게시글</h2>
			<div>
				<label for="t_title" style="background-color:yellow">제목</label>
				<input type="text" class="form-control" id="t_title" name="n_title" value="${noticeVo.n_title }" />
				
			</div>
			<div>
				<label for="t_date"style="background-color:yellow" >작성 시간</label>
				<input type="text" class="form-control" id="t_date" name="n_date" value="${noticeVo.n_date }" />
			</div>
			
<!-- 			작성자<input type="text" id="user_id" value="user_id" /> -->

			<div>
				<label for="t_content"style="background-color:yellow" >내용</label>
				<textarea class="form-control" id="t_content" name="n_content">${noticeVo.n_content }</textarea>
			</div>
<!-- 		2012.07.13	첨부파일 -->
			<div>
				<label for="t_content"style="background-color:yellow" >첨부파일 </label>
				<img height="80"src="http://localhost/notice/displayImage?fileName=${noticeVo.n_filepath }" id="t_content" name="n_content"/>
			</div>
<!-- 		2012.07.13	첨부파일 끝 -->
			<div>
			
			
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
<!-- 				댓글 아직 미완 07-13 -->
			</div>
			<div class="row">
				<div class="col-md-12">
					<hr/>
					<button type="button" class="btn btn-info"
						id="btnCommentList">댓글목록</button>
					<hr/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table" id="commentTable">
						<c:forEach var="commentVo" items="${commentVo }">
						
						</c:forEach>
						<tbody>
							<tr style="display:none;">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" class="btn btn-warning btn-sm commentModify">수정</button></td>
								<td><button type="button" class="btn btn-danger btn-sm commentDelete">삭제</button></td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
<!-- 			댓글  -->
				<a href="javascript:history.back(-1)" id="btnWrite" class="btn btn-primary">뒤로 가기</a>
			</div>
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>