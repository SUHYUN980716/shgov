package org.shgov.domain;

public class MappingFileBoard {
	
	private String fileNum;
	private String boardNum;
	public MappingFileBoard(String fileNum, String boardNum) {
		super();
		this.fileNum = fileNum;
		this.boardNum = boardNum;
	}
	public MappingFileBoard() {
		super();
	}
	public String getFileNum() {
		return fileNum;
	}
	public void setFileNum(String fileNum) {
		this.fileNum = fileNum;
	}
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	@Override
	public String toString() {
		return "MappingFileBoard [fileNum=" + fileNum + ", boardNum=" + boardNum + "]";
	}
	

}
