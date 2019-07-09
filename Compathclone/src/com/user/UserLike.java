package com.user;

public class UserLike {
	private String id;
	private String news_number;
	private String news_check;
	private String company_number;
	private String company_check;
	private String recruit_number;
	private String recruit_check;
	private int sbook_number;
	private String sbook_check;

	public UserLike() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserLike(String id, String news_number, String news_check, String company_number, String company_check,
			String recruit_number, String recruit_check, int sbook_number, String sbook_check) {
		super();
		this.id = id;
		this.news_number = news_number;
		this.news_check = news_check;
		this.company_number = company_number;
		this.company_check = company_check;
		this.recruit_number = recruit_number;
		this.recruit_check = recruit_check;
		this.sbook_number = sbook_number;
		this.sbook_check = sbook_check;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNews_number() {
		return news_number;
	}

	public void setNews_number(String news_number) {
		this.news_number = news_number;
	}

	public String getNews_check() {
		return news_check;
	}

	public void setNews_check(String news_check) {
		this.news_check = news_check;
	}

	public String getCompany_number() {
		return company_number;
	}

	public void setCompany_number(String company_number) {
		this.company_number = company_number;
	}

	public String getCompany_check() {
		return company_check;
	}

	public void setCompany_check(String company_check) {
		this.company_check = company_check;
	}

	public String getRecruit_number() {
		return recruit_number;
	}

	public void setRecruit_number(String recruit_number) {
		this.recruit_number = recruit_number;
	}

	public String getRecruit_check() {
		return recruit_check;
	}

	public void setRecruit_check(String recruit_check) {
		this.recruit_check = recruit_check;
	}

	public int getSbook_number() {
		return sbook_number;
	}

	public void setSbook_number(int sbook_number2) {
		this.sbook_number = sbook_number2;
	}

	public String getSbook_check() {
		return sbook_check;
	}

	public void setSbook_check(String sbook_check) {
		this.sbook_check = sbook_check;
	}

}
