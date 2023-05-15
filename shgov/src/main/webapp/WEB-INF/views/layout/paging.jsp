<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<template id="pagination"> 
	<div class="pagination" v-if="dataSearch.totalCnt > 0"> 
		<a href="#" v-if="dataSearch.nowPage != 1" @click="pagingfn(1)">&Lt;</a> 
		<a href="#" v-if="dataSearch.nowPage != 1" @click="pagingfn(dataSearch.nowPage - 1)">이전</a> 
		<a href="#" :class="{'current': dataSearch.nowPage == i }" v-for="i in pageNum" @click="pagingfn(i)"> {{i}} </a> 
		<a href="#" v-if="dataSearch.nowPage < dataSearch.endPage" @click="pagingfn(dataSearch.nowPage + 1)">다음</a> 
		<a href="#" v-if="dataSearch.nowPage < dataSearch.endPage" @click="pagingfn(dataSearch.endPage)">&Gt;</a> 
	</div> 
</template> 


<nav aria-label="Page navigation example">
  <ul class="pagination" v-if="dataSearch.totalCnt > 0">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>