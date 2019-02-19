package net.su.shar.vo;

public class SharSearchAndPageValueObject  {
	
	//검색용 변수
		private int sharSearchCnd = 0;//검색 조건
		
		private String sharSearchWrd = "";//검색 단어
		
		private int sharSearchAry = 0;//정렬 조건
		
		//페이징용 변수
		private int sharCurrentPageNo = 1;//현재 페이지 번호
		
		private int sharRecordCountPerPage = 10;//한 페이지당 게시되는 게시물 건 수
		
		private int sharPageSize = 5;//페이지 리스트에 게시되는 페이지 건 수
		
		private int sharTotalRecordCount = 0;//전체 게시물 건 수
		
		private int sharTotalPageCount = 0;//전체 페이지 개수
		
		private int sharFirstRecordIndex = 0;//첫 페이지 인덱스 번호(글 번호)
		
		private int sharLastRecordIndex = 0;//마지막 페이지 인덱스 번호(글 번호)
		
		private int sharFirstPageNoOnPageList = 1;//페이지 리스트의 첫 페이지 번호
		
		private int sharLastPageNoOnPageList = 1;//페이지 리스트의 마지막 페이지 번호

		public int getSharSearchCnd() {
			return sharSearchCnd;
		}

		public void setSharSearchCnd(int sharSearchCnd) {
			this.sharSearchCnd = sharSearchCnd;
		}

		public String getSharSearchWrd() {
			return sharSearchWrd;
		}

		public void setSharSearchWrd(String sharSearchWrd) {
			this.sharSearchWrd = sharSearchWrd;
		}

		public int getSharSearchAry() {
			return sharSearchAry;
		}

		public void setSharSearchAry(int sharSearchAry) {
			this.sharSearchAry = sharSearchAry;
		}

		public int getSharCurrentPageNo() {
			return sharCurrentPageNo;
		}

		public void setSharCurrentPageNo(int sharCurrentPageNo) {
			this.sharCurrentPageNo = sharCurrentPageNo;
		}

		public int getSharRecordCountPerPage() {
			return sharRecordCountPerPage;
		}

		public void setSharRecordCountPerPage(int sharRecordCountPerPage) {
			this.sharRecordCountPerPage = sharRecordCountPerPage;
		}

		public int getSharPageSize() {
			return sharPageSize;
		}

		public void setSharPageSize(int sharPageSize) {
			this.sharPageSize = sharPageSize;
		}

		public int getSharTotalRecordCount() {
			return sharTotalRecordCount;
		}

		public void setSharTotalRecordCount(int sharTotalRecordCount) {
			this.sharTotalRecordCount = sharTotalRecordCount;
		}

		public int getSharTotalPageCount() {
			return sharTotalPageCount;
		}

		public void setSharTotalPageCount(int sharTotalPageCount) {
			this.sharTotalPageCount = sharTotalPageCount;
		}

		public int getSharFirstRecordIndex() {
			return sharFirstRecordIndex;
		}

		public void setSharFirstRecordIndex(int sharFirstRecordIndex) {
			this.sharFirstRecordIndex = sharFirstRecordIndex;
		}

		public int getSharLastRecordIndex() {
			return sharLastRecordIndex;
		}

		public void setSharLastRecordIndex(int sharLastRecordIndex) {
			this.sharLastRecordIndex = sharLastRecordIndex;
		}

		public int getSharFirstPageNoOnPageList() {
			return sharFirstPageNoOnPageList;
		}

		public void setSharFirstPageNoOnPageList(int sharFirstPageNoOnPageList) {
			this.sharFirstPageNoOnPageList = sharFirstPageNoOnPageList;
		}

		public int getSharLastPageNoOnPageList() {
			return sharLastPageNoOnPageList;
		}

		public void setSharLastPageNoOnPageList(int sharLastPageNoOnPageList) {
			this.sharLastPageNoOnPageList = sharLastPageNoOnPageList;
		}
		
}
