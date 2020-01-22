package write.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StoryDao {
private String namespace = "write.model.Story";
	
	@Autowired
	SqlSessionTemplate sst;
	
	
	public List<Story> getStories(int m_num) {
		// TODO Auto-generated method stub
		List<Story> list = sst.selectList(namespace + ".getStories", m_num);
		return list;
	}

}
