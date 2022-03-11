package com.hdmall.vo;

public class LikeVO {
	private String user_id;
	private String prod_id;
	private String is_liked;
	
	public LikeVO() {
		
	}

	public LikeVO(String user_id, String prod_id, String is_liked) {
		super();
		this.user_id = user_id;
		this.prod_id = prod_id;
		this.is_liked = is_liked;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProd_id() {
		return prod_id;
	}

	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}

	public String getIs_liked() {
		return is_liked;
	}

	public void setIs_liked(String is_liked) {
		this.is_liked = is_liked;
	}

	
}
