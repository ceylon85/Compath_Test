package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class mybatisutil {

	public static SqlSessionFactory factory; // 전역으로 줘야 함
	static {
		String resource = "mybatis/mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(inputStream);
			// session 단위로 memory에 올려놓는다. session을 여러개 담고 있는 factory를 building하는 것
			// CRUD 객체를 session 단위로 factory를 메모리에 올려놓는 것임
			// 비어있는 생성자, method 중에 build method 현재는 inputStream단위로 파일처럼 읽어서 string으로 바꾼다음에
			// 사용중
			// 만약 build(reader, environment, props) overload method를 쓴다.
		} catch (IOException e) {
			e.printStackTrace();
		}

	}// static end
}
