package user.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import write.model.Write;

@Component
public class UserDao {
	
	private String namespace = "user.model.User";
	
	@Autowired
	SqlSessionTemplate sst;

	public int signup(User user) {
		// TODO Auto-generated method stub
		int cnt = sst.insert(namespace + ".signup", user);
		return cnt;
	}


	public User loginThis(User user) {
		// TODO Auto-generated method stub
		User login = sst.selectOne(namespace + ".loginThis",user);
		return login;
	}


	public void updateName(User mm) {
		// TODO Auto-generated method stub
		sst.update(namespace + ".updateName", mm);
		
	}


	public void updateEmail(User mm) {
		// TODO Auto-generated method stub
		sst.update(namespace + ".updateEmail", mm);
		
	}


	public int getMaxNum() {
		// TODO Auto-generated method stub
		int cnt = sst.selectOne(namespace + ".getMaxNum");
		return cnt;
	}


	public User selectUser(String m_num) {
		// TODO Auto-generated method stub
		User member = sst.selectOne(namespace+".selectUser",m_num);
		return member;
	}


	public List<User> searchUser(String keyword) {
		// TODO Auto-generated method stub
		List<User> uu = sst.selectList(namespace+".searchUser",keyword);
		return uu;
	}


	


	
	
	
}
