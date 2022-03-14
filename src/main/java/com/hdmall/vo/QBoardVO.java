package com.hdmall.vo;

import java.sql.Date;

public class QBoardVO {
	private int num;
	private String id;
	private String user_id;
	private String context;
	private String detail;
	private Date ins_dt;
	private String title;
	private String ans_yn;
	
	public QBoardVO() {
		
	}

	public QBoardVO(int num,String id, String user_id, String context, String detail, Date ins_dt, String title,
			String ans_yn) {
		super();
		this.num =num;
		this.id = id;
		this.user_id = user_id;
		this.context = context;
		this.detail = detail;
		this.ins_dt = ins_dt;
		this.title = title;
		this.ans_yn = ans_yn;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getAns_yn() {
		return ans_yn;
	}

	public void setAns_yn(String ans_yn) {
		this.ans_yn = ans_yn;
	}
}