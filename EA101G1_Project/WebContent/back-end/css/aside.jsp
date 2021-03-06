<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<div>
        <aside class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ">
                <li class="nav-item">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl01">
                        <i class="fas fa-user-edit ml-3"></i> 會員管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl01" data-parent="#navbarNav">
                        
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/member/select_page.jsp">會員資料管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl02">
                        <i class="fas fa-home-alt ml-3 mr-2"></i>商城管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl02" data-parent="#navbarNav">
                    	<li class="nav-item ">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/protected/product/addPro.jsp">新增商品</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/protected/product/listAllProduct.jsp">商品管理</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/protected/productorder/listAllProductOrder.jsp">商城訂單管理</a>
                        </li>
                        
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl03">
                        <i class="fas fa-gift ml-3 mr-2"></i>紅利商城管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl03" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath() %>/back-end/protected/BounsMall/addBM.jsp">新增紅利商品</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/protected/BounsOrder/ListAll.jsp">紅利商品訂單管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/protected/BounsMall/ListAll.jsp">紅利商品商品管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl04">
                        <i class="fas fa-users-class  ml-3 mr-1"></i>團購管理</div>
                    <ul class="collapse navbar-nav pt-2" id="sideNavColl04" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/protected/groupbuy/listAllGro_order.jsp">團購訂單管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/protected/groupbuy/listAllGroupbuy.jsp">團購商品管理</a>
                        </li>
                        
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl05">
                        <i class="fas fa-hand-pointer ml-3 mr-2"></i>交易區管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl05" data-parent="#navbarNav">
                       
                          <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/immed/listAllImmed.jsp">直購商品管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl06">
                        <i class="fas fa-exclamation-triangle ml-3 mr-1"></i>檢舉管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl06" data-parent="#navbarNav">
                       <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/psac/listAllun.jsp">未處理的檢舉</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/psac/listAllPsac.jsp">所有文章檢舉管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl07">
                        <i class="far fa-envelope-open-text ml-3 mr-2"></i>客服中心</div>
                    <ul class="collapse navbar-nav" id="sideNavColl07" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">客服訊息管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/Question/ListAll.jsp">Q&A管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl08">
                        <i class="fas fa-address-card ml-3 mr-2"></i>員工管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl08" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/protected/adm/listAllAdm.jsp">員工帳號管理</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link pl-4" href="<%=request.getContextPath()%>/back-end/protected/adm/addAdm.jsp">新增員工</a>
                        </li>
                       
                    </ul>
                </li>
            </ul>
        </aside>
</div>