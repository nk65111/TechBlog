package com.tech.blog.entities;

public class Category {
    private int cid;
    private String name;
    private String discription;
    
	public Category(int cid, String name, String discription) {
		this.cid = cid;
		this.name = name;
		this.discription = discription;
	}

	public Category() {
		
	}

	public Category(String name, String discription) {
		this.name = name;
		this.discription = discription;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}
	
	
    
    
}
