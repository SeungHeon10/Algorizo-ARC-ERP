package co.algorizo.erp.chat;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ChatMessageDAOImpl implements ChatMessageDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "co.algorizo.erp.chatMapper";

    @Override
    public List<ChatMessageDTO> getMessagesByRoomId(String room_id) {
        return sqlSession.selectList(NAMESPACE + ".getMessagesByRoomId", room_id);
    }

    @Override
    public int insertMessage(ChatMessageDTO message) {
        return sqlSession.insert(NAMESPACE + ".insertMessage", message);
    }


    @Override
    public List<ChatMessageDTO> getChatRoomList() {
        return sqlSession.selectList(NAMESPACE + ".getChatRoomList");
    }

    @Override
    public String getChatRoomPassword(String room_id) {
        return sqlSession.selectOne(NAMESPACE + ".getChatRoomPassword", room_id);
    }
}
