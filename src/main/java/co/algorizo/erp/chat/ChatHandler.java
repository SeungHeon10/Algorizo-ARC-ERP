package co.algorizo.erp.chat;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@Component
public class ChatHandler extends TextWebSocketHandler {
    private final ChatService chatService;
    private final ObjectMapper objectMapper = new ObjectMapper();
    private static final List<WebSocketSession> list = new CopyOnWriteArrayList<>();

    @Autowired
    public ChatHandler(ChatService chatService) {
        this.chatService = chatService;
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 클라이언트가 연결되었을 때 호출
        System.out.println("연결되었습니다" + session.getId());
        list.add(session);

    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 클라이언트로부터 메시지를 받았을 때 호출
        String payload = message.getPayload();

        // 받은 JSON 문자열을 DTO 객체로 변환
        ChatMessageDTO chatMessage = objectMapper.readValue(payload, ChatMessageDTO.class);

        // DB에 메시지 저장
        chatService.saveMessage(chatMessage);


        // 연결된 모든 클라이언트에게 메시지 전송
        for(WebSocketSession s : list){
            s.sendMessage(message);
        }

        System.out.println("payload: " + payload);


    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 클라이언트 연결이 끊겼을 때 호출

        list.remove(session);
    }



}
