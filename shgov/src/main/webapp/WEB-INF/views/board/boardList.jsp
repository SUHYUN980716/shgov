<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>정책</title>
</head>
<body>
<div id="app">
	<div class="card text-center">
	  <div class="card-header">
	  	<p>정책</p>
	  </div>
	  <div class="card-body">
	    <table class="table">
	    	<tr>
	    		<td>인덱스</td>
	    		<td>제목</td>
	    		<td>작성자</td>
	    	</tr>
	    	<tr v-for="(list, index) in lists">
	    		<td>{{index}}</td>
	    		<td><a :href="'/board/boardDetail?boardNum='+list.boardNum">{{list.boardTitle}}</a></td>
	    		<td>{{list.boardWriter}}</td>
	    	</tr>
	    </table>
	  </div>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center" v-if="search.totalCnt > 0">
		    <li class="page-item"><a class="page-link" v-if="search.nowPage != 1" @click="pagingfn(1)">&Lt;</a></li>
		    <li class="page-item"><a class="page-link" v-if="search.nowPage != 1" @click="pagingfn(search.nowPage - 1)">이전</a></li>
		    <li class="page-item" v-for="i in pageNum"><a class="page-link" @click="pagingfn(i)">{{i}}</a></li>
		    <li class="page-item"><a class="page-link" v-if="search.nowPage < search.endPage" @click="pagingfn(search.nowPage + 1)">다음</a></li>
		    <li class="page-item"><a class="page-link" v-if="search.nowPage < search.endPage" @click="pagingfn(search.endPage)">&Gt;</a></li>
		  </ul>
		</nav>
		
	  <div class="card-footer text-muted">
	    <p>shgov</p>
	  </div>
	</div>
</div>
<script>
var vue = new Vue({
	el:"#app",
	data:{
		lists:${list},
		search:${search}
	},
	methods:{
		pagingfn: function(nowPage) { 
			var vm = this; 
			this.search.nowPage = nowPage; 
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$.ajax({ 
				url : '/board/paging', 
				contentType : "application/json; charset=UTF-8", 
				method : 'post', 
				data : JSON.stringify(vm.search), 
				dataType : 'json', 
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(header, token);
			    }, 
				success : function(data) { 
					vm.lists = JSON.parse(data.list); 
					vm.search = JSON.parse(data.search); 
					var url = "/board/boardList";
					url += "?nowPage=";
					url += vm.search.nowPage;
					history.pushState(null, null, url)
				}, 
				error : function(e) { 
					console.log(e); 
					alert('에러 발생\n관리자에게 문의하세요.'); 
				}, 
				complete: function() { 
				} 
			});
		}
		},
		computed: {
			pageNum : function(){
				var range=[]
				for(var i = this.search.firstPage; i<=this.search.lastPage; i++){
					range.push(i)
				}
				return range;
			}
		}
	})
</script>
</body>
</html>