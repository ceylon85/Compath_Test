package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.comp.CompanyEntity;
import com.comp.recruit.RecruitEntity;
import com.comp.recruit.RecruitInfoAll;
import com.user.UserLike;

import mybatis.mybatisutil;

@Repository("CPCompDAO")
public class CPCompDAO {

   public List<CompanyEntity> compinfo(CompanyEntity ce) {
      // 1.comp_detail.jsp에 기업의 title, adr, ceo_nm, phn_no, hm_url 등을 뿌림
      SqlSession session = mybatisutil.factory.openSession();
      List<CompanyEntity> compinfo = null;
      try {
         compinfo = session.selectList("compMapper.compinfo",ce);
      } finally {
         session.close();
      }
      return compinfo;
   }

   // 2.기업의 관련 채용공고를 뿌려준다. crp_nm = coClcdNm
   public List<RecruitEntity> comprecruit(RecruitInfoAll empBusiNm) {

      SqlSession session = mybatisutil.factory.openSession();
      List<RecruitEntity> comprecruit = null;
      try {
         comprecruit = session.selectList("compMapper.comprecruit",empBusiNm);
      } finally {
         session.close();
      }
      return comprecruit;
   }

   public List<CompanyEntity> complist() { // search 버튼의 crp_nm 파람을 받아서 해당 기업의 객체들을 불러올거임.

      SqlSession session = mybatisutil.factory.openSession();
      List<CompanyEntity> complist = null;
      try {
         complist = session.selectList("compMapper.compall");
      } finally {
         session.close();
      }

      return complist;
   }

   public int mycomplike(UserLike ulike) {
      SqlSession session = mybatisutil.factory.openSession();
      int res = 0;
      try {
         res = session.update("mypageMapper.mycomplike", ulike);
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

   public List<CompanyEntity> compsearchlist(CompanyEntity ce) {
      // TODO Auto-generated method stub
      SqlSession session = mybatisutil.factory.openSession();
      List<CompanyEntity> complist = null;
      try {
         complist = session.selectList("compMapper.compinfo",ce);
      } finally {
         session.close();
      }

      return complist;
   }
   //재무제표
/*   public List<CompanyEntity> finstate(String crp_nm_i) {
      
      SqlSession session = mybatisutil.factory.openSession();
      List<CompanyEntity> finstate = null;
      try {
         finstate = session.selectList("compMapper.finstate",crp_nm_i);
      } finally {
         session.close();
      }

      return finstate;
}*/
}
