package message.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MessageDao {
private String namespace = "message.model.Message";
	
	@Autowired
	SqlSessionTemplate sst;

	public List<Message> getChats(int m_num) {
		// TODO Auto-generated method stub
		List<Message> list = sst.selectList(namespace + ".getChats", m_num);
		return list;
	}

	public void insertChat(Message message) {
		// TODO Auto-generated method stub
		sst.insert(namespace + ".insertchat", message);
		
	}
	
}
