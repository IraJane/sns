package write.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CategDao {
	private String namespace = "write.model.Categ";
	
	@Autowired
	SqlSessionTemplate sst;

	public Categ getNum(String cc) {
		// TODO Auto-generated method stub
		Categ cnt = sst.selectOne(namespace + ".getNum",cc);
		return cnt;
	}

	public void insertCateg(String cc) {
		// TODO Auto-generated method stub
		sst.insert(namespace + ".insertCateg",cc);
		
	}

	public int getCNum() {
		// TODO Auto-generated method stub
		int cnt = sst.selectOne(namespace+".getCNum");
		return cnt;
	}
}
