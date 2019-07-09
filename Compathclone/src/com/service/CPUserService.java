package com.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CPUserDAO;
/*import com.test.TestVO;*/
import com.user.UserEntity;


@Service
public class CPUserService {

	@Autowired
	private CPUserDAO cpud;
	
	public UserEntity cp_login(String id, String pw) {
		// TODO Auto-generated method stub
		UserEntity ue = new UserEntity();
		ue.setId(id);
		ue.setPw(pw);
		return cpud.cp_login(ue);
	}

	

	public UserEntity cp_usersearch(String id,String email) {
		// TODO Auto-generated method stub
		UserEntity ue = new UserEntity();
		ue.setId(id);
		ue.setEmail(email);
		return cpud.cp_usersearch(ue);
	}



	public UserEntity cp_useridsearch(String email) {
		// TODO Auto-generated method stub
		UserEntity ue = new UserEntity();
		ue.setEmail(email);
		return cpud.cp_useridsearch(ue);
	}



	public List<UserEntity> cp_alluserview() {
		// TODO Auto-generated method stub
		return cpud.cp_alluserview();
	}



	public int cp_userinsert(UserEntity u) {
		// TODO Auto-generated method stub
		return cpud.cp_userinsert(u);
	}



	public int cp_userdelete(String id) {
		// TODO Auto-generated method stub
		UserEntity ue = new UserEntity();
		ue.setId(id);
		return cpud.cp_userdelete(ue);
	}



	public int cp_userupdate(String id, String pw) {
		// TODO Auto-generated method stub
		UserEntity ue = new UserEntity();
		ue.setId(id);
		ue.setPw(pw);
		return cpud.cp_userupdate(ue);
	}



	public int cp_userinfoupdate(UserEntity ue) {
		// TODO Auto-generated method stub
		return cpud.cp_userinfoupdate(ue);
	}



	public UserEntity cp_userdcheck(String id) {
		// TODO Auto-generated method stub
		UserEntity ue = new UserEntity();
		ue.setId(id);
		return cpud.cp_usercheck(ue);
	}



	/*public int sampletest(TestVO tv) {
		// TODO Auto-generated method stub
		return cpud.sampletest(tv);
	}*/

}
