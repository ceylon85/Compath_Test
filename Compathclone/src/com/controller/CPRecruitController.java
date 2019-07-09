package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.comp.CompanyEntity;
import com.comp.recruit.RecruitEntity;
import com.comp.recruit.RecruitInfoAll;
import com.service.CPRecruitService;

@Controller
public class CPRecruitController {
	@Autowired
	private CPRecruitService recs;

	@RequestMapping("/recruit_all.do")
	public ModelAndView gorecruitall() {
		List<RecruitEntity> recruitlist = recs.recruitall();
		
		return new ModelAndView("view/comp/recruit_all" ,"recruitlist" ,recruitlist );
	}

	@RequestMapping("recruit_search.do")
	public ModelAndView recruitlist(@RequestParam("empBusiNm") String empBusiNm) {
		List<RecruitEntity> recruitlist = recs.recruitlist(empBusiNm);
		return new ModelAndView("view/comp/recruit_all", "recruitlist", recruitlist);
	}

	@RequestMapping("recruit_detail.do")
	public ModelAndView recruitdetail(@RequestParam("empSeqno") String empSeqno) {
		List<RecruitEntity> recruitdetail = recs.recruitdetail(empSeqno);
		return new ModelAndView("view/comp/recruit_detail", "recruit_detail", recruitdetail);
	}
//	@RequestMapping("/recruit_detail.do")
//	public ModelAndView gorecruitdetail(@RequestParam("empSeqno") String empSeqno) {
//		ModelAndView mav = new ModelAndView("/recruit_detail");
//		List<RecruitInfoAll> all = (List<RecruitInfoAll>) recs.select(empSeqno);
//		return new ModelAndView("view/comp/recruit_detail", "all", recs);
//	}
	
	
	
	
	@RequestMapping("/recruit_list.do") 
	public ModelAndView comppagelist(@RequestParam("page") String page, @RequestParam("empBusiNm") String empBusiNm,
			HttpServletRequest req) {
		List<RecruitEntity> recinfo = null;
		

		if (empBusiNm.equals("")) {
			try {
				recinfo = recs.recruitall();
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			try {
				recinfo = recs.recruitlist(empBusiNm);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		int p = (Integer.parseInt(page) - 1) * 40;

		List<RecruitEntity> newreclist = null;

		if (p > recinfo.size()) {
			ModelAndView mv = new ModelAndView("view/comp/recruit_all");
			// System.out.println(6);
			mv.addObject("recruitlist", recs.recruitall());
			mv.addObject("cpage", 1);
			// System.out.println(7);
			return mv;

		}

		if ((recinfo.size() - p) < 40) {
			// System.out.println(8);
			newreclist = recinfo.subList(p, recinfo.size());
			// System.out.println(9);
		} else {

			newreclist = recinfo.subList(p, p + 39);

		}
		ModelAndView mav = new ModelAndView("view/comp/recruit_all");
		int returnpage = Integer.parseInt(page);
		mav.addObject("recruitlist", newreclist);
		mav.addObject("cpage", returnpage);
		return mav;
	}

	@RequestMapping("/recruit_pre.do")
	public ModelAndView newspre(@RequestParam("page") String prepage,@RequestParam("empBusiNm") String empBusiNm, HttpServletRequest req) {
List<RecruitEntity> recinfo = null;
		

		if (empBusiNm.equals("")) {
			try {
				recinfo = recs.recruitall();
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			try {
				recinfo = recs.recruitlist(empBusiNm);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		int p = (Integer.parseInt(prepage) - 1) * 40;

		List<RecruitEntity> newreclist = null;

		if (p > recinfo.size()) {
			ModelAndView mv = new ModelAndView("view/comp/recruit_all");
			// System.out.println(6);
			mv.addObject("recruitlist", recs.recruitall());
			mv.addObject("cpage", 1);
			// System.out.println(7);
			return mv;

		}

		if ((recinfo.size() - p) < 40) {
			// System.out.println(8);
			newreclist = recinfo.subList(p, recinfo.size());
			// System.out.println(9);
		} else {

			newreclist = recinfo.subList(p, p + 39);

		}
		ModelAndView mav = new ModelAndView("view/comp/recruit_all");
		int returnpage = Integer.parseInt(prepage);
		mav.addObject("recruitlist", newreclist);
		mav.addObject("cpage", returnpage);
		return mav;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
