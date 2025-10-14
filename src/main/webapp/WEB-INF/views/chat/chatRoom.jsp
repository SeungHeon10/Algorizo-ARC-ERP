<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="../include/head.jsp"%>
    <style>
        #chat-box {
            display: flex !important;
            flex-direction: column !important;
            width: 100%;
            height: 60vh;
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow-y: scroll;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #f0f0f0;
        }

        #chat-box .message {
            margin-bottom: 10px;
            max-width: 70% !important; /* 너비 강제 */
            display: flex !important;
            flex-direction: column !important;
        }

        #chat-box .my-message {
            align-self: flex-end !important; /* 정렬 강제 */
            align-items: flex-end !important;
        }

        #chat-box .other-message {
            align-self: flex-start !important; /* 정렬 강제 */
            align-items: flex-start !important;
        }

        #chat-box .sender{
            font-size: 0.8em;
            color: #888;
            margin-bottom: 3px;
        }

        #chat-box .content {
            display: inline-block;
            padding: 8px 12px;
            border-radius: 10px;
            text-align: left;
            word-wrap: break-word;
            min-height: auto !important;
        }

        #chat-box .my-message .content {
            background-color: #DCF8C6 !important;
        }

        #chat-box .other-message .content {
            background-color: #FFFFFF !important;
            border: 1px solid #EAEAEA !important;
        }
    </style>
</head>
<body>
<%@include file="../include/left_column.jsp"%>
<div id="main">
    <header class="mb-3">
        <a href="#" class="burger-btn d-block d-xl-none">
            <i class="bi bi-justify fs-3"></i>
        </a>
    </header>

    <div class="page-heading">
        <div class="page-title">
            <div class="row">
                <div class="col-12 col-md-6 order-md-1 order-last">
                    <h3>메신저</h3>
                    <p class="text-subtitle text-muted">실시간으로 메시지를 주고받을 수 있습니다.</p>
                </div>
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${contextPath }/home">Home</a></li>
                            <li class="breadcrumb-item"><a href="${contextPath }/chat/rooms">Chat Rooms</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Chat</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">${room_id}</h4>
                </div>
                <div class="card-body">
                    <div id="chat-container">
                        <h5>Room: <span id="room-display" class="badge bg-light-secondary">${room_id}</span></h5>
                        <div id="chat-box"></div>
                        <div class="input-group">
                            <input type="text" id="message-input" class="form-control" placeholder="메시지를 입력하세요...">
                            <button id="sendBtn" class="btn btn-primary">전송</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <footer>
        <%@ include file="../include/footer.jsp" %>
    </footer>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script type="text/javascript">
    const sessionUserId = "<%= session.getAttribute("m_id") %>";
    const sessionUserName = "<%= session.getAttribute("m_name") %>";
    const sessionUserTeam = "<%= session.getAttribute("team") %>";

    var sessionUserDisplay = "";
    if (sessionUserName && sessionUserTeam) {
        sessionUserDisplay = sessionUserName + "(" + sessionUserTeam + ")";
    } else {
        sessionUserDisplay = sessionUserId;
    }

    let sock;
    const currentRoomId = "${room_id}";
    const currentRoomPassword = "${room_password}";

    $(document).ready(function () {
        if(!currentRoomId) {
            alert("채팅방 정보가 올바르지 않습니다.");
            location.href = "${contextPath}/chat/rooms";
            return;
        }

        if(!sessionUserId || sessionUserId === "null") {
            alert("로그인이 필요합니다.");
            location.href="${contextPath}";
            return;
        }

        connectWebSocket();
        loadPreviousMessages();

        $("#sendBtn").click(sendMessage);

        $("#message-input").on("keypress", function(e) {
            if(e.which == 13) {
                sendMessage();
            }
        });
    });

    function connectWebSocket() {
        sock = new SockJS("<c:url value="/chat"/>");
        sock.onmessage = function(e) {
            try {
                const chatMessage = JSON.parse(e.data);
                if(chatMessage.room_id === currentRoomId) {
                    appendMessage(chatMessage);
                }
            } catch (error) {
                console.error("Failed to parse message:", error);
            }
        };
    }

    function loadPreviousMessages() {
        $.ajax({
            url: "<c:url value='/chat/messages'/>",
            type: "GET",
            data: { room_id: currentRoomId },
            dataType: "json",
            success: function(messages) {
                $("#chat-box").empty();
                messages.forEach(function(message) {
                    appendMessage(message);
                });
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error: ", status, error);
                console.error("Response: ", xhr.responseText);
                alert("과거 메시지를 불러오는 데 실패했습니다. 개발자 콘솔을 확인해주세요.");
            }
        });
    }

    function appendMessage(message) {
        const chatBox = document.getElementById("chat-box");
        if(!chatBox) { return; }

        const messageClass = message.sender_id === sessionUserId ? 'my-message' : 'other-message';
        const displayName = (message.sender_name && message.sender_name !== "()") ? message.sender_name : sessionUserId;

        const messageDiv = document.createElement('div');
        messageDiv.classList.add('message', messageClass);

        const senderDiv = document.createElement('div');
        senderDiv.className = 'sender';
        senderDiv.textContent = displayName;

        const contentDiv = document.createElement('div');
        contentDiv.className = 'content';
        contentDiv.textContent = message.message_content;

        messageDiv.appendChild(senderDiv);
        messageDiv.appendChild(contentDiv);
        chatBox.appendChild(messageDiv);
        chatBox.scrollTop = chatBox.scrollHeight;
    }

    function sendMessage() {
        let msgInput = $("#message-input");
        let msg = msgInput.val();

        if(msg.trim() !== '' && sock && sock.readyState === SockJS.OPEN) {
            let chatMessage = {
                room_id: currentRoomId,
                room_password: currentRoomPassword,
                sender_id: sessionUserId,
                sender_name: sessionUserDisplay,
                message_content: msg
            };

            sock.send(JSON.stringify(chatMessage));
            msgInput.val('');
            msgInput.focus();
        }
    }
</script>
<%@ include file="../include/plugin.jsp" %>
</body>
</html>