package com.itkey.sam.board.dto;

import java.util.Date;

public class AdminDTO {
	
	private int adminIdx		= 0;
	
	
	private String adminId		= null;
	private String adminName	= null;
	private String adminPw		= null;
	private Date adminJoinDate	= null;
	
	
	public int getAdminIdx() {
		return adminIdx;
	}
	public void setAdminIdx(int adminIdx) {
		this.adminIdx = adminIdx;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public Date getAdminJoinDate() {
		return adminJoinDate;
	}
	public void setAdminJoinDate(Date adminJoinDate) {
		this.adminJoinDate = adminJoinDate;
	}
	
	
}
