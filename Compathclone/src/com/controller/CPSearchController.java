package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
//http://localhost:8888/Compathclone/search_main.do
@Controller
public class CPSearchController {
	
	@RequestMapping("/search_main.do")
	public ModelAndView gosearchmain() {
		System.out.println(12);
		return new ModelAndView("/view/search/search_main");
	}
	
	
	@RequestMapping("/search.do")
	public String Prn() {
		System.out.println(12);
		return "a.jsp";
	}
}
