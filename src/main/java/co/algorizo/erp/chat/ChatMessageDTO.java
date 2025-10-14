package co.algorizo.erp.chat;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class ChatMessageDTO {

    private int message_id;
    private String room_id;
    private String sender_id;
    private String message_content;
    private Timestamp sent_at;

    private String sender_name;
    private String room_password;
}
