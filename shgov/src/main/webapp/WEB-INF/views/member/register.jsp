<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>회원가입</title>
</head>
<body>
	<div id="app">
		<div class="card text-center">
			<div class="card-header">
				<p>회원가입</p>
			</div>
			<div class="card-body">
				<form>
					<table class="table table-bordered"
						style="width: 500px; margin: 0 auto">
						<tr>
							<td><p>아이디 :</p>
								<input type="text" name="userId" class="form-control"></td>
						</tr>
						<tr>
							<td><p>이름 :</p>
								<input type="text" name="userName" class="form-control"></td>
						</tr>
						<tr>
							<td><p>비밀번호 :</p>
								<input type="password" name="userPassword" class="form-control"></td>
						</tr>
						<tr>
							<td><input type="button" class="btn btn-success"
								value="가입하기" @click="go"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="card-footer text-muted">
				<p>shgov</p>
			</div>
		</div>
	</div>
	<script>
		var vue = new Vue({
			el:"#app",
			data:{
				
			},
			methods:{
				go: function(){
					var userId = $("input[name='userId']").val()
					var userName = $("input[name='userName']").val()
					var userPassword = $("input[name='userPassword']").val()
					console.log(userId, userName, userPassword)
					var token = $("meta[name='_csrf']").attr("content");
					var header = $("meta[name='_csrf_header']").attr("content");
					$.ajax({
						url:"/member/registerPro",
						type:"post",
						data:{"userId":userId, "userName":userName, "userPassword":userPassword},
						beforeSend : function(xhr) {
					        xhr.setRequestHeader(header, token);
					    },
						success:function(){
							alert("가입이 완료 되었습니다.")
							window.location.href="/member/login"
						},
						error:function(request, status, error){
							alert("서버와의 연결이 끊겼습니다.")

						}
					})
				}
			}
		})
	</script>
</body>
</html>