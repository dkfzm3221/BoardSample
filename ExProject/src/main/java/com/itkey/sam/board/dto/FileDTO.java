package com.itkey.sam.board.dto;

public class FileDTO {
	
	private int fileIdx					= 0;
	
	private String fileOriginalName		= null;
	private String fileChangeName		= null;
	private String filePath				= null;
	
	
	
	
	public int getFileIdx() {
		return fileIdx;
	}
	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}
	public String getFileChangeName() {
		return fileChangeName;
	}
	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
