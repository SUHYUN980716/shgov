<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<style>
.one{
	width:80px;
}
.content{
	height:300px;
}
.two{
 	padding: 30px;
 	height: 300px; 
  }
</style>
</head>
<body>
<div id="app">
	<div class="card text-center">
	  <div class="card-header">
	  	<p>수정</p>
	  </div>
	  <div class="card-body">
	  <form action="/board/boardEditPro" method="post">
	    <table class="table table-bordered">
	    	<tr>
	    		<td class="one">제목</td>
	    		<td><input type="text" name="boardTitle" :value="lists.boardTitle" class="form-control">
	    		<input type="hidden" name="boardNum" :value="lists.boardNum" class="form-control">
	    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    		</td>
	    	</tr>
	    	<tr>
	    		<td class="one">본문</td>
	    		<td><input type="text" name="boardContent" :value="lists.boardContent" class="form-control"></td>
	    	</tr>
	    	<tr>
	    		<td class="one">전송</td>
	    		<td><input type="submit" class="btn btn-success" value="수정"></td>
	    	</tr>
	    </table>
	   </form>
	  </div>
	  <div class="card-footer text-muted">
	    <p>shgov</p>
	   <sec:authorize access="hasRole('ROLE_ADMIN')">
	    <button class="btn btn-danger">수정</button>
	    <button class="btn btn-danger">삭제</button>
	    </sec:authorize>
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
	}
})
</script>
</body>
</html>