package org.shgov.domain;

public class File {
	private String fileNum;
	private String fileName;
	private String fileServerName;
	private String filePath;
	public File(String fileNum, String fileName, String fileServerName, String filePath) {
		super();
		this.fileNum = fileNum;
		this.fileName = fileName;
		this.fileServerName = fileServerName;
		this.filePath = filePath;
	}
	public File() {
		super();
	}
	public String getFileNum() {
		return fileNum;
	}
	public void setFileNum(String fileNum) {
		this.fileNum = fileNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileServerName() {
		return fileServerName;
	}
	public void setFileServerName(String fileServerName) {
		this.fileServerName = fileServerName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "File [fileNum=" + fileNum + ", fileName=" + fileName + ", fileServerName=" + fileServerName
				+ ", filePath=" + filePath + "]";
	}

}
