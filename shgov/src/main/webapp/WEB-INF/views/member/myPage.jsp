<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>회원정보 수정</title>
</head>
<body>
	<div id="app">
		<div class="card text-center">
			<div class="card-header">
				<p>회원정보 수정</p>
			</div>
			<div class="card-body">
				<form>
					<table class="table table-bordered"
						style="width: 500px; margin: 0 auto">
						<tr>
							<td><p>아이디 :</p>
								<input type="text" name="userId" class="form-control" :value="lists.userId"></td>
						</tr>
						<tr>
							<td><p>이름 :</p>
								<input type="text" name="userName" class="form-control" :value="lists.userName"></td>
						</tr>
						<tr>
							<td><p>비밀번호 수 :</p>
								<input type="password" name="userPassword" class="form-control" placeholder="수정할 비밀번호를 입력하세요."></td>
						</tr>
						<tr>
							<td><input type="button" class="btn btn-success"
								value="수정하기" @click="go"></td>
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
				lists:${list}
			},
			methods:{
				go: function(){
					var userId = $("input[name='userId']").val()
					var userName = $("input[name='userName']").val()
					var userPassword = $("input[name='userPassword']").val()
					console.log(userId, userName, userPassword)
					var token = $("meta[name='_csrf']").attr("content");
					var header = $("meta[name='_csrf_header']").attr("content");
					
					if(userPassword == "" || userPassword == null){
						alert("수정할 비밀번호를 입력해주세요.")
						return false;
					}
					
					$.ajax({
						url:"/member/myPagePro",
						type:"post",
						data:{"userId":userId, "userName":userName, "userPassword":userPassword},
						beforeSend : function(xhr) {
					        xhr.setRequestHeader(header, token);
					    },
						success:function(){
							alert("수정이 완료 되었습니다.")
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