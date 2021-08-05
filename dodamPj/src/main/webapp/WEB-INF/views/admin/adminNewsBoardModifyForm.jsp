<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/adminHeader.jsp"%>
<script src="https://cdn.ckeditor.com/ckeditor5/23.0.0/classic/ckeditor.js?ver=2"></script>
<script src="/resources/js/my-script.js"></script>
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
				<form role="form" action="/admin/adminNewsBoardModifyRun" method="post">
					<input type="hidden" name="ab_no" value="${newsBoardVo.ab_no }"/>
					<div class="form-group">
						<span style="font-size:30px"><label style="font-weight:bold">동물 정보/뉴스</label></span>
						<table class="table">
						<tbody>
							<tr>
								<td align="center">제목</td>
								<td align="center"></td>
								<td><input type="text" class="form-control" id="ab_title" name="ab_title" value="${newsBoardVo.ab_title }"/></td>
							</tr>
							<tr>
								<td align="center">내용</td>
								<td align="center"></td>
								<td>
									<textarea name="ab_content" id="editor" wrap="hard" rows="10" cols="100">${newsBoardVo.ab_content }</textarea>
									<script src="/resources/js/ckeditor.js"></script>
								</td>
							</tr>
							
						</tbody>
					</table>
					</div>
					<button type="submit" class="btn btn-primary">수정완료</button>
					<a href="adminNewsBoardContent?ab_no=${newsBoardVo.ab_no}" class="btn btn-danger">취소</a>
				</form>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp"%>
