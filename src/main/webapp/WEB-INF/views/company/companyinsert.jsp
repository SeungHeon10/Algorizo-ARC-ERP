<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="../include/head.jsp"%>
</head>

<body>
    <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <%@include file="../include/left_column.jsp"%>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
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
                            <h3>공급업체 등록</h3>
                            <p class="text-subtitle text-muted">공급업체 등록 화면</p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Form Layout</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>

                <!-- Basic Horizontal form layout section start -->
                <section id="basic-horizontal-layouts">
                    <div class="row match-height">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">공급업체 등록 </h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <form class="form form-horizontal" action="companyinsert" method="post">
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-1">
                                                        <label>회사명</label>
                                                    </div>
                                                    <div class="col-md-11">
                                                        <div class="form-group has-icon-left">
                                                            <div class="position-relative">
                                                                <input type="text" class="form-control" placeholder="Company" id="cp_name" name="cp_name">
                                                                <div class="form-control-icon">
               														 <svg class="bi" width="1em" height="1em" fill="currentColor">
             													        <use
                                                   						 xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#filter-left" />
           														     </svg>
       														     </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-1">
                                                        <label>업종</label>
                                                    </div>
                                                    <div class="col-md-11">
                                                        <div class="form-group has-icon-left">
                                                            <div class="position-relative">
                                                                <input type="text" class="form-control" placeholder="Category" id="cp_ctg" name="cp_ctg">
                                                                <div class="form-control-icon">
               														 <svg class="bi" width="1em" height="1em" fill="currentColor">
             													        <use
                                                   						 xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#clipboard-minus" />
           														     </svg>
       														     </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                     <div class="col-md-1">
                                                        <label>대표명</label>
                                                    </div>
                                                    <div class="col-md-11">
                                                        <div class="form-group has-icon-left">
                                                            <div class="position-relative">
                                                                <input type="text" class="form-control" placeholder="Representative" id="cp_manager" name="cp_manager">
                                                                <div class="form-control-icon">
               														 <svg class="bi" width="1em" height="1em" fill="currentColor">
             													        <use
                                                   						 xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#person" />
           														     </svg>
       														     </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                        <div class="col-md-1">
                                                        <label>대표번호</label>
                                                    </div>
                                                    <div class="col-md-11">
                                                        <div class="form-group has-icon-left">
                                                            <div class="position-relative">
                                                                <input type="text" class="form-control" placeholder="Mobile" id="cp_pno" name="cp_pno">
                                                                <div class="form-control-icon">
               														  <i class="bi bi-phone"></i>
       														     </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-1">
                                                        <label>이메일</label>
                                                    </div>
                                                    <div class="col-md-11">
                                                        <div class="form-group has-icon-left">
                                                            <div class="position-relative">
                                                                <input type="email" class="form-control"
                                                                    placeholder="Email" id="cp_mail" name="cp_mail">
                                                                <div class="form-control-icon">
                                                                    <i class="bi bi-envelope"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-1">
                                                        <label>팩스번호</label>
                                                    </div>
                                                    <div class="col-md-11">
                                                        <div class="form-group has-icon-left">
                                                            <div class="position-relative">
                                                                <input type="text" class="form-control" placeholder="Fax" id="cp_fax" name="cp_fax">
                                                                <div class="form-control-icon">
               														 <svg class="bi" width="1em" height="1em" fill="currentColor">
             													        <use
                                                   						 xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#file-earmark" />
           														     </svg>
       														     </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-1">
                                                        <label>주소</label>
                                                    </div>
                                                    <div class="col-md-11">
                                                        <div class="form-group has-icon-left">
                                                            <div class="position-relative">
                                                                <input type="text" class="form-control" placeholder="Address" id="cp_addr" name="cp_addr">
                                                                <div class="form-control-icon">
               														 <svg class="bi" width="1em" height="1em" fill="currentColor">
             													        <use
                                                   						 xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#house" />
           														     </svg>
       														     </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                  
                                                    <div class="col-12 d-flex justify-content-end">
                                                        <button type="submit"
                                                            class="btn btn-primary me-1 mb-1">등록</button>
                                                        <button type="reset"
                                                            class="btn btn-light-secondary me-1 mb-1">초기화</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <footer>
               <%@include file="../include/footer.jsp"%>
            </footer>
        </div>
    </div>
   <%@include file="../include/plugin.jsp"%>
</body>

</html>