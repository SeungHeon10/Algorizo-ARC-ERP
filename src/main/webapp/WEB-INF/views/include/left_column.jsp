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

                        <li class="sidebar-item <%= request.getRequestURI() %> ${fn:contains(pageContext.request.requestURI, '/home') ? 'active' : ''}">

                            <a href="${contextPath }/home" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                       	
                       	
                    
                    <c:choose>
	                    <c:when test="${not empty sessionScope.m_id }">
	                    	<li class="sidebar-item ${fn:endsWith(pageContext.request.requestURI, 'logout') ? 'active' : ''}">
		                            <a href="${contextPath }/logout" class='sidebar-link'>
		                                <i class="bi bi-grid-1x2-fill"></i>
		                                <span>로그아웃</span>
		                            </a>
		                    </li>
	                    </c:when>
						<c:otherwise>
							<li class="sidebar-item ${fn:endsWith(pageContext.request.requestURI, 'login') ? 'active' : ''}">
		                            <a href="${contextPath }/" class='sidebar-link'>
		                                <i class="bi bi-grid-1x2-fill"></i>
		                                <span>로그인</span>
		                            </a>
		                    </li>
							
						</c:otherwise>                    
                    
                    </c:choose>
                    
					

                        <li class="sidebar-item has-sub ${fn:contains(pageContext.request.requestURI, 'members') || fn:contains(pageContext.request.requestURI, 'register') ? 'active' : ''}">

                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>회원 관리</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ${fn:contains(pageContext.request.requestURI, 'members') ? 'active' : ''}">
                                    <a href="${contextPath }/members">회원 전체조회</a>
                                </li>
                                <li class="submenu-item ${fn:contains(pageContext.request.requestURI, 'register') ? 'active' : '' }">
                                    <a href="${contextPath }/register">회원 등록</a>
                                </li>
                                
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
                                <li class="submenu-item ">
                                    <a href="${contextPath }/product/productinsert">품목 등록</a>
                                </li>
                            </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-collection-fill"></i>
                                <span>공급업체관리</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="${contextPath }/company/companylist">공급업체</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="${contextPath }/company/companyinsert">공급업체 등록</a>
                                </li>
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
                                <li class="submenu-item ">
                                    <a href="${contextPath }/order/register">신규 발주 등록</a>
                                </li>
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
		                            <a href="${contextPath }/inbound/i_list">입고 목록</a>
		                        </li>
		                        <li class="submenu-item ">
		                            <a href="${contextPath }/inbound/i_register">입고 등록</a>
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
	                                <a href="${contextPath }/inspection/list">검수</a>
	                            </li>
	                            <li class="submenu-item ">
	                                <a href="${contextPath }/inspection/register">검수 등록</a>
	                            </li>
	                        </ul>
	                    </li>
	
		                <li class="sidebar-item  has-sub">
		                    <a href="#" class='sidebar-link'>
		                        <i class="bi bi-collection-fill"></i>
		                        <span>출고</span>
		                    </a>
		                    <ul class="submenu ">
		                        <li class="submenu-item ">
		                            <a href="${contextPath }/outbound/o_list">출고 목록</a>
		                        </li>
		                        <li class="submenu-item ">
		                            <a href="${contextPath }/outbound/o_register">출고 등록</a>
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
		                            <a href="${contextPath }/stock/s_list">재고 목록</a>
		                        </li>
		                        <li class="submenu-item ">
		                            <a href="${contextPath }/stock/s_register">재고 등록</a>
		                        </li>
		                    </ul>
		                </li>
                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>