package write.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class WriteDao {
	private String namespace = "write.model.Write";
	
	@Autowired
	SqlSessionTemplate sst;

	public void insertText(Write write) {
		// TODO Auto-generated method stub
		sst.insert(namespace + ".insertText",write);
		
	}

	public List<Write> selectUserPost(String m_num) {
		// TODO Auto-generated method stub
		List<Write> list = sst.selectList(namespace+".selectPost",m_num);
		return list;
	}

	public List<Write> searchUserPost(String keyword) {
		// TODO Auto-generated method stub
		 List<Write> pp = sst.selectList(namespace+".searchPost",keyword);
		return pp;
	}

	public int getMaxNum() {
		// TODO Auto-generated method stub
		int cnt = sst.selectOne(namespace + ".maxnum");
		return cnt;
	}

	

	
	
	
}
