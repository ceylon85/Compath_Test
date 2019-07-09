package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.news.news;
import com.user.UserLike;

import mybatis.mybatisutil;

@Repository
public class CPNewsDAO {

	public List<news> selectall() {
		SqlSession session = mybatisutil.factory.openSession();

		List<news> all = null;
		try {
			System.out.println("hi");
			all = session.selectList("newsmapper.news_select_all");
			System.out.println("bye");
		} finally {
			session.close();
		}
		return all;
	}

	public news getnewsbynum(news newe) {
		// TODO Auto-generated method stub
		SqlSession session = mybatisutil.factory.openSession();
		news newss = null;

		try {
			newss = ((news) session.selectList("newsmapper.news_search_number", newe).get(0));
		} finally {
			session.close();
		}

		return newss;
	}

	public int mynewslike(UserLike ulike) {
		SqlSession session = mybatisutil.factory.openSession();
		int res = 0;
		try {
			res = session.update("mypageMapper.mynewslike", ulike);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
		return res;
	}

	public List<news> searchtitle(news news) {
		// TODO Auto-generated method stub
		SqlSession session = mybatisutil.factory.openSession();

		List<news> all = null;
		try {

			all = session.selectList("newsmapper.news_search_title", news);

		} finally {
			session.close();
		}
		return all;
	}
}
