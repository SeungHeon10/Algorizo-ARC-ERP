package co.algorizo.erp.chat;

import java.util.List;

public interface ChatMessageDAO {
    List<ChatMessageDTO> getMessagesByRoomId(String room_id);
    int insertMessage(ChatMessageDTO message);
    List<ChatMessageDTO> getChatRoomList();
    String getChatRoomPassword(String room_id);

}
