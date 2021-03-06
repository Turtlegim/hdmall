package com.hdmall.vo;

public class ProductVO {
	private String id;
	private String cate_no;
	private String name;
	private String price;
	private String context;
	private String img;
	private int hitnum;
	private String islike;
	
	public ProductVO() {

	}

	public ProductVO(String id, String cate_no, String name, String price, String context, String img, int hitnum, String islike) {
		super();
		this.id = id;
		this.cate_no = cate_no;
		this.name = name;
		this.price = price;
		this.context = context;
		this.img = img;
		this.hitnum = hitnum;
		this.islike = islike;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCate_no() {
		return cate_no;
	}

	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getHitnum() {
		return hitnum;
	}

	public void setHitnum(int hitnum) {
		this.hitnum = hitnum;
	}	
	public String getIslike() {
		return islike;
	}

	public void setIslike(String islike) {
		this.islike = islike;
	}
}