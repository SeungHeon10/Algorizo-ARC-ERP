package co.algorizo.erp.chat;

import java.util.List;

public interface ChatService {
    List<ChatMessageDTO> getMessagesByRoomId(String room_id);
    List<ChatMessageDTO> getChatRoomList();
    void saveMessage(ChatMessageDTO message);
    String getChatRoomPassword(String room_id);
}
