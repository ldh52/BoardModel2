package com.test.model2board;

import org.apache.naming.java.javaURLContextFactory;

public class Board {
	private int bnum;
	private String title;
	private String author;
	private String contents;
	private java.sql.Date rdate;
	private int hit;
	
	
	
	@Override
	public String toString() {
		return "Board [bnum=" + bnum + ", title=" + title + ", author=" + author + ", contents=" + contents + ", rdate="
				+ rdate + ", hit=" + hit + "]";
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public java.sql.Date getRdate() {
		return rdate;
	}
	public void setRdate(java.sql.Date rdate) {
		this.rdate = rdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
