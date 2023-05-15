package org.shgov.domain;

public class Paging {

	// 페이징을 위해서 내부적으로 설정해야 하는 값
		private String keyword;
		private String searchtype;
		private int nowPage=1;
		private int perPage=2;
		private int pagingCnt=5;
		private int totalCnt;
		
		public int getNowPage() {
			return nowPage;
		}
		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
		}
		public int getPerPage() {
			return perPage;
		}
		public void setPerPage(int perPage) {
			this.perPage = perPage;
		}
		public int getPagingCnt() {
			return pagingCnt;
		}
		public void setPagingCnt(int pagingCnt) {
			this.pagingCnt = pagingCnt;
		}
		public int getTotalCnt() {
			return totalCnt;
		}
		public void setTotalCnt(int totalCnt) {
			this.totalCnt = totalCnt;
		}
		
		
		
		
		//검색을 위해서 받아야 하는 값
		public String getKeyword() {
			return keyword;
		}
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		public String getSearchtype() {
			return searchtype;
		}
		public void setSearchtype(String searchtype) {
			this.searchtype = searchtype;
		}




		//페이징을 위해서 외부적으로 받아야하는 값
		private int totalPagingCnt;
		private int firstPage;
		private int lastPage;
		private int startPage;
		private int endPage;

		public int getTotalPagingCnt() {
			totalPagingCnt = ((getTotalCnt() - 1) / getPerPage()) + 1; 
			return totalPagingCnt;
		}
		public int getFirstPage() {
			firstPage = ((getNowPage() - 1) / getPagingCnt()) * getPagingCnt() + 1; 
			return firstPage; 
		}
		
		public int getLastPage() {
			lastPage = getFirstPage() + getPagingCnt() - 1; 
			if(lastPage > getTotalPagingCnt()) { 
				lastPage = getTotalPagingCnt(); 
			} 
			return lastPage; 
		}
		
		public int getStartPage() {
			startPage = (getNowPage() - 1) * getPerPage(); 
			return startPage; 
		}
		
		public int getEndPage() {
			endPage = (int) Math.ceil((double) getTotalCnt() / (double) getPerPage()); 
			return endPage; 
		}
		
}
