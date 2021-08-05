<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
	<h1>상세 보기</h1>
	<style>
#title {
	margin-bottom: 20px;
}

h2 {
	margin-top: 10px;
}
</style>

<div class="row">
	<div class="col-md-12">
		<form action="/board/writeRun" method="post">
		<input type="hidden" name="user_id" value="${sessionScope.loginVo.user_id }">
			<h2>게시글</h2>
			<div>
				<label for="t_title">제목</label>
				<input type="text" class="form-control" id="t_title" name="t_title" value="${boardVo.t_title }" />
				<label for="user_id">작성자</label>
				<input type="text" class="form-control" id="user_id" name="user_id" value="${boardVo.user_id }" />
			</div>
			<div>
				<label for="t_date">작성 시간</label>
				<input type="text" class="form-control" id="t_date" name="t_date" value="${boardVo.t_date }" />
			</div>
			
<!-- 			작성자<input type="text" id="user_id" value="user_id" /> -->

			<div>
				<label for="t_content">내용</label>
				<textarea class="form-control" id="t_content" name="t_content">${boardVo.t_content }</textarea>
			</div>
			<div>
				<a href="javascript:history.back(-1)" id="btnWrite" class="btn btn-primary">뒤로 가기</a>
			</div>


		</form>


	</div>
</div>
<%@ include file="../include/footer.jsp"%>