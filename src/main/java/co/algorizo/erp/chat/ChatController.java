package co.algorizo.erp.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/chat")
public class ChatController {
    @Autowired
    ChatService chatService;
    @Autowired
    PasswordEncoder passwordEncoder;

    // 채팅방 목록
    @GetMapping("/rooms")
    public String rooms(Model model) {
        List<ChatMessageDTO> chatRooms = chatService.getChatRoomList();
        model.addAttribute("chatRooms", chatRooms);

        return "chat/chatRoomList";
    }

    // 채팅방 생성 / 입장
    @GetMapping("/newChat")
    public String newChat() {
        return "chat/newChat";
    }

    // 채팅방 생성 처리
    @PostMapping("/newChat")
    public String createNewChat(@RequestParam String room_id,
                                @RequestParam String room_password,
                                RedirectAttributes rttr) { // Model 대신 RedirectAttributes 사용
        String existingPassword = chatService.getChatRoomPassword(room_id);
        if(existingPassword != null) {
            rttr.addFlashAttribute("error", "이미 존재하는 방입니다.");
            return "redirect:/chat/newChat";
        }

        // 첫 메시지를 보내 암호화된 비밀번호를 DB에 저장
        ChatMessageDTO firstMessage = new ChatMessageDTO();
        firstMessage.setRoom_id(room_id.trim());
        firstMessage.setRoom_password(room_password.trim());
        firstMessage.setSender_id("system");
        firstMessage.setSender_name("System");
        firstMessage.setMessage_content("채팅방이 생성되었습니다.");
        chatService.saveMessage(firstMessage);

        // 성공 시 /room 경로로 리다이렉트
        rttr.addAttribute("room_id", room_id.trim());
        rttr.addAttribute("room_password", room_password.trim());
        return "redirect:/chat/room";
    }

    // 채팅방 입장을 위한 비밀번호 입력 (기존과 동일)
    @GetMapping("/enter")
    public String enterRoomForm(@RequestParam String room_id, Model model) {
        model.addAttribute("room_id", room_id);
        return "chat/chatPassword";
    }

    // 비밀번호 확인 및 채팅방 입장 처리
    @PostMapping("/enter")
    public String processEnterRoom(@RequestParam String room_id,
                                   @RequestParam String room_password,
                                   RedirectAttributes rttr) { // Model 제거
        String storedHashedPassword = chatService.getChatRoomPassword(room_id.trim());

        if (storedHashedPassword != null && passwordEncoder.matches(room_password.trim(), storedHashedPassword)) {
            // 성공 시 /room 경로로 리다이렉트
            rttr.addAttribute("room_id", room_id.trim());
            rttr.addAttribute("room_password", room_password.trim());
            return "redirect:/chat/room";
        } else {
            rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
            rttr.addAttribute("room_id", room_id);
            return "redirect:/chat/enter";
        }
    }

    @GetMapping("/room")
    public String showChatRoom(@RequestParam String room_id,
                               @RequestParam String room_password,
                               Model model) {
        model.addAttribute("room_id", room_id);
        model.addAttribute("room_password", room_password);
        return "chat/chatRoom";
    }

    // 과거 메시지 조회 (기존과 동일)
    @GetMapping("/messages")
    @ResponseBody
    public List<ChatMessageDTO> getMessages(@RequestParam("room_id") String roomId) {
        return chatService.getMessagesByRoomId(roomId);
    }
}
