package com.itkey.sam.board.dto;

import java.util.Date;

public class UserDTO {
	
	private int boardWriterIdx			= 0;
	private int fileIdx					= 0;
	
	
	private String boardWriter			= null;
	private String boardWriterPw		= null;
	private String boardWriterName 		= null;
	private String boardWriterPhone		= null;
	private String boardWriterEmail		= null;
	private Date BoardWriterJoinDate	= null;
	private String salt					= null;
	private String sessionId 			= null;
	private String delYn				= null;
	
	


	public String getBoardWriterName() {
		return boardWriterName;
	}
	public void setBoardWriterName(String boardWriterName) {
		this.boardWriterName = boardWriterName;
	}
	public int getBoardWriterIdx() {
		return boardWriterIdx;
	}
	public void setBoardWriterIdx(int boardWriterIdx) {
		this.boardWriterIdx = boardWriterIdx;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardWriterPw() {
		return boardWriterPw;
	}
	public void setBoardWriterPw(String boardWriterPw) {
		this.boardWriterPw = boardWriterPw;
	}
	public String getBoardWriterPhone() {
		return boardWriterPhone;
	}
	public void setBoardWriterPhone(String boardWriterPhone) {
		this.boardWriterPhone = boardWriterPhone;
	}
	public String getBoardWriterEmail() {
		return boardWriterEmail;
	}
	public void setBoardWriterEmail(String boardWriterEmail) {
		this.boardWriterEmail = boardWriterEmail;
	}
	public int getFileIdx() {
		return fileIdx;
	}
	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}
	public Date getBoardWriterJoinDate() {
		return BoardWriterJoinDate;
	}
	public void setBoardWriterJoinDate(Date boardWriterJoinDate) {
		BoardWriterJoinDate = boardWriterJoinDate;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	
	
	

}
