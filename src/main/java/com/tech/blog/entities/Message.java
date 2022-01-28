package com.tech.blog.entities;

public class Message {
   private String message;
   private String type;
   private String cssSelector;
	public Message(String message, String type, String cssSelector) {
		super();
		this.message = message;
		this.type = type;
		this.cssSelector = cssSelector;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCssSelector() {
		return cssSelector;
	}
	public void setCssSelector(String cssSelector) {
		this.cssSelector = cssSelector;
	}
	
   
}
