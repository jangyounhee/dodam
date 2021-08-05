<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/adminHeader.jsp"%>
<script src="https://cdn.ckeditor.com/ckeditor5/23.0.0/classic/ckeditor.js?ver=2"></script>
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
				<form role="form" action="/admin/adminNewsBoardWriteRun" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<span style="font-size:30px"><label style="font-weight:bold">동물 정보/뉴스</label></span>
						<table class="table">
						<tbody>
							<tr>
								<td align="center">제목</td>
								<td align="center"></td>
								<td><input type="text" class="form-control" id="ab_title" name="ab_title" required/></td>
							</tr>
							<tr>
								<td align="center">내용</td>
								<td align="center"></td>
								<td>
									<textarea name="ab_content" id="editor" wrap="hard" rows="10" cols="100" placeholder="내용을 입력하세요."></textarea>
									<script src="/resources/js/ckeditor.js"></script>
								</td>
							</tr>
						</tbody>
					</table>
					<label for="file">사진 첨부</label><br>
					<div class="form-group">
						<input type="file" class="form-control-file" id="file" name="file"/>
					</div>
					</div>
					<button type="submit" class="btn btn-primary">작성완료</button>
					<a href="adminNewsBoard" class="btn btn-danger">취소</a>
				</form>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp"%>
