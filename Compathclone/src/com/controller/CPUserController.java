package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.service.CPUserService;
/*import com.test.TestVO;*/
import com.user.UserEntity;


@Controller
public class CPUserController {

	@Autowired
	private CPUserService cpus;
	/*
	  <select id="User_view" resultType="com.user.UserEntity">
		select * from USER_INFO
	</select>o
	
	<insert id="User_Insert">
		insert into USER_INFO
		(ID,PW,gender,Email,Email_Accept,birth,Address,Final_Education,Career_Duration)
		values(#{id},#{pw},#{gender},#{email},#{email_accpet},#{birth},#{address},#{final_education},#{career_duration})
	</insert>o

	<delete id="User_Delete">
		delete from USER_INFO where id = #{id}
	</delete>o

	<update id="User_Update">
		update USER_INFO set pw = #{pw} where id = #{id}
	</update>o

	<select id="User_Login" resultType="com.user.UserEntity">
		select * from User_info where id = #{id} and pw = #{pw}
	</select>o

	<select id="User_Search" resultType="com.user.UserEntity">
		select pw from User_info where id = #{id} and email = #{email}
	</select>o

	<update id="User_Info_Update">
		update USER_INFO set gender=${gender}, email=#{email}, email_accpet=#{email_accpet}, birth=#{birth}, address =#{address},
		final_education = #{final_education}, career_duration=#{career_duration} where id = #{id} and pw=#{pw}
	</update>o
	
	<select id="User_ID_search" resultType="com.user.UserEntity">
		select * from USER_INFO where id = #{id}
	</select> o
	 */
	@RequestMapping("/login.do")
	public ModelAndView cp_login(@RequestParam(name="id") String id, 
			@RequestParam(name="pw") String pw,HttpSession session) {
		UserEntity ue = cpus.cp_login(id, pw);
		session.setAttribute("userinfo", ue);
		ModelAndView mav = new ModelAndView("view/search/search_main");
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView cp_logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return new ModelAndView("view/search/search_main");
	}
	
	
	//**********************************************asd
	
	
	@ResponseBody
	@RequestMapping("/usersearch.do")
	public String cp_usersearch(@RequestParam(name="id") String id,
			@RequestParam(name="email") String email) {
		UserEntity res = cpus.cp_usersearch(id,email);
		return res.getPw();
	}
	// ajax 요청을 받아 id로 유저를 찾아내는 컨트롤러 nullpointer를 캐치해서 변수를 전달
	@ResponseBody
	@RequestMapping("/usercheck.do")
	public String cp_usercheck(@RequestParam(name="id") String id) {
		//System.out.println("오긴 함?");
		String uid = null;
		try {
			UserEntity res = cpus.cp_userdcheck(id);
			uid = res.getId();
		}catch(NullPointerException n) {
			return "no user";
		}
		return uid;
		
	}
	
	//**********************************************asd
	
	// ajax 요청을 받아 email로 유저를 찾아내는 컨트롤러 nullpointer를 캐치해서 변수를 전달
	// email 단일변수로 유저를 찾는 쿼리 하나를 mapper에 추가했습니다
	@ResponseBody
	@RequestMapping("/useridsearch.do")
	public String cp_useridsearch(@RequestParam(name="email") String email) {
		String uid = null;
		try {
		UserEntity ue = cpus.cp_useridsearch(email);
		uid = ue.getId();
		}catch(NullPointerException n) {
			return "no user";
		}
		return uid;
	}
	
	//**********************************************asd
	
	
	@RequestMapping("/userview.do")
	public ModelAndView cp_alluserview() {
		List<UserEntity> uel = cpus.cp_alluserview();
		ModelAndView mav = new ModelAndView("view/user/selectallres");
		mav.addObject("userinfolist", uel);
		return mav;
	}
	
	//**********************************************asdasd
	
	
	@RequestMapping("/userinsert.do")
	public ModelAndView cp_userinsert(@ModelAttribute UserEntity u) {
		System.out.println(u);
		int res = cpus.cp_userinsert(u);
		ModelAndView mav = new ModelAndView("view/search/search_main");
		mav.addObject("userinsertres", res);
		return mav;
	}
	
	//**********************************************asd
	
	
	@RequestMapping("/userdelete.do")
	public ModelAndView cp_userdelete(@RequestParam(name="id") String id) {
		int res = cpus.cp_userdelete(id);
		ModelAndView mav = new ModelAndView("view/search/search_main");
		mav.addObject("res", res);
		return mav;
	}
	
	//**********************************************
	
	
	@RequestMapping("/userupdate.do")
	public ModelAndView cp_userupdate(@RequestParam(name="id") String id, 
			@RequestParam(name="pw") String pw) {
		int res = cpus.cp_userupdate(id, pw);
		ModelAndView mav = new ModelAndView("view/user/updatepwres");
		mav.addObject("res", res );
		return mav;
	}
	
	//**********************************************
	
	
	@RequestMapping("/userinfoupdate.do")
	public ModelAndView cp_userinfoupdate(@ModelAttribute UserEntity ue) {
		System.out.println(ue);
		int res = cpus.cp_userinfoupdate(ue);
		ModelAndView mav = new ModelAndView("view/user/updateinfores");
		mav.addObject("res", res);
		return mav;
	}
	/*@RequestMapping("/test.do")
	public ModelAndView sampletest(@ModelAttribute TestVO tv) {
		System.out.println(111);
		ModelAndView mav =  new ModelAndView("testres");
		int res = cpus.sampletest(tv);
		mav.addObject("res", res);
		return mav;
	}*/
	@RequestMapping("/user_register.do")
	public ModelAndView gosignin() {
		ModelAndView mav =  new ModelAndView("view/user/user_register");
		return mav;
	}
	@RequestMapping("/gologin.do")
	public ModelAndView gologin() {
		ModelAndView mav =  new ModelAndView("view/user/login");
		return mav;
	}
	@RequestMapping("/gouserdelete.do")
	public ModelAndView godelete() {
		ModelAndView mav =  new ModelAndView("view/user/userdeletetest");
		return mav;
	}
	@RequestMapping("/gouserupdate.do")
	public ModelAndView goupdate() {
		ModelAndView mav =  new ModelAndView("view/user/updatepwtest");
		return mav;
	}
	@RequestMapping("/gouserinfoupdate.do")
	public ModelAndView goinfoupdate() {
		ModelAndView mav =  new ModelAndView("view/user/updateinfotest");
		return mav;
	}
	@RequestMapping("/user_search.do")
	public ModelAndView gosearch() {
		ModelAndView mav =  new ModelAndView("view/user/user_find");
		return mav;
	}
	@RequestMapping("/user_idsearch.do")
	public ModelAndView goidsearch() {
		ModelAndView mav =  new ModelAndView("view/user/user_find");
		return mav;
	}
	@RequestMapping("/user_find.do")
	public ModelAndView gofind() {
		ModelAndView mav =  new ModelAndView("view/user/user_find");
		return mav;
	}
	@RequestMapping("/goajaxtest.do")
	public ModelAndView goajaxtest() {
		ModelAndView mav =  new ModelAndView("view/test/test");
		return mav;
	}
	
	
}
