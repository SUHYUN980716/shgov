package org.shgov.domain;

public class Board extends Paging {
	private String boardNum;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private String boardCreatedAt;
	private int boardType;
	public Board(String boardNum, String boardTitle, String boardContent, String boardWriter, String boardCreatedAt,
			int boardType) {
		super();
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.boardCreatedAt = boardCreatedAt;
		this.boardType = boardType;
	}
	public Board() {
		super();
	}
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardCreatedAt() {
		return boardCreatedAt;
	}
	public void setBoardCreatedAt(String boardCreatedAt) {
		this.boardCreatedAt = boardCreatedAt;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	@Override
	public String toString() {
		return "Board [boardNum=" + boardNum + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardWriter=" + boardWriter + ", boardCreatedAt=" + boardCreatedAt + ", boardType=" + boardType
				+ "]";
	}
	

}
