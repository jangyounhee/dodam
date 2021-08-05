<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
	$(document).ready(function() {
		
		$("#frm").submit(function(){
			var pw = $("#pw1").val();
			var pw2 = $("#pw2").val();
			if(pw != pw2){
				alert("패스워드를 확인 해주세요");
				return false;
			}
		});
		
		
	});
</script>
<form id="frm" action="/user/updatePw" method="post">
	<div>
		<label>아이디를 입력해주세요</label> <input type="text"
			name="user_id"  />
	</div>
	<div>
		<label>변경 할 패스워드를 입력해 주세요</label> <input type="password"
			name="user_pw" id="pw1" />
	</div>

	<div>
		<label>한번 더 입력 해주세요</label> <input type="password" name="user_pw1"
			id="pw2" />
	</div>
	<button type="submit" id="btnOk">변경 완료</button>
</form>

<%@ include file="../include/footer.jsp"%>