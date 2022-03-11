package com.hdmall.vo;

import java.sql.Date;

public class PBoardVO {
	private String id;
	private String prod_id;
	private String context;
	private String title;
	private Date ins_dt;
	private int hit;
	
	public PBoardVO() {
		
	}

	public PBoardVO(String id, String prod_id, String context, String title, Date ins_dt, int hit) {
		super();
		this.id = id;
		this.prod_id = prod_id;
		this.context = context;
		this.title = title;
		this.ins_dt = ins_dt;
		this.hit = hit;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProd_id() {
		return prod_id;
	}

	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getIns_dt() {
		return ins_dt;
	}

	public void setIns_dt(Date ins_dt) {
		this.ins_dt = ins_dt;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

}