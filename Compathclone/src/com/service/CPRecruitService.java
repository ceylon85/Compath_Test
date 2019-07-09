package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CPRecruitDAO;
import com.user.UserLike;
import com.comp.recruit.RecruitEntity;
import com.comp.recruit.RecruitInfoAll;

@Service("RecruitService")
public class CPRecruitService {

	@Autowired
	private CPRecruitDAO recruitDAO;

	public List<RecruitEntity> select(String empSeqno) {
		RecruitEntity rvo = new RecruitEntity();
		rvo.setEmpSeqno(empSeqno);
		return recruitDAO.select(rvo);
	}

	public List<RecruitEntity> recruitdetail(String empSeqno) {
		RecruitEntity recruitdetail = new RecruitEntity();
		recruitdetail.setEmpSeqno(empSeqno);
		return recruitDAO.recruitdetail(recruitdetail);
	}

	public List<RecruitEntity> recruitlist(String empBusiNm) {
		RecruitEntity recruitlist = new RecruitEntity();
		recruitlist.setEmpBusiNm(empBusiNm);
		return recruitDAO.recruitlist(recruitlist);
	}

	public int myreclike(String recruit_number, String id) {
		UserLike ulike = new UserLike();
		ulike.setRecruit_number(recruit_number);
		ulike.setId(id);
		return recruitDAO.myreclike(ulike);
	}

	public List<RecruitEntity> recruitall() {
		// TODO Auto-generated method stub
		return recruitDAO.recruitall();
	}
}
