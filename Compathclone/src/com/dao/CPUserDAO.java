package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import org.springframework.stereotype.Repository;

/*import com.test.TestVO;*/
import com.user.UserEntity;

import mybatis.mybatisutil;


@Repository
public class CPUserDAO {

   /*static SqlSessionFactory factory;
   static {
      String ressource = "mybatis/mybatis-config.xml";
      InputStream inputstream;
      try {
         inputstream = Resources.getResourceAsStream(ressource);
         factory = new SqlSessionFactoryBuilder().build(inputstream);
      } catch (IOException e) {
         e.printStackTrace();
      }
   }*/
   
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
   
   public UserEntity cp_login(UserEntity ue) {
      // TODO Auto-generated method stub
      SqlSession session = mybatisutil.factory.openSession();
      UserEntity all = null;
      try {
         all = session.selectOne("mapper.User_Login",ue);
      } catch (Exception e) {
         System.out.println("로그인 실패");
         e.printStackTrace();
      } finally {
         session.close();
      }
      return all;
      
   }

   public UserEntity cp_usersearch(UserEntity ue) {
      // TODO Auto-generated method stub
      SqlSession session = mybatisutil.factory.openSession();
      UserEntity finduser = null;
      try {
    	  finduser = session.selectOne("mapper.User_Search",ue);
      } catch (Exception e) {
         System.out.println("n");
         e.printStackTrace();
      } finally {
         session.close();
      }
      return finduser;
   }

   public UserEntity cp_useridsearch(UserEntity ue) {
      // TODO Auto-generated method stub
      SqlSession session = mybatisutil.factory.openSession();
      UserEntity all = null;
      try {
         all = session.selectOne("mapper.User_EMAIL_search",ue);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         session.close();
      }
      return all;
   }

   public List<UserEntity> cp_alluserview() {
      // TODO Auto-generated method stub
      SqlSession session = mybatisutil.factory.openSession();
      List<UserEntity> ulist = null;
      try {
         ulist = session.selectList("mapper.User_view");
      } catch (Exception e) {
         System.out.println("nn");
         e.printStackTrace();
      } finally {
         session.close();
      }
      return ulist;
   }

   public int cp_userinsert(UserEntity u) {
      // TODO Auto-generated method stub
      SqlSession session = mybatisutil.factory.openSession();
      System.out.println(u);
      int res = 0;
      try {
         res = session.insert("mapper.User_Insert", u);//안되면 get으로 
         if (res>0) {
            session.commit();
            System.out.println("가입");
         }
      } catch (Exception e) {
         System.out.println("n");
         e.printStackTrace();
      } finally {
         session.close();
      }
      System.out.println(res);
      return res;
   }

   public int cp_userdelete(UserEntity ue) {
      // TODO Auto-generated method stub
      SqlSession session = mybatisutil.factory.openSession();
      int res = 0;
      try {
         res = session.delete("mapper.User_Delete", ue);
         if (res>0) {
            session.commit();
         }
      } catch (Exception e) {
         System.out.println("n");
         e.printStackTrace();
      } finally {
         session.close();
      }
      return res;
   }

   public int cp_userupdate(UserEntity ue) {
      // TODO Auto-generated method stub
      SqlSession session = mybatisutil.factory.openSession();
      int res = 0;
      try {
         res = session.update("mapper.User_Update", ue);
         if (res>0) {
            session.commit();
         }
      } catch (Exception e) {
         System.out.println("n");
         e.printStackTrace();
      } finally {
         session.close();
      }
      return res;
   }

   public int cp_userinfoupdate(UserEntity ue) {
      // TODO Auto-generated method stub
      SqlSession session = mybatisutil.factory.openSession();
      int res = 0;
      try {
         res = session.update("mapper.User_Info_Update", ue);// 안되면 getter호출
         if (res>0) {
            session.commit();
         }
      } catch (Exception e) {
         System.out.println("n");
         e.printStackTrace();
      } finally {
         session.close();
      }
      return res;
   }

public UserEntity cp_usercheck(UserEntity ue) {
	// TODO Auto-generated method stub
	 SqlSession session = mybatisutil.factory.openSession();
     UserEntity all = null;
     try {
        all = session.selectOne("mapper.User_ID_search",ue);
     } catch (Exception e) {
        e.printStackTrace();
     } finally {
        session.close();
     }
     return all;
}

   /*public int sampletest(TestVO tv) {
      // TODO Auto-generated method stub
      SqlSession session = factory.openSession();
      int res = 0;
      try {
         res = session.insert("mapper.testsample", tv);//안되면 get으로 
         if (res>0) {
            session.commit();
         }
      } catch (Exception e) {
         System.out.println("n");
         e.printStackTrace();
      } finally {
         session.close();
      }
      return res;
   }*/

}