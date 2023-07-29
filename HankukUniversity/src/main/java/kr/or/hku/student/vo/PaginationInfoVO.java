package kr.or.hku.student.vo;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import lombok.Data;

public class PaginationInfoVO<T> {
	private int totalRecord;		// 총 게시글수 ex)121 데이터
	
	private int totalPage;          // 총 페이지 수 ex)13 페이지
	
	private int currentPage;        // 현재 페이지
	
	private int screenSize = 6;    // 페이지 당 게시글 수
	
	private int blockSize = 5;      // 페이지 블록수 한번에 몇개의 페이지 번호를 보여줄거냐
	
	private int startRow;           // 시작 row
	
	private int endRow;             // 끝 row
	
	private int startPage;			// 시작페이지
	
	private int endPage;            // 끝 페이지
	
	private List<T> dataList;       // 결과를 넣을 데이터 리스트  
	
	private String searchType;      // 검색 타입(제목, 내용, 작성자, 작성일 등)
	
	private String searchWord;      // 검색 단어( 키워드)
	
	private String noticeClsf;
	
	private String deptCd;
	
	public String getDeptCd() {
		return deptCd;
	}

	public void setDeptCd(String deptCd) {
		this.deptCd = deptCd;
	}

	public String getNoticeClsf() {
		return noticeClsf;
	}

	public void setNoticeClsf(String noticeClsf) {
		this.noticeClsf = noticeClsf;
	}

	public PaginationInfoVO(){}
	
	/*
	 * PaginationInfoVO 객체를 만들때 한페이지 당 게시글 수와 페이지 블록 수를 
	 * 원하는 값으로 초기화 할 수 있도록 Custom 생성자 생성
	 */
	public PaginationInfoVO(int screenSize, int blockSize) {
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// 총 페이지 수 구하기
		// ceil 올림
		
		/*
		 * 전체를 count(보드 번호)를 가져온다.
		 * 
		 * 그리고 한 페이지 에 보여줄 게시글 수로 나눠서 올려준다 
		 * ex) 전체 게시글   			: 121
		 * 		한 페이지당 보여줄게시글 : 10
		 * 			13 페이지 나와야 하니까
		 * 121 / 10 = 12.1 올림 하면 == 13 이렇게 전체 페이지를 구한다.
		 */
		totalPage = (int) Math.ceil(totalRecord / (double) screenSize);
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;			// 현재 페이지
		endRow = currentPage * screenSize;		// 끝 row = 현재페이지 * 한페이지당 게시글 수
		startRow = endRow - (screenSize - 1); 	// 시작 row = 끝 row - (한 페이지당 게시글 수-1)
		//마지막 페이지 = (현재 페이지 + (페이지 블록 사이즈 -1)) / 페이지 블록 사이즈 * 페이지 블록사이즈
		endPage = (currentPage + (blockSize - 1)) / blockSize * blockSize;
		startPage = endPage - (blockSize - 1);
		
		/*
		 * 컨트롤러에서 해당 현재 페이지 값이 안들어오면 
		 * @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
		 * name 값이 page인 데이터가 
		 * required = false : 필수 요소가 아니다
		 * 기본값은 : 1 이다.
		 * 
		 * 이제 현재 페이지가 구해 지면
		 * 
		 * 현재페이지 = 현재 페이지 값을 설정해준다.
		 * 
		 * 끝 row = 현재 페이지 * 한페이지당 게시글수
		 * ex)
		 * 		현재 (1 페이지) * 10 = 10 	끝 로우|  10 - 9 = 1 첫 로우            | 	첫로우 1 끝로우 = 10 	
		 * 		현재 (2 페이지) * 10 = 20	끝 로우|  20 - 9 = 11 첫 로우           | 	첫로우 11 끝 로우 = 20
		 * 		현재 (3 페이지) * 10 = 30	끝 로우|  30 - 9 = 21 첫 로우           |	첫로우 21 끝 로우 = 30
		 * 
		 * 마지막 페이지 = 현재 + (5 - 1) / 5* 5
		 * 
		 * 	ex) 
		 * 		현재 (1 + 4 /5) * 5 = 5
		 * 		현재 (2 + 4 / 5)  * 5 = 5
		 * 	
		 * 		현재 (6+4 / 5) * 5 = 10
		 * 
		 * 
		 * 
		 * 현재페이지 = 마지막페이지 - (blockSize - 1);
		 * ex)
		 * 	5 - 4 = 1
		 * 	10 - 4 = 6
		 * 		
		 */
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getScreenSize() {
		return screenSize;
	}

	public void setScreenSize(int screenSize) {
		this.screenSize = screenSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();
		
		// 부트스트랙을 이용하던 여러 css요소를 이용해서 페이징 UI 구현하는 곳
		html.append("<ul class='pagination pagination-xs'>");
		if(startPage > 1) {
			html.append("<li class='page-item page-indicator'>"
					+ "<a href='' class='page-link' data-page='"
					+(startPage - blockSize)+"'><i class='la la-angle-left'></i></a></li>");
		}
		
		for(int i = startPage; i<= (endPage < totalPage ? endPage : totalPage); i++) {
			if(i == currentPage) {
				html.append("<li class='page-item active'><span class='page-link'>"
							+ i + "</span></li>");
			}else {
				html.append("<li class='page-item'><a href='' class='page-link' data-page='"
						+ i +"'>" + i +"</a></li>");
			}
		}
		
		if(endPage < totalPage) {
			html.append("<li class='page-item'><a href='' class='page-link' data-page='"
					+ (endPage +1) + "'><i class='la la-angle-right'></i></a></li>");
		}
		
		html.append("</ul>");
		return html.toString();
	}
	
}












