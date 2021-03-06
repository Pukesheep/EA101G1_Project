<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	img.nav_mem_icon {
		width: 50px;
		height: 50px;
		border-radius: 50%;
	}
</style>
    <!-- navbar -->
    <!-- 使用Boostrap Navbar -->
    <!-- 設定Navbar緊貼畫面上緣 -->
    <!-- b4-navbar-default 安裝Bootstrap外掛,可以使用快捷指令 -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/front-end/index.jsp">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <span class="logo3">{{{</span>
        </a>
        <!-- 手機選單按鈕 -->
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
            aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="navbar2 navbar-dark">
            <div class="row">
                  <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">商城 </a></div>
                  <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/groupbuy/listAllGroupbuy.jsp">團購 </a></div> 
                  <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp">競標區 </a></div> 
                  <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/immed/immed_index.jsp">直購區 </a></div>
            </div>
            <div class="row mt-2">
                <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">討論區 </a></div> 
                <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/protected/BounsMall/listAllBouns.jsp">紅利</a></div> 
            	<div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/Question/ListAll.jsp">Q&A</a></div>
            </div>
        </div>

        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav ml-auto">
                <c:if test="${sessionScope.memberVO == null}">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/login.jsp">登入</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.memberVO ne null}">
            	<li class="nav-item">
            		<img alt="" src="<%=request.getContextPath()%>/member/ShowMemberPic.do?mem_id=${memberVO.mem_id}" class="nav_mem_icon">
            	</li>
            	<li class="nav-item">
            		<h6 class="nav-link">${sessionScope.memberVO.mem_name}</h6>
            	</li>
            	<li class="nav-item">
            		<h6 class="nav-link">您好</h6>
            	</li>
            	
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/member/member.do?action=showSelf&mem_id=${sessionScope.memberVO.mem_id}">會員中心</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href="<%=request.getContextPath()%>/member/login.do?action=logout">登出</a>
                </li>
          	</c:if>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/protected/favouriteProduct/listAllFavouriteProduct.jsp">我的最愛</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/shopCart/shopCart.jsp">購物車<c:if test="${not empty shoppingcart}">(${shoppingcart.size()})</c:if></a>
                </li>

            </ul>
        </div>


    </nav>
    <!-- navbar end -->

