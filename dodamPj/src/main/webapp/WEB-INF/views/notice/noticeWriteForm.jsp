<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/adminHeader.jsp"%>
<!-- 공지사항 등록 화면  -->

<script src="/resources/js/my-script.js"></script>
<script>
$(document).ready(function() {
	$("#fileDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
	});
	
	$("#fileDrop").on("drop", function(e) {
		e.preventDefault();
		console.log(e);
		var file = e.originalEvent.dataTransfer.files[0];
		console.log(file);
		var formData = new FormData(); 
		formData.append("file", file); 
									   
		// 파일을 비동기 방식으로 전송
		// enctype="multipart/form-data"
		var url = "/notice/uploadAjax";
		$.ajax({
			"processData" : false,
			"contentType" : false,
			"url" : url,
			"method" : "post",
			"data" : formData,
			"success" : function(receivedData) {
				console.log(receivedData);
				var fileName = receivedData.substring(
						receivedData.lastIndexOf("_") + 1);
				var cloneDiv = $("#uploadedList").prev().clone();
				var img = cloneDiv.find("img");
				// 이미지인 경우
				if (isImage(fileName)) {
					img.attr("src", "http://localhost/notice/displayImage?fileName=" + receivedData);
					console.log()
				}
				
				cloneDiv.find("span").text(fileName);
				cloneDiv.find(".a_times").attr("href", receivedData);
				$("#uploadedList").append(cloneDiv.show());
			}
		});
	});
	
	// 첨부파일 삭제 링크
	$("#uploadedList").on("click", ".a_times", function(e) {
		e.preventDefault();
		var that = $(this);
		var fileName = $(this).attr("href");
		console.log(fileName);
		var url = "/notice/deleteFile?fileName=" + fileName;
		$.get(url, function(rData) {
			if (rData == "success") {
				that.parent().remove();
			}
		});
	});
	
	// 폼전송
	$("#frmWrite").submit(function() {
		var div = $("#uploadedList .divUploaded");
		$(this).find("[names^=files]").remove();
		div.each(function(index) {
			var fileName = $(this).find(".a_times").attr("href");
			var html = "<input type='hidden' name='files["+index+"]' value='"+fileName+"'/>";
			$("#frmWrite").prepend(html);
		});
		
// 		return false; // 폼전송 막기
	});
});
</script>
<style>
#fileDrop {
	width: 80%;
	height: 100px;
	background-color: yellow;
	margin: 20px auto;
	border: 2px dashed blue;
}
.divUploaded {
	width : 150px;
	float : left;
}
</style>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin-top:5px; text-align:center;" >
			<img src="/resources/img/centerBanner.jpg">
		</div>
	</div>
	<div class="row" style="margin-top:10px;">
		<div class="col-md-2">
 			<div class="border-end bg-white" id="sidebar-wrapper">
   				<div class="list-group list-group-flush">
                	<a class="list-group-item" style="background-color:#CCF2F4;">
                		<strong><i class="fas fa-paw"></i> 도담센터(Admin)</strong></a>
                	<a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/admin/noticeList">- 공지 사항 목록</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" 
                    	href="/notice/noticeWriteForm">- 공지 사항 등록</a>
                    
                </div>
            </div>
		</div>
	<div class="col-md-10">
		<h2>공지사항 작성</h2>
				<div class="container-fluid px-2">
					<div class="form-group">
							<form action="/notice/noticeWriteRun" method="post" />
							<div class="form-group">
								<label for="n_title">제목</label> <input type="text"
									class="form-control" id="n_title" name="n_title"
									placeholder="제목을 작성해주세요.">
							</div>
							<div class="form-group">
								<label for="n_content">내용</label>
								<textarea class="form-control" id="n_content" name="n_content"
									rows="10"></textarea>
							</div>
						</div>
<!-- 					2012.07.13	여기서 부터 첨부파일 부분 -->
						<label for="n_content">첨부파일</label>
						
						<div>
							<label>첨부할 파일을 드래그 &amp; 드롭하세요.</label>
							<div id="fileDrop"></div>
						</div>
						<span></span><br/>
						<div style="display:none;" class="divUploaded">
							<img height="80"  src="/resources/img/default_image.png"
								class="img-rounded"/><br>
							<span>default</span>
							<a href="#" class="a_times">&times;</a>
						</div>
						
						<div id="uploadedList">
						</div>
						<button type="submit" class="btn btn-info">등록하기</button>
							<a href="/admin/adminPage" class="btn btn-secondary">메인으로</a>
					</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="/resources2/assets/demo/chart-area-demo.js"></script>
<script src="/resources2/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="/resources2/js/datatables-simple-demo.js"></script>

<%@ include file="../include/footer.jsp"%>