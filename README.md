
# Algorizo 팀 프로젝트 - ARC ERP
Spring Framework 기반의 ERP 프로젝트입니다.

ARC ERP는 기업의 다양한 업무 프로세스를 효율적으로 관리할 수 있도록 설계된 ERP 시스템입니다.
여러 부서를 하나의 시스템으로 관리함으로써 업무를 효율적으로 수행할 수 있습니다.

---

## ⚙️ 개발 환경 (Technical Environment)

| 구분 | 사용 기술 |
|------|------------|
| **언어** | Java (JDK 11), HTML/CSS, JavaScript |
| **서버** | Apache Tomcat 9.0 |
| **프레임워크** | Spring Framework (Maven), MyBatis 3.5.6, Bootstrap |
| **데이터베이스** | MySQL 8.0.33 |
| **템플릿** | JSP, JSTL |
| **라이브러리** | Chart.js, FullCalendar, DataTables |

---

## 🌐 시스템 구조 (System Architecture)

![시스템 구조](https://github.com/user-attachments/assets/c59e192f-6441-4cbf-bb1b-85ddc0889eeb)

---

## 📦 프로젝트 구조 (Project Structure)

```plaintext
📦 src  
┣ 📂 main  
┃ ┣ 📂 java/com/board/notice  
┃ ┃ ┣ 📂 aop              # 공통 로깅 관리 (LoggingAspect) 
┃ ┃ ┣ 📂 config           # Spring / JPA / Security / AWS 설정  
┃ ┃ ┣ 📂 controller       # 페이지 및 REST API 컨트롤러  
┃ ┃ ┣ 📂 dto              # Request / Response DTO  
┃ ┃ ┣ 📂 entity           # JPA 엔티티 클래스  
┃ ┃ ┣ 📂 enums            # Enum 타입 (Role)
┃ ┃ ┣ 📂 exception        # 전역 예외 처리  
┃ ┃ ┣ 📂 repository       # JPA Repository 인터페이스  
┃ ┃ ┣ 📂 security  
┃ ┃ ┃ ┣ 📂 jwt           # JWT 토큰 관리 (JwtUtil, JwtAuthFilter)  
┃ ┃ ┃ ┗ 📂 oauth2        # OAuth2 로그인
┃ ┃ ┗ 📂 service          # 비즈니스 로직 (Service & Impl)  
┃ ┣ 📂 resources  
┃ ┃ ┣ 📂 static           # JS / CSS / HTML 
┃ ┃ ┣ 📂 templates        # Thymeleaf 템플릿 (auth, board, user 등)  
┃ ┃ ┗ 📜 application.yml  # 환경 설정 파일  
┗ 📂 test                 # 단위 테스트 코드
```

---

## 🖥️ 주요 화면 (Main Screens)

### 로그인 및 회원가입

![로그인 및 회원가입](https://github.com/user-attachments/assets/7351d8eb-09c0-481d-9bd1-a218da6a9693)

### 사원 관리

![게시글 목록](https://github.com/user-attachments/assets/f73d7ab1-ed59-4452-be35-aae0099719da)

### 품목 관리

![게시글 작성](https://github.com/user-attachments/assets/c3bdaa86-5f04-44de-ad8d-5cc91447081c)

### 공급업체 관리

![게시글 상세1](https://github.com/user-attachments/assets/a67816d0-3a9b-47dc-b10a-a439abd46485)
![게시글 상세2](https://github.com/user-attachments/assets/e15d540e-d6c6-4ea9-9c87-80efd8e9db9c)

### 조달계획 관리

![게시글 수정](https://github.com/user-attachments/assets/d89c826e-3202-442b-bf00-ffe019e62f72)

### 계약 및 발주

![회원정보](https://github.com/user-attachments/assets/aefdc776-f660-46b7-b9e7-d4bad39b4a2c)

### 입/출고 관리

![회원정보](https://github.com/user-attachments/assets/aefdc776-f660-46b7-b9e7-d4bad39b4a2c)

### 입/출고 검수

![회원정보](https://github.com/user-attachments/assets/aefdc776-f660-46b7-b9e7-d4bad39b4a2c)

### 입/출고 거래명세서

![회원정보](https://github.com/user-attachments/assets/aefdc776-f660-46b7-b9e7-d4bad39b4a2c)

---

## 🧭 향후 개선 방향 (Future Improvements)

- JWT를 일관성있게 적용할 수 있도록 React/Vue기반의 프론트엔드 SPA 리팩토링
- Docker 기반 컨테이너 배포 환경 구축
- 백엔드/프론트엔드 코드 구조 개선을 통한 유지보수성 향상 일관성 확보
- 다양한 예외 상황에 대한 처리 로직 보강으로 안정성 강화

---

