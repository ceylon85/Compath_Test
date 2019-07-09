package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.news.NewsEntity;
import com.service.CPMypageService;
import com.service.CPSbookService;

import com.user.CPSbookEntity;

@Controller
public class CPSbookController {

	@Autowired
	private CPSbookService sbservice;
	@Autowired
	private CPMypageService mservice;

	//전체리스트 
	@RequestMapping("/scrapbook_all.do")
	public ModelAndView sbook() {
		List<CPSbookEntity> all = sbservice.getAllBull();
		System.out.println(all);
		return new ModelAndView("view/user/scrapbook/scrapbook_all", "all", all);
	}

	//해당 id가 작성한 스크랩북만 확인
	@RequestMapping("/sbook_selectbyid.do")
	public ModelAndView sbook_selectbyid(@RequestParam("id") String id) {
		List<CPSbookEntity> selected = sbservice.selectbyid(id);
		return new ModelAndView("view/user/scrapbook/scrapbook_all", "all", selected);
	}
	
	//새로운 작성할 스크랩북을 임시 스크랩북이라는 타이틀로 만들고, 에디터 페이지로 넘겨준다.
	@RequestMapping("/sbook_create.do")
	public String sbook_create(@RequestParam("id") String id) {
		CPSbookEntity newsb = sbservice.createsb(id);
		return "redirect:sbook_toedit.do?scrapbook_num="+newsb.getScrapbook_num()+"&id="+id;
	}
	
	//내가 수정할 스크랩북을 찾아서 에디터페이지에 넘겨준다 + 스크랩 뉴스 리스트도 보내준다
	@RequestMapping("/sbook_toedit.do")
	public ModelAndView findbysnum(@RequestParam("scrapbook_num") int scrapbook_num, @RequestParam("id") String id) {
		Map <String, Object> sbookmap = new HashMap<>();
		List<NewsEntity> mynewslist = mservice.mynewslist(id);
		CPSbookEntity found = sbservice.findbysnum(scrapbook_num);
		sbookmap.put("mynewslist", mynewslist);
		sbookmap.put("found", found);
		return new ModelAndView("view/user/scrapbook/scrapbook_editor", sbookmap);
	}
	
	//내가 작성한 스크랩북 삭제
	@RequestMapping("/sbook_delete.do")
	public ModelAndView sbook_delete(@RequestParam("scrapbook_num") int scrapbook_num, @RequestParam("id") String id) {
		int res = sbservice.delete(scrapbook_num);
		if (res > 0) {
			return new ModelAndView("view/user/mypage", "myownsblist", sbservice.selectbyid(id));
		} else {
			return new ModelAndView("error", "fail", "흠냐뤼..");
		}
	}

	//스크랩북 update
	@RequestMapping("/sbook_update.do")
	public ModelAndView sbook_update(HttpSession session, @ModelAttribute("toupdate") CPSbookEntity be) {
		int res = sbservice.update(be);
		
		if (res > 0) {
			return new ModelAndView("view/user/mypage");
		} else {
			return new ModelAndView("error", "fail", "흠냐뤼..");
		}
	}
	
	//스크랩북 자세히 보기
	@RequestMapping("/sbook_content.do")
	public ModelAndView sbook_content(@RequestParam("scrapbook_num") int scrapbook_num) {
		CPSbookEntity found = sbservice.findbysnum(scrapbook_num);
		return new ModelAndView("view/user/scrapbook/scrapbook_content", "found", found);
	}
	
	//스크랩북 공유로 set sbook_check =1 한 후 전체 스크랩게시판으로 이동
	@RequestMapping("/sbook_share.do")
	public ModelAndView sbook_share(@RequestParam("scrapbook_num") int scrapbook_num) {
		int res = sbservice.sbook_share(scrapbook_num);
		if(res>0) {
		return new ModelAndView("view/user/scrapbook/scrapbook_all", "all", sbook());
		} else {
			return new ModelAndView("error", "fail", "흠냐뤼..");
		}
		
	}
	
	//관심 스크랩북에 추가
	@RequestMapping("/mysbook_like.do")
	public ModelAndView mysbooklike(@RequestParam("sbook_number") int sbook_number, @RequestParam("id") String id) {
		// check=0으로 셋하는 쿼리 다녀오기
		int res = sbservice.mysbooklike(sbook_number, id);
		if (res > 0) {
			return new ModelAndView("view/user/scrapbook/scrapbook_all","all", sbook());
		} else {
			return new ModelAndView("error", "error", "제거하지 못했습니다");
		}
	}


	
	
	
	
}
