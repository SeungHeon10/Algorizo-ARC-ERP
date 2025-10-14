package co.algorizo.erp.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatMessageServiceImpl implements ChatService{
    @Autowired
    private ChatMessageDAO chatMessageDAO;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public List<ChatMessageDTO> getMessagesByRoomId(String room_id) {
        return chatMessageDAO.getMessagesByRoomId(room_id);
    }

    @Override
    public List<ChatMessageDTO> getChatRoomList() {
        return chatMessageDAO.getChatRoomList();
    }

    @Override
    public void saveMessage(ChatMessageDTO message) {
        String existingHashedPassword = chatMessageDAO.getChatRoomPassword(message.getRoom_id());
        String plainPassword = message.getRoom_password();

        if (existingHashedPassword == null) {
            if (plainPassword != null && !plainPassword.isEmpty()) {
                String hashedPassword = passwordEncoder.encode(plainPassword);
                message.setRoom_password(hashedPassword);
            }
        } else {
            message.setRoom_password(existingHashedPassword);
        }

        chatMessageDAO.insertMessage(message);
    }

    @Override
    public String getChatRoomPassword(String room_id) {
        return chatMessageDAO.getChatRoomPassword(room_id);
    }
}
