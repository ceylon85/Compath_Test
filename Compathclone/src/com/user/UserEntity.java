package com.user;

public class UserEntity {
	private String id;
	private String pw;
	private String gender;
	private String email;
	private String email_accept;
	private String birth;
	private String address;
	private String final_education;
	private String career_duration;

	public UserEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail_accept() {
		return email_accept;
	}

	public void setEmail_accept(String email_accept) {
		this.email_accept = email_accept;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFinal_education() {
		return final_education;
	}

	public void setFinal_education(String final_education) {
		this.final_education = final_education;
	}

	public String getCareer_duration() {
		return career_duration;
	}

	public void setCareer_duration(String career_duration) {
		this.career_duration = career_duration;
	}

	@Override
	public String toString() {
		return "UserEntity [id=" + id + ", pw=" + pw + ", gender=" + gender + ", email=" + email + ", email_accept="
				+ email_accept + ", birth=" + birth + ", Address=" + address + ", final_education=" + final_education
				+ ", career_duration=" + career_duration + "]";
	}

}
