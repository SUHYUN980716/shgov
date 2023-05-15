<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<div class="card text-center">
	  <div class="card-header">
	  	<p>안녕히가십시오.</p>
	  </div>
	  <div class="card-body">
	    <form action="/member/logout" method="post">
	    	<table class="table" style="width:500px; margin: 0 auto">
	    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    		<tr>
	    			<td><input type="submit" class="btn btn-success" value="로그아웃"></td>
	    		</tr>
	    	</table>
	    </form>
	  </div>
	  <div class="card-footer text-muted">
	    <p>shgov</p>
	  </div>
	</div>
</body>
</html>