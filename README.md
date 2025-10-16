
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

![시스템 구조](https://github.com/user-attachments/assets/955afdd3-91ab-4bcd-b5f4-0a9df90c3579)

---

## 📦 프로젝트 구조 (Project Structure)

```plaintext
📦 src  
┣ 📂 main  
┃ ┣ 📂 java/co/algorizo/erp  
┃ ┃ ┣ 📜 HomeController.java  
┃ ┃ ┣ 📜 ImageServlet.java  
┃ ┃ ┣ 📂 board             # 공지사항 관리
┃ ┃ ┣ 📂 calendar          # 캘린 기능  
┃ ┃ ┣ 📂 chat              # 실시간 채팅 기능
┃ ┃ ┣ 📂 company           # 공급업체 관리  
┃ ┃ ┣ 📂 config            # Spring 설정
┃ ┃ ┣ 📂 contract          # 계약 관리 
┃ ┃ ┣ 📂 dept              # 부서 관리
┃ ┃ ┣ 📂 inbound           # 입고 관리  
┃ ┃ ┣ 📂 inbound_receipt   # 입고 거래명세서 관리 
┃ ┃ ┣ 📂 inspection        # 입고 검수 관리
┃ ┃ ┣ 📂 interceptor       # 로그인 인터셉터  
┃ ┃ ┣ 📂 order             # 발주 관리  
┃ ┃ ┣ 📂 outbound          # 출고 관리  
┃ ┃ ┣ 📂 outbound_receipt  # 출고 거래명세서 관리 
┃ ┃ ┣ 📂 outinspection     # 출고 검수 관리  
┃ ┃ ┣ 📂 procurement_plan  # 조달계획 관리 
┃ ┃ ┣ 📂 product           # 품목 관리  
┃ ┃ ┣ 📂 register          # 회원가입 및 계정 관리  
┃ ┃ ┗ 📂 stock             # 재고 관리 
┃ ┣ 📂 resources  
┃ ┃ ┣ 📂 mappers           # MyBatis 매퍼 XML  
┃ ┃ ┣ 📜 application.properties  
┃ ┃ ┣ 📜 log4j.xml  
┃ ┃ ┗ 📜 mybatis-config.xml  
┃ ┗ 📂 webapp  
┃    ┣ 📂 resources        # 정적 리소스 (img, css, js 등)  
┃    ┣ 📂 WEB-INF  
┃    ┃ ┣ 📂 spring         # Spring XML 설정  
┃    ┃ ┣ 📂 views          # JSP 뷰 (board, chat, order, etc.)  
┃    ┃ ┗ 📜 web.xml        # 서블릿 설정  
┗ 📂 test  
 ┣ 📂 java/co/algorizo/erp  
 ┃ ┣ 📜 DataSourceTest.java  
 ┃ ┗ 📜 MybatisTest.java  
 ┗ 📂 resources  
   ┗ 📜 log4j.xml
```

---

## 🖥️ 주요 화면 (Main Screens)

### 로그인 및 회원가입

![로그인 및 회원가입](https://github.com/user-attachments/assets/44776cca-e462-41f3-9ccf-f613069cfeb8)

### 사원 관리

![사원 관리](https://github.com/user-attachments/assets/6775f109-1652-4741-a0fd-470c575a9697)

### 품목 관리

![품목 관리](https://github.com/user-attachments/assets/375c7fd5-6387-479f-b283-d4456a1cc0cd)

### 공급업체 관리

![공급업체 관리](https://github.com/user-attachments/assets/6d6eadad-c61e-4268-b693-781ea847a12e)

### 조달계획 관리

![조달계획 관리1](https://github.com/user-attachments/assets/78a8cdaf-cfc3-4148-a531-6ad6f9a300ad)
![조달계획 관리2](https://github.com/user-attachments/assets/2c1aebd2-ce37-428d-9926-890e69fcac08)

### 계약 관리

![계약 관리](https://github.com/user-attachments/assets/e1a6d715-11f0-49a0-8c83-f138921b0d6a)

### 발주 관리

![발주 관리](https://github.com/user-attachments/assets/0284376e-0cc8-4213-8e13-8842349381c8)

### 입/출고 관리

![입출고 관리1](https://github.com/user-attachments/assets/661bba89-2b32-42a5-ae17-eb2cef492dbc)
![입출고 관리2](https://github.com/user-attachments/assets/623fe989-94e3-4323-9820-d2a091f91b05)

### 입/출고 검수

![입출고 검수1](https://github.com/user-attachments/assets/a41ec534-9483-4169-af29-45bea37e24b0)
![입출고 검수2](https://github.com/user-attachments/assets/0aa0bb05-7769-4528-9c0f-1d1b3eaeccb5)

### 입/출고 거래명세서

![입출고 거래명세서](https://github.com/user-attachments/assets/08abff60-a079-4359-8cd8-0d1a47667ff8)

---

## 🧭 향후 개선 방향 (Future Improvements)
- 다양한 예외 상황에 대한 처리 로직 보강으로 안정성 강화
- 각 기능간 데이터 연동성을 강화시켜 업무 효율성과 시스템 완성도를 높이는 방향으로 개선

---

