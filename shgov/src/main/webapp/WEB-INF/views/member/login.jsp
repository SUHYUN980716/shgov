<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>로그인</title>
</head>
<body>
<div id="app">
	<div class="card text-center">
	  <div class="card-header">
	  	<p>로그인</p>
	  	<c:if test="${error != null}">
	  		<p style="color:red">정보를 확인해 주십시오</p>
	  	</c:if>
	  	<c:if test="${logout != null}">
	  		<p style="color:red">로그아웃 되었습니다.</p>
	  	</c:if>
	  </div>
	  <div class="card-body">
	    <form action="/login" method="post">
	    	<table class="table table-bordered" style="width:500px; margin: 0 auto">
	    		<tr>
	    			<td><p>아이디 : </p><input type="text" name="userId" class="form-control"></td>
	    		</tr>
	    		<tr>
	    			<td><p>비밀번호 : </p><input type="password" name="userPassword" class="form-control"></td>
	    		</tr>
	    		<tr>
	    			<td><input type="submit" class="btn btn-success" value="로그인" @click="ajax"></td>
	    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
			ajax:function(){
				var userId = $("input[name='userId']").val();
				var send = {"userId":userId};
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				$.ajax({
					url:"/member/loginCheck",
					type:"post",
					data: {"userId":userId},
					dataType:"json",
					beforeSend : function(xhr) {
				        xhr.setRequestHeader(header, token);
				    },
					success:function(data){
						if(data.result == "notApproved"){
							alert("승인이 되지 않은 유저입니다. 관리자의 승인 이후에 사용 가능합니다.");
							return false;
						}
						if(data.result == "banned"){
							alert("차단된 유저입니다.");
							return false;
						}
					},
					error:function(){
						alert("서버와의 연결이 끊겼습니다.");
					}
				})
			}
		}
	})
	</script>
</body>
</html>