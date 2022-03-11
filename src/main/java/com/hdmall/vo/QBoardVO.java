package com.hdmall.vo;

import java.sql.Date;

public class QBoardVO {
	private String id;
	private String user_id;
	private String context;
	private String detail;
	private Date ins_dt;
	private String title;
	private Boolean ans_yn;
	
	public QBoardVO() {
		
	}

	public QBoardVO(String id, String user_id, String context, String detail, Date ins_dt, String title,
			Boolean ans_yn) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.context = context;
		this.detail = detail;
		this.ins_dt = ins_dt;
		this.title = title;
		this.ans_yn = ans_yn;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Date getIns_dt() {
		return ins_dt;
	}

	public void setIns_dt(Date ins_dt) {
		this.ins_dt = ins_dt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Boolean getAns_yn() {
		return ans_yn;
	}

	public void setAns_yn(Boolean ans_yn) {
		this.ans_yn = ans_yn;
	}
	
}
