package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CPNewsDAO;
import com.news.news;
import com.user.UserLike;

@Service
public class CPNewsService {

	@Autowired
	private CPNewsDAO cpnd;

	public List<news> selectall() {
		// TODO Auto-generated method stub
		return cpnd.selectall();
	}
	public List<news> searchtitle(String title){
		news newss = new news();
		newss.setTitle(title);
		return cpnd.searchtitle(newss);
	}

	public news getnewsbynum(String number) {
		// TODO Auto-generated method stub
		news newss = new news();
		newss.setNews_number(number);

		return cpnd.getnewsbynum(newss);
	}

	public int mynewslike(String news_number, String id) {
		UserLike ulike = new UserLike();
		ulike.setNews_number(news_number);
		ulike.setId(id);
		return cpnd.mynewslike(ulike);
	}
}
