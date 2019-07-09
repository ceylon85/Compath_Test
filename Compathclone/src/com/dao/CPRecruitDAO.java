package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comp.recruit.RecruitEntity;
import com.comp.recruit.RecruitInfoAll;
import com.user.UserLike;

import mybatis.mybatisutil;

@Repository("RecruitDAO")
public class CPRecruitDAO {

	public List<RecruitEntity> select(RecruitEntity rvo) {
		SqlSession session = mybatisutil.factory.openSession(); // 생성하고 닫으면 또 새로 생성해야만 함. 안그러면 executer 닫혔다는 에러 뜬당
		List<RecruitEntity> all = null;
		try {
			all = session.selectList("recruitMapper.all", rvo);
		} finally {
			session.close();
		}
		return all;
	}

	public List<RecruitEntity> recruitdetail(RecruitEntity recruitdetail) {

		SqlSession session = mybatisutil.factory.openSession();
		List<RecruitEntity> recruitdetailinfo = null;
		try {
			recruitdetailinfo = session.selectList("recruitMapper.recruitdetail",recruitdetail);
		} finally {
			session.close();
		}
		return recruitdetailinfo;
	}

	public List<RecruitEntity> recruitlist(RecruitEntity re) {
		SqlSession session = mybatisutil.factory.openSession();
		List<RecruitEntity> recruitlist = null;
		try {
			recruitlist = session.selectList("recruitMapper.recruitlist",re);
		} finally {
			session.close();
		}
		return recruitlist;
	}

	public int myreclike(UserLike ulike) {
		SqlSession session = mybatisutil.factory.openSession();
		int res = 0;
		try {
			res = session.update("mypageMapper.myreclike", ulike);
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

	public List<RecruitEntity> recruitall() {
		// TODO Auto-generated method stub
		SqlSession session = mybatisutil.factory.openSession();
		List<RecruitEntity> recruitlist = null;
		try {
			recruitlist = session.selectList("recruitMapper.recruitall");
		} finally {
			session.close();
		}
		return recruitlist;
	}

}
