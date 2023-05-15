<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>정책추가</title>
<style>
.one{
	width:80px;
}
.two{
	width:400px;
}
</style>
</head>
<body>
<div id="app">
	<div class="card text-center">
	  <div class="card-header">
	  	<p>공지 사항 추가</p>
	  </div>
	  <div class="card-body">
	  <form action="/admin/boardInsert" method="post" enctype="multipart/form-data">
	    <table class="table table-bordered two" align=center>
	    	<tr>
	    		<td class="one">제목</td>
	    		<td><input type="text" name="boardTitle" class="form-control">
	    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    		<input type="hidden" name="boardType" value="1" />
	    		
	    		</td>
	    	</tr>
	    	<tr>
	    		<td class="one">작성자</td>
	    		<td><input type="text" name="boardWriter" class="form-control"></td>
	    	</tr>
	    	<tr>
	    		<td class="one">본문</td>
	    		<td><input type="text" name="boardContent" class="form-control"></td>
	    	</tr>
	    	<tr>
	    		<td class="one">사진 첨부</td>
	    		<td><input type="file" name="fileName" class="form-control"></td>
	    	</tr>
	    	<tr>
	    		<td class="one">전송</td>
	    		<td><input type="submit" class="btn btn-danger" value="등록"></td>
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
				var boardTitle = $("input[name='boardTitle']").val();
				var boardContent = $("input[name='boardContent']").val();
				var boardWriter = $("input[name='boardWriter']").val();
				var fileName = $("input[name='fileName']").val();
				
				console.log(boardTitle, boardContent, boardWriter, fileName)
				
				
				var formData = new FormData();
				
				formData.append("boardTitle", boardTitle);
				formData.append("boardContent", boardContent);
				formData.append("boardWriter", boardWriter);
				formData.append("fileName", fileName);
				
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				$.ajax({
					url:"/admin/boardInsert",
					processData:false,
					contentType:false,
					type:"post",
					data: formData,
					dataType:"json",
					beforeSend : function(xhr) {
				        xhr.setRequestHeader(header, token);
				    },
					success:function(data){
						if(data.result == "success"){
							alert("success");
							return false;
						}
						if(data.result == "fail"){
							alert("fail");
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