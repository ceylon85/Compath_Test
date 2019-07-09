package com.news;

public class NewsVO {

	private String news_number;
	private String category;
	private String title;
	private String author;
	private String postTime;
	private String chgTime;
	private String contents;

	public NewsVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getNews_number() {
		return news_number;
	}

	public void setNews_number(String news_number) {
		this.news_number = news_number;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getPostTime() {
		return postTime;
	}

	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}

	public String getChgTime() {
		return chgTime;
	}

	public void setChgTime(String chgTime) {
		this.chgTime = chgTime;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

}
