<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@include file="include/head.jsp" %>
</head>

<body>
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left">
                    
                    <h1 class="auth-title">회원가입</h1>

                    <form action="${contextPath}/register" onsubmit="return validateForm()" method="post">
                    <!-- 이메일 -->
                        <div class="form-group position-relative mb-4">
    						<div class="d-flex align-items-center mb-2">
        						<label for="m_email" class="me-2">이메일</label>
        							<i class="bi bi-envelope"></i>
    						</div>
    						<div class="input-group">
        						<!-- 이메일 아이디 부분 -->
        						<input type="text" class="form-control" id="email_id" placeholder="아이디">
        
        						<!-- @ 구분자 -->
        						<span class="input-group-text">@</span>
        
        						<!-- 이메일 도메인 부분 -->
        						<input type="text" class="form-control" id="email_domain" placeholder="도메인">
        
        						<!-- 도메인 선택 드롭다운 -->
        						<select class="form-select" id="domain_select" aria-label="도메인 선택" onchange="handleDomainSelection()">
            						<option value="">직접 입력</option>
            						<option value="gmail.com">gmail.com</option>
            						<option value="naver.com">naver.com</option>
            						<option value="daum.net">daum.net</option>
            						<option value="kakao.com">kakao.com</option>
        						</select>
        						<script>
    							function handleDomainSelection() {
        							const domainInput = document.getElementById("email_domain");
        							const domainSelect = document.getElementById("domain_select");
	
        							if (domainSelect.value) {
            							// 드롭다운에서 선택한 값이 있을 경우
            							domainInput.value = domainSelect.value; // 선택한 값으로 설정
            							domainInput.disabled = true; // 직접 입력 비활성화
        							} else {
            							// "직접 입력" 선택 시
            							domainInput.value = ""; // 입력값 초기화
            							domainInput.disabled = false; // 직접 입력 활성화
        								}
    								}
								</script>
        
        						<!-- 숨겨진 실제 이메일 필드 -->
        						<input type="hidden" name="m_email" id="m_email">
    						</div>
    						
						</div>
                        <!-- 사원번호 -->
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" name="m_id" placeholder="사원번호">
                            <div class="form-control-icon">
                                <svg class="bi" width="1em" height="1em" fill="currentColor">
                                     <use xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#key" />
                                     </svg>
                            </div>
                        </div>
                        <!-- 이름 -->
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" name="m_name" placeholder="이름">
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                            <c:if test="${not empty error }">
                            	<p style="color: red; font-size: 0.9em; margin-top: 5px;">${error }</p>
                            </c:if>
                        </div>
                        <!-- 비밀번호 -->
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="password" class="form-control form-control-xl" name="m_password" id="m_password" placeholder="비밀번호">
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <!-- 비밀번호 확인 -->
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="password" class="form-control form-control-xl" name="confirm_password" id="m_password_confirm" placeholder="비밀번호 확인">
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                                
                            </div>
                        </div>
                        <!-- 주소(api) -->
			            <div class="card p-4 mb-4">
							<h5 class="mb-3">주소 정보</h5>
								<div class="row mb-3">
									<div class="col-md-8">
									      <div class="input-group">
									         <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
									         <button type="button" class="btn btn-warning" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
									      </div>
									 </div>
								</div>
									    
								<div class="form-group mb-3">
									<input type="text" class="form-control" id="sample6_address" placeholder="주소" value="${m_addr}">
								</div>
										
								<div class="form-group mb-3">
									<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
								</div>
										
								<div class="form-group mb-3">
									<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
								</div>
										
								<!-- 실제 서버로 전달될 주소 값 (Hidden 필드) -->
								<input type="hidden" name="m_addr" id="m_addr" value="${m_addr}">
									    
						</div>
                        
                        <!-- 부서 -->
                        <div class="form-group position-relative has-icon-left mb-4">
                            <div class="form-control-icon">
                                <svg class="bi" width="1em" height="1em" fill="currentColor">
                                     <use xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#person-badge" />
                                     </svg>
                            </div>
                            <div class="form-group mb-4">
                       			<select name="dept_d_id" class="form-control">
                            		<option value="">부서를 선택하세요</option>
                            		<c:forEach var="dept" items="${deptList }">
                            			<option value="${dept.d_id }">${dept.team }</option>
                            		</c:forEach>
                        		</select>
                    		</div>
                        </div>
                        <!-- 전화번호-->
                        <div class="form-group mb-4">
    					<!-- 아이콘을 별도 컨테이너로 분리 -->
    					<div class="d-flex align-items-center mb-2">
        					<svg class="bi me-2" width="1em" height="1em" fill="currentColor">
            					<use xlink:href="${contextPath}/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#telephone" />
        					</svg>
        				<span>전화번호</span>
    					</div>
    
    					<!-- 전화번호 입력 필드들 -->
    					<div class="d-flex align-items-center">
        					<div class="input-group">
            			<!-- 010 고정 부분 -->
            			<input type="text" value="010" class="form-control" readonly style="max-width: 70px;">
            			<input type="hidden" name="phone1" value="010">
            			
            			<!-- 구분자 -->
            			<span class="input-group-text">-</span>
            
            			<!-- 중간 4자리 -->
            			<input type="text" name="phone2" class="form-control" maxlength="4" placeholder="앞 4자리">
            
            			<!-- 구분자 -->
            			<span class="input-group-text">-</span>
            
            			<!-- 끝 4자리 -->
            			<input type="text" name="phone3" class="form-control" maxlength="4" placeholder="뒤 4자리">
        					</div>
    					<input type="hidden" name="m_pno" id="m_pno">
    					</div>
						</div>
                        <!-- 생년월일 -->
                        
                        <div class="form-group mb-4">
						  <div class="d-flex align-items-center">
						    <!-- 텍스트 라벨 -->
						    <label class="me-2 mb-0">생년월일</label>
						    <!-- 아이콘 -->
						    <!-- 년도 / 월 / 일 입력부분 (input-group) -->
						    <div class="input-group" style="width: auto;">
						      <select class="form-select" name="birth_year">
						        <option value="">년도</option>
								    <c:forEach var="i" begin="0" end="${2006 - 1950}" step="1">
								        <c:set var="year" value="${2006 - i}" />
								        <option value="${year}">${year}</option>
								    </c:forEach>
						      </select>
						        <!-- 추가 년도 옵션 -->
						      <select class="form-select" name="birth_month">
							        <option value="">월</option>
							        <option value="1">1</option>
							        <option value="2">2</option>
							        <option value="3">3</option>
							        <option value="4">4</option>
							        <option value="5">5</option>
							        <option value="6">6</option>
							        <option value="7">7</option>
							        <option value="8">8</option>
							        <option value="9">9</option>
							        <option value="10">10</option>
							        <option value="11">11</option>
							        <option value="12">12</option>
						      </select>
						      		<input type="text" class="form-control" name="birth_day" placeholder="일" maxlength="2">
						    </div>
						  </div>
						  <input type="hidden" name="birth" id="birth">
						</div>
                        <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Sign Up</button>
                        
                    </form>
                    <c:if test="${not empty sessionScope.m_id }">
                        <a href="${contextPath }/home" class="font-bold">Go Back</a>
                    </c:if>
                    <c:if test="${empty sessionScope.m_id }">
                    <div class="text-center mt-5 text-lg fs-4">
                        <p class='text-gray-600'>Already have an account? <a href="${contextPath }" class="font-bold">Log in</a>.</p>
                    </div>
                    </c:if>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">

                </div>
            </div>
        </div>

    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- 유효성 검사 -->
    <script>
    function validateForm() {
        
        // 이메일 검사: 아이디와 도메인이 모두 채워졌는지, 형식이 맞는지 확인
        const emailId = document.getElementById("email_id").value.trim();
        const emailDomain = document.getElementById("email_domain").value.trim();
        const emailHidden = document.getElementById("m_email");
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        
        if (emailId === "" || emailDomain === "") {
            alert("이메일의 아이디와 도메인을 모두 입력해 주세요.");
            return false;
        }
        
        const fullEmail = emailId + "@" + emailDomain;
        if (!emailRegex.test(fullEmail)) {
            alert("유효한 이메일 형식을 입력해 주세요.");
            return false;
        }
        
        emailHidden.value = fullEmail;
        console.log("Full email set to hidden field: ", fullEmail);

        // 사원번호 검사
        const mId = document.getElementsByName("m_id")[0].value.trim();
        if (mId === "") {
            alert("사원번호를 입력해 주세요.");
            return false;
        }
        if(mId.length < 8){
        	alert("사원번호는 8글자 이상 입력해야합니다.");
        	
        	return false;
        }

        // 비밀번호 검사
        const mPassword = document.getElementById("m_password").value;
        if (mPassword === "") {
            alert("비밀번호를 입력해 주세요.");
            return false;
        }

        // 비밀번호 확인 검사
        const mPasswordConfirm = document.getElementById("m_password_confirm").value;
        if (mPasswordConfirm === "") {
            alert("비밀번호 확인을 입력해 주세요.");
            return false;
        }
        if (mPassword !== mPasswordConfirm) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }
        
        // 비밀번호 검증
        const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$/;
        if(!passwordPattern.test(mPassword)){
        	alert("비밀번호는 소, 대문자 특수문자, 숫자를 하나 이상 입력해야합니다.");
        	return false;
        }
        if(mPassword.length < 8){
        	alert("비밀번호는 8글자 이상 입력해야합니다.");
        	return false;
        }
        
        // 이름 검증
        const mName = document.getElementById("m_name").value;
        const namePattern = /^[가-힣a-zA-Z]+$/;
        
        if(mName.length < 2){
        	alert("이름은 2글자 이상 입력해야합니다.");
        	
        	return false;
        }
        if(!namePattern.test(mName)){
        	alert("이름은 한글, 영문자만 가능합니다.");
        	return false;
        }

        // 주소 검사
        const mAddr = document.getElementsByName("m_addr")[0].value.trim();
        if (mAddr === "") {
            alert("주소를 입력해 주세요.");
            return false;
        }

        // 부서 선택 검사
        const mDept = document.getElementsByName("dept_d_id")[0].value;
        if (mDept === "") {
            alert("부서를 선택해 주세요.");
            return false;
        }

        // 전화번호 검사
        const phone1 = document.getElementsByName("phone1")[0].value.trim();
        const phone2 = document.getElementsByName("phone2")[0].value.trim();
        const phone3 = document.getElementsByName("phone3")[0].value.trim();
        const digitRegex = /^\d+$/;
        const phoneHidden = document.getElementById("m_pno");

        if (!digitRegex.test(phone2) || phone2.length !== 4) {
            alert("전화번호 앞 4자리를 정확하게 입력해 주세요.");
            return false;
        }
        if (!digitRegex.test(phone3) || phone3.length !== 4) {
            alert("전화번호 뒤 4자리를 정확하게 입력해 주세요.");
            return false;
        }

        const fullPhone = phone1 + "-" + phone2 + "-" + phone3;
        phoneHidden.value = fullPhone;
        alert("Full phone number set: ", fullPhone);

        // 생년월일 검사
        const birthYearSelect = document.getElementsByName("birth_year")[0];
		  const birthMonthSelect = document.getElementsByName("birth_month")[0];
		  const birthDayInput = document.getElementsByName("birth_day")[0];
		  
		  const birthYear = birthYearSelect.value;
		  const birthMonth = birthMonthSelect.value;
		  const birthDay = birthDayInput.value;
		  
		  console.log("Birth Year: ", birthYear);
		  console.log("Birth Month: ", birthMonth);
		  console.log("Birth Day: ", birthDay);
		  
		  if (birthYear === "" || birthMonth === "" || birthDay === "") {
		    alert("생년월일의 년도, 월, 일을 모두 입력해 주세요.");
		    return false;
		  }
		  
		  if (isNaN(parseInt(birthMonth)) || parseInt(birthMonth) < 1 || parseInt(birthMonth) > 12) {
		    alert("유효한 생년월일(월)을 입력해 주세요.");
		    return false;
		  }
		  
		  if (isNaN(parseInt(birthDay)) || parseInt(birthDay) < 1 || parseInt(birthDay) > 31) {
		    alert("유효한 생년월일(일)을 입력해 주세요.");
		    return false;
		  }
		  
		  // 연도에서 마지막 두 자리만 추출
		  const yearLastTwoDigits = birthYear.slice(-2);
		  
		  // 숫자로 변환 후 두 자리 형식(패딩) 적용
		  const paddedMonth = String(parseInt(birthMonth)).padStart(2, '0');
		  const paddedDay = String(parseInt(birthDay)).padStart(2, '0');
		  
		  // YYMMDD 형식으로 조합
		  const fullBirth = `${yearLastTwoDigits}${paddedMonth}${paddedDay}`;
		  
		  // hidden 필드에 값 설정
		  document.getElementById("birth").value = fullBirth;

        // 모든 검사를 통과하면 폼 제출 허용
        console.log("최종 제출 직전 m_pno:", document.getElementById("m_pno").value);
        return true;
        
    }
 
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
	document.querySelector('form').addEventListener('submit', function(e){
		//주소 결합
		let postcode = document.getElementById('sample6_postcode').value;
		let address = document.getElementById('sample6_address').value;
		let detailAddress = document.getElementById('sample6_detailAddress').value;
		let extraAddress = document.getElementById('sample6_extraAddress').value;
		
		// 결합된 주소를 m_addr 필드에 설정
		let fullAddress = '(' + postcode + ') ' + address + " " + detailAddress;
		if(extraAddress){
			fullAddress += '(' + extraAddress + ')';
		}
		
		document.getElementById('m_addr').value = fullAddress;
		 console.log('최종 주소:', m_addr); // 디버깅용 로그
		
	});
</script>
    
    
</body>

</html>