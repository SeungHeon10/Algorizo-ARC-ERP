<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="${contextPath }/home">ARC ERP</a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>

                        <li class="sidebar-item ">

                            <a href="${contextPath }/home" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                       	
                       	
                    
                    <c:choose>
	                    <c:when test="${not empty sessionScope.m_id }">
	                    	<li class="sidebar-item ">
		                            <a href="${contextPath }/logout" class='sidebar-link'>
		                                <i class="bi bi-grid-1x2-fill"></i>
		                                <span>로그아웃</span>
		                            </a>
		                    </li>
	                    </c:when>
						<c:otherwise>
							<li class="sidebar-item ">
		                            <a href="${contextPath }/" class='sidebar-link'>
		                                <i class="bi bi-grid-1x2-fill"></i>
		                                <span>로그인</span>
		                            </a>
		                    </li>
							
						</c:otherwise>                    
                    
                    </c:choose>
                    
					

                        <li class="sidebar-item has-sub ">

                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>회원 관리</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="${contextPath }/members">회원 전체 조회</a>
                                </li>
                                
                                <c:if test="${sessionScope.d_id == 50 || sessionScope.m_id == 20250001}">
	                                <li class="submenu-item ">
	                                    <a href="${contextPath }/register">회원 등록</a>
	                                </li>
                                </c:if>
                                
                            </ul>
                        </li>
                        
                        <!-- 합치기 -->
                        
                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>품목관리</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="${contextPath }/product/productlist">품목 조회</a>
                                </li>
                                
                                <c:if test="${sessionScope.d_id == 55 || sessionScope.m_id == 20250001}">
	                                <li class="submenu-item ">
	                                    <a href="${contextPath }/product/productinsert">품목 등록</a>
	                                </li>
                                </c:if>
                                
                            </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-collection-fill"></i>
                                <span>공급업체관리</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="${contextPath }/company/companylist">공급업체 조회</a>
                                </li>
                                
                                <c:if test="${sessionScope.d_id == 55 || sessionScope.m_id == 20250001}">
	                                <li class="submenu-item ">
	                                    <a href="${contextPath }/company/companyinsert">공급업체 등록</a>
	                                </li>
                                </c:if>
                                
                            </ul>
                        </li>
                        
                        <li class="sidebar-item  has-sub">
	                    	<a href="${contextPath }/plans/list" class='sidebar-link'>
	                        	<i class="bi bi-stack"></i>
	                        	<span>조달 계획 관리</span>
		                    </a>
		                    <ul class="submenu ">
		                        <li class="submenu-item ">
		                            <a href="${contextPath }/plans/list">조달 계획 조회</a>
		                        </li>
		                        <c:if test="${sessionScope.d_id == 55 || sessionScope.m_id == 20250001}">
			                        <li class="submenu-item ">
	                                    <a href="${contextPath }/plans/register">조달 계획 등록</a>
	                                </li>
                                </c:if>
		                    </ul>
	                	</li>
	                	
	                	<li class="sidebar-item   has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>발주</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="${contextPath }/order/list">발주 조회</a>
                                </li>
                                
                                <c:if test="${sessionScope.d_id == 55 || sessionScope.m_id == 20250001}">
	                                <li class="submenu-item ">
	                                    <a href="${contextPath }/order/register">신규 발주 등록</a>
	                                </li>
                                </c:if>
                                
                           </ul>
                        </li>
                        
                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>계약</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="${contextPath }/contract/list">계약 조회</a>
                                </li>
                                
                                <li class="submenu-item ">
                                    <a href="${contextPath }/contract/register">신규 계약 등록</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="sidebar-item  has-sub">
		                    <a href="#" class='sidebar-link'>
		                        <i class="bi bi-stack"></i>
		                        <span>입고</span>
		                    </a>
		                    <ul class="submenu ">
		                        <li class="submenu-item ">
		                            <a href="${contextPath }/inbound/inboundlist">입고 조회</a>
		                        </li>
		                        <c:if test="${sessionScope.d_id == 53 || sessionScope.m_id == 20250001}">
			                        <li class="submenu-item ">
			                            <a href="${contextPath }/inbound/inboundregister">입고 등록</a>
			                        </li>
		                        </c:if>
		                        <li class="submenu-item ">
		                            <a href="${contextPath }/inboundReceipt/listAllInboundReceipt">입고 거래명세서 조회</a>
		                            
		                        </li>
		                    </ul>
		                </li>
	                    <li class="sidebar-item  has-sub">
	                        <a href="#" class='sidebar-link'>
	                            <i class="bi bi-collection-fill"></i>
	                            <span>검수</span>
	                        </a>
	                        <ul class="submenu ">
	                            <li class="submenu-item ">
	                                <a href="${contextPath }/inspection/list">검수 조회</a>
	                            </li>
	                            
	                            <c:if test="${sessionScope.d_id == 54 || sessionScope.m_id == 20250001}">
		                            <li class="submenu-item ">
		                                <a href="${contextPath }/inspection/register">검수 등록</a>
		                            </li>
	                            </c:if>
	                            
	                        </ul>
	                    </li>
	
		                <li class="sidebar-item  has-sub">
		                    <a href="#" class='sidebar-link'>
		                        <i class="bi bi-collection-fill"></i>
		                        <span>출고</span>
		                    </a>
		                    <ul class="submenu ">
		                        <li class="submenu-item ">
		                            <a href="${contextPath }/outbound/outboundlist">출고 조회</a>
		                        </li>
		                        
		                        <c:if test="${sessionScope.d_id == 53 || sessionScope.m_id == 20250001}">
			                        <li class="submenu-item ">
			                            <a href="${contextPath }/outbound/outboundregister">출고 등록</a>
			                        </li>
		                        </c:if>
		                        <li class="submenu-item ">
		                            <a href="${contextPath }/outboundReceipt/listAllOutboundReceipt">출고 거래명세서 조회</a>
		                        </li>
		                        
		                    </ul>
		                </li>
		                <li class="sidebar-item  has-sub">
		                    <a href="#" class='sidebar-link'>
		                        <i class="bi bi-stack"></i>
		                        <span>재고</span>
		                    </a>
		                    <ul class="submenu ">
		                        <li class="submenu-item ">
		                            <a href="${contextPath }/stock/stocklist">재고 조회</a>
		                        </li>
		                        
		                        <c:if test="${sessionScope.d_id == 53 || sessionScope.m_id == 20250001}">
			                        <li class="submenu-item ">
			                            <a href="${contextPath }/stock/s_register">재고 등록</a>
			                        </li>
		                        </c:if>
		                        
		                    </ul>
		                </li>
                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>