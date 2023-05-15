<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
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
	  	<p>공지</p>
	  </div>
	  <div class="card-body">
	    <table class="table table-bordered">
	    	<tr>
	    		<td class="one">제목</td>
	    		<td>{{lists.boardTitle}}</td>
	    	</tr>
	    	<tr>
	    		<td class="one">작성자</td>
	    		<td>{{lists.boardWriter}}</td>
	    	</tr>
	    	<tr>
	    		<td class="one content">본문</td>
	    		<td><img :src="'/images?boardNum='+lists.boardNum" class="two" @error="image"><br>{{lists.boardContent}}</td>
	    	</tr>
	    </table>
	  </div>
	  <div class="card-footer text-muted">
	    <p>shgov</p>
	   <sec:authorize access="hasRole('ROLE_ADMIN')">
	    <button class="btn btn-danger" @click="gotoyo">수정</button>
	    <button class="btn btn-danger" @click="deletego">삭제</button>
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
		image:function(e){
			e.target.src = '/images?boardNum=BNUM0000001541';
		},
		gotoyo:function(){
			if(confirm("수정하시겠습니까?")){
				window.location.href="/board/boardEdit?boardNum="+this.lists.boardNum;
			}
			
		},
		deletego:function(){
			if(confirm("삭제하시겠습니까?")){
			window.location.href="/board/deletePost?boardNum="+this.lists.boardNum;
			}
		}
	}
})
</script>
</body>
</html>