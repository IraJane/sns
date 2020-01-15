package write.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LikeDao {
	private String namespace = "write.model.Like";
	
	@Autowired
	SqlSessionTemplate sst;

	public void heartThis(String t_num, String m_num) {
		// TODO Auto-generated method stub
		Like ll = new Like();
		ll.setM_num(m_num);
		ll.setT_num(t_num);
		sst.insert(namespace + ".heartThis",ll);
		
		
		
	}

	public int checkThis(String t_num, String m_num) {
		// TODO Auto-generated method stub
		Like qq = new Like();
		qq.setM_num(m_num);
		qq.setT_num(t_num);
		int cnt = sst.selectOne(namespace+".checkthis",qq);
		return cnt;
	}

	public List<Like> selectLikelists(int m_num) {
		// TODO Auto-generated method stub
		List<Like> likeposts = sst.selectList(namespace + ".selectLikeLists", m_num);
		return likeposts;
	}

	public void dontheartThis(String t_num, String m_num) {
		// TODO Auto-generated method stub
		Like qq = new Like();
		qq.setM_num(m_num);
		qq.setT_num(t_num);
		sst.delete(namespace+".dontheartthis",qq);
		
	}
}
