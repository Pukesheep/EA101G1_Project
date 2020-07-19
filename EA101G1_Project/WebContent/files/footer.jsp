<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.member.model.*"%>

        <!-- footer -->
        <footer id="footer" class="pt-5 ">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">快速連結</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/index.jsp">S.F.G首頁</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊會員</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">商城</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">團購</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">會員互動</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">競標區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">直購區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">討論區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">聊天室</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">關於我們</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">關於S.F.G</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">最新消息</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">隱私權政策</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">技術支援</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">新手上路</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">幫助&支援</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">服務條款</a>
                            </li>
                        </ul>                    
                    </div>
                </div>
            </div>

            <div class="footer-end bg-dark mt-5 py-2">
                <p class="text-center">&copy; Copy right 2020</p>
            </div>
        </footer>
<c:if test="${sessionScope.memberVO ne null}">
        
        <%@ include file="/front-end/frontchat/chat.jsp" %>
        


</c:if>