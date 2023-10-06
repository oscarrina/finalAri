package com.ari.detail.model;

public class searchVO {

	private int area;
	private String search;
	
	public searchVO() {
		// TODO Auto-generated constructor stub
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public searchVO(int area, String search) {
		super();
		this.area = area;
		this.search = search;
	}
	
	
}
