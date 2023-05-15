<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>회원관리</title>
</head>
<body>
<div id="app">
	<div class="card text-center">
	  <div class="card-header">
	  	<p>회원관리</p>
	  </div>
	  <div class="card-body">
	  	<table class="table">
	  		<tr>
	  			<td>회원번호</td>
	  			<td>회원아이디</td>
	  			<td>회원이름</td>
	  			<td>비밀번호초기화</td>
	  			<td>회원승인</td>
	  			<td>회원차단</td>
	  			<td>회원상태</td>
	  		</tr>
	  		<template v-for="list in lists">
	  		<tr>
	  			<td>{{list.userNum}}</td>
	  			<td>{{list.userId}}</td>
	  			<td>{{list.userName}}</td>
	  			<td><button class="btn btn-info" @click="reset(list.userId)">초기화</button></td>
	  			<td><button class="btn btn-info" @click="approve(list.userId)">회원승인</button></td>
	  			<td><button class="btn btn-info" @click="ban(list.userId)">회원차단</button></td>
	  			<td v-for="item in list.authList">{{item.userRole=='ROLE_BAN'?'차단됨':'정상회원'}}</td>
	  		</tr>
	  		</template>
	  	</table>
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
		approve:function(userId){
			var vm = this;
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$.ajax({
				url:"/admin/approveUser",
				type:"post",
				data: {"userId":userId},
				dataType:"json",
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(header, token);
			    },
			    success:function(data){
			    	console.log(data)
			    	console.log(data.result)
			    	console.log(userId)
			    	
			    	if(data.result == "success"){
			    		alert("유저 승인이 완료되었습니다.")
			    	}else{
			    		alert("서버 오류.")
			    	}
			    },
			    error:function(){
			    	alert("서버와 연결이 끊어 졌습니다.")
			    }
			})
		},
		ban:function(userId){
			var vm = this;
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			if(confirm("차단 후 복구 할 수 없습니다. 진행하시겠습니까?")){
				$.ajax({
				url:"/admin/banUser",
				type:"post",
				data: {"userId":userId},
				dataType:"json",
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(header, token);
			    },
			    success:function(data){
			    	console.log(data)
			    	console.log(data.result)
			    	console.log(userId)
			    	
			    	if(data.result == "success"){
			    		alert("유저 차단 완료되었습니다.")
			    	}else{
			    		alert("서버 오류.")
			    	}
			    },
			    error:function(){
			    	alert("서버와 연결이 끊어 졌습니다.")
			    }
			})
			}
			
		},
		reset: function(userId){
			var vm = this;
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$.ajax({
				url:"/admin/resetPassword",
				type:"post",
				data: {"userId":userId},
				dataType:"json",
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(header, token);
			    },
			    success:function(data){
			    	console.log(data)
			    	console.log(data.result)
			    	console.log(userId)
			    	
			    	if(data.result == "success"){
			    		alert("비밀번호 초기화가 완료되었습니다.")
			    	}else{
			    		alert("서버 오류.")
			    	}
			    },
			    error:function(){
			    	alert("서버와 연결이 끊어 졌습니다.")
			    }
			})
		}
	}
})
</script>
</body>
</html>