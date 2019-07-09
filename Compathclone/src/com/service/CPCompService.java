package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CPCompDAO;
import com.user.UserLike;
import com.comp.CompanyEntity;
import com.comp.recruit.RecruitEntity;
import com.comp.recruit.RecruitInfoAll;


@Service("CPCompService")
public class CPCompService {

   @Autowired
   private CPCompDAO compdao;

   // 1.comp_detail.jsp에 기업의 title, adr, ceo_nm, phn_no, hm_url 등을 뿌림
   public List<CompanyEntity> compinfo(String crp_nm_i) {
      CompanyEntity ce = new CompanyEntity();
      ce.setCrp_nm_i(crp_nm_i);
      
      return compdao.compinfo(ce);
   }

   // 2.기업의 관련 채용공고를 뿌려준다. crp_nm = coClcdNm
   public List<RecruitEntity> comprecruit(String crp_nm_i) {
      RecruitInfoAll nm = new RecruitInfoAll();
      nm.setEmpBusiNm(crp_nm_i);
      return compdao.comprecruit(nm);
   }

   // 3. search 버튼의 crp_nm 파람을 받아서 해당 기업의 객체들을 불러올거임.
   public List<CompanyEntity> complist() {
      return compdao.complist();
   }

   public int mycomplike(String company_number, String id) {
      UserLike ulike = new UserLike();
      ulike.setCompany_number(company_number);
      ulike.setId(id);
      return compdao.mycomplike(ulike);
   }

   public List<CompanyEntity> compsearchlist(String crp_nm_i) {
      // TODO Auto-generated method stub
      CompanyEntity ce = new CompanyEntity();
      ce.setCrp_nm_i(crp_nm_i);
      
      return compdao.compsearchlist(ce);
   }

   //재무제표
   /*public List<CompanyEntity> finstate(String crp_nm_i) {
      
      CompanyEntity ce = new CompanyEntity();
      ce.setCrp_nm_i(crp_nm_i);
      return compdao.finstate(crp_nm_i);
   }*/
   
    
}
