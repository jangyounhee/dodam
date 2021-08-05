<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 공지사항 수정 화면 / 관리자 페이지에서 사용 -->
<h1>상세 보기</h1>
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
		<h2>공지사항 수정</h2>
				<div class="container-fluid px-2">
					<div class="form-group">
							<form action="/notice/noticeModifyRun" method="post">
							<input type="hidden" name="n_no" value="${noticeVo.n_no }" />
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
								<button type="submit" class="btn btn-primary">수정완료</button>
								<a href="/notice/noticeList" id="btnWrite"
									class="btn btn-primary">뒤로 가기</a>
							</div>
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<%@ include file="../include/footer.jsp"%>