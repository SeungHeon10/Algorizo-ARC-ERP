<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
	<%@include file="../include/head.jsp" %>
</head>

<body>
    <%@ include file="../include/left_column.jsp" %>
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
                            <h3><strong>사원 정보 수정</strong></h3>
                            <p class="text-subtitle text-muted"></p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${contextPath }/members">Members</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Update</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>

            <!-- 사원 수정 폼 -->
            <section class = "section">
            	<div class="row">
            		<div class="col12">
            			<div class="card">
            				<div class="card-heading">
            				</div>
            				
            				
            				
            				<div class="card-body">
								<form action="${contextPath	}/members/updateMember" method="post" enctype="multipart/form-data">
									<input type="hidden" name = "m_id" value="${member.m_id }">
									
									<div class="mb-3">
										<label class="form-label">현재 사진</label><br>
										<img src="${contextPath }/resources/img/members/${member.m_photo}" style="max-width: 150px;">
									</div>
									
									<div class="mb-3">
										<label for="m_photo" class="form-label">새 사진 업로드</label>
										<input type="file" class="form-control" id="m_photo" name="m_photo">
									</div>
									<input type="hidden" name="originPhoto" value="${member.m_photo }">
									
									
									<div class = mb-3>
										<label class="form-label">사원번호</label>
										<input type="text" class="form-control" value="${member.m_id }" readonly>
									</div>
									
									
									<div class="mb-3">
										<label class="form-label">이름</label>
										<input type="text" class="form-control" value="${member.m_name }" readonly>
									</div>
									
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
												<input type="text" class="form-control" id="sample6_address" placeholder="주소" value="${member.m_addr}">
											</div>
													
											<div class="form-group mb-3">
												<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
											</div>
													
											<div class="form-group mb-3">
												<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
											</div>
													
											<!-- 실제 서버로 전달될 주소 값 (Hidden 필드) -->
											<input type="hidden" name="m_addr" id="m_addr" value="${member.m_addr}">
												    
									</div>
									
									<div class="mb-3">
										<label class="form-label">이메일</label>
										<input type="text" class="form-control" name="m_email" value="${member.m_email }" placeholder="id @ domain">
									</div>
									
									<div class="mb-3">
										<label class="form-label">전화번호</label>
										<input type="text" class="form-control" name="m_pno" value="${member.m_pno }" placeholder="010-****-****">
									</div>
									
									<div class="mb-3">
									    <label class="form-label">부서</label>
									    <select class="form-select" name="dept_d_id">
									        <c:forEach var="dept" items="${dList}">
									        	<!-- 선택 유지 기능 -->
									            <option value="${dept.d_id }">${dept.team }</option>
									        </c:forEach>
									    </select>
									</div>
									
									<div class="mb-3">
										<label class="form-label">입사일</label>
										<input type="text" class="form-control" value="${member.regdate }" readonly>
									</div>
									
									<div class="text-center">
										<button type="submit" class="btn btn-outline-primary">수정 완료</button>
										<a href="${contextPath }/members/memberDetail?m_id=${member.m_id}" class="btn btn-outline-secondary">취소</a>
									</div>
									
								</form>            				
            				</div>
            			</div>
            		</div>
            	</div>
            </section>
                

                
            </div>

            <footer>
                <%@include file="../include/footer.jsp" %>
            </footer>
        </div>
    </div>
    <%@ include file="../include/plugin.jsp" %>
<!-- jQuery 먼저 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(document).ready(function(){
		$("form").submit(function(event){
			const m_email = $("input[name='m_email']").val();
			const m_pno = $("input[name='m_pno']").val();
			
			if(!m_email.includes("@")){
				alert("올바른 이메일을 입력하세요.");
				return false;
			}
			if(m_pno.length < 11){
				alert("전화번호를 올바르게 입력하세요.");
				return false;
			}
			
			return true;
			
		});
	});
	 
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
	    let postcode = document.getElementById('sample6_postcode').value;
	    let address = document.getElementById('sample6_address').value;
	    let detailAddress = document.getElementById('sample6_detailAddress').value;
	    let extraAddress = document.getElementById('sample6_extraAddress').value;
	
	    // 우편번호만 괄호로 감싸기
	    let fullAddress = '';
	    if (postcode) {
	        fullAddress += '(' + postcode + ') ';
	    }
	    fullAddress += address;
	    if (detailAddress) {
	        fullAddress += ' ' + detailAddress;
	    }
	    if (extraAddress) {
	        fullAddress += ' ' + extraAddress;
	    }
	
	    document.getElementById('m_addr').value = fullAddress;
	});
</script>
<script>
	document.addEventListener("DOMContentLoaded", function () {
	    let postcode = document.getElementById('sample6_postcode').value || '';
	    let address = document.getElementById('sample6_address').value || '';
	    let detailAddress = document.getElementById('sample6_detailAddress').value || '';
	    let extraAddress = document.getElementById('sample6_extraAddress').value || '';
	
	    let fullAddress = '';
	    if (postcode) {
	        fullAddress += '(' + postcode + ') ';
	    }
	    fullAddress += address;
	    if (detailAddress) {
	        fullAddress += ' ' + detailAddress;
	    }
	    if (extraAddress) {
	        fullAddress += ' ' + extraAddress;
	    }
	
	    document.getElementById('m_addr').value = fullAddress;
	});
</script>
    
</body>

</html>