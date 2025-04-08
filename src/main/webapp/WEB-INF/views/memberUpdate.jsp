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
    <%@ include file="include/left_column.jsp" %>
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
            <!-- 모달 -->
            <section class = "section">
            	<div class="row">
            		<div class="col12">
            			<div class="card">
            				<div class="card-heading">
            					<strong>사원 정보 수정</strong>
            				</div>
            				
            				<div class="card-body">
								<form action="${contextPath	}/members/updateMember" method="post">
									<input type="hidden" name = "m_id" value="${member.m_id }">
									
									<div class = mb-3>
										<label class="form-label">사원번호</label>
										<input type="text" class="form-control" value="${member.m_id }" disabled>
									</div>
									
									<div class="mb-3">
										<label class="form-label">이름</label>
										<input type="text" class="form-control" value="${member.m_name }" readonly>
									</div>
									
									<div class="mb-3">
										<label class="form-label">주소</label>
										<input type="text" class="form-control" name=m_addr value="${member.m_addr }">
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
											<option value="10" ${member.dept_d_id == 10 ? 'selected' : '' }>인사팀</option>
											<option value="20" ${member.dept_d_id == 20 ? 'selected' : '' }>개발팀</option>
											<option value="30" ${member.dept_d_id == 30 ? 'selected' : '' }>영업팀</option>
											<option value="40" ${member.dept_d_id == 40 ? 'selected' : '' }>자재팀</option>
											<option value="50" ${member.dept_d_id == 50 ? 'selected' : '' }>품질팀</option>
										</select>
									</div>
									
									<div class="mb-3">
										<label class="form-label">입사일</label>
										<input type="text" class="form-control" value="${member.regdate }" readonly>
									</div>
									
									<div class="text-center">
										<button type="submit" class="btn btn-primary">수정 완료</button>
										<a href="${contextPath }/members/memberDetail?m_id=${member.m_id}" class="btn btn-secondary">취소</a>
									</div>
									
								</form>            				
            				</div>
            			</div>
            		</div>
            	</div>
            </section>
                

                
            </div>

            <footer>
                <%@include file="include/footer.jsp" %>
            </footer>
        </div>
    </div>
    <%@ include file="include/plugin.jsp" %>
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
    
</body>

</html>