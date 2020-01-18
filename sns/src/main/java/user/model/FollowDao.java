package user.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FollowDao {
	private String namespace = "user.model.Follow";
	
	@Autowired
	SqlSessionTemplate sst;

	public void addFriend(String mnum, String f_theirNum) {
		// TODO Auto-generated method stub
		Follow add = new Follow();
		
		add.setM_num(mnum);
		add.setF_theirNum(f_theirNum);
		
		sst.insert(namespace + ".addFriend",add);
		
	}

	public void deleteFriend(Follow follow) {
		// TODO Auto-generated method stub
		sst.delete(namespace + ".deleteFriend",follow);
		
	}

	public int getMyFollows(String yournum, int mynum) {
		// TODO Auto-generated method stub
		Follow fo = new Follow();
		String num = Integer.toString(mynum);
		fo.setM_num(num);
		fo.setF_theirNum(yournum);
		
		
		
		int ff= sst.selectOne(namespace+".getMyfollows",fo);
		return ff;
	}

	public List<Follow> getAllFollows(int m_num) {
		// TODO Auto-generated method stub
		List<Follow> list = sst.selectList(namespace+".getAllFollows", m_num);
		return list;
	}

	
}
