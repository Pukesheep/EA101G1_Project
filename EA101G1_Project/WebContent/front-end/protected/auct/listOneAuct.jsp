<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.auct.model.*"%>

<%
    AuctService auctSvc = new AuctService();
    List<AuctVO> list = auctSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品管理</title>
    <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="images/ICON(yellow).ico">
    <!-- Bootstrap官方網站 https://getbootstrap.com/ -->
    <!-- 連結Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 使用font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- 使用google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- 使用style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/insert_auct.css">

    <!-- 連結Bootstrap所需要的js -->
    <!-- jquery.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- popper.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <!-- bootstrap.min.js -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

    <style>
        .add-btn{
            position: relative; top:60px; left: 30px; 
        }     
    </style>

</head>

<body>

    <!-- 賣家商品管理頁面 -->
    <section class="banner pt-3 text-center ">
        <div class="row">
            <div class="LOGO col-md-2 pl-5 mt-2">
                <div>
                    <a class="navbar-brand" href="../index.html">
                        <span class="logo"><i class="fas fa-bomb"></i></span>
                        <span class="logo2">S.F.G</span>
                        <span class="logo3">{{{</span>
                    </a>
                </div>
            </div>

            <div class="col-md-8 mt-3">
                <h2>我的拍賣區 --- 競標商品管理</h2>              
            </div>
    <!-- 競標訂單 -->
            <a href="listAllAuct.jsp">
                <button class="add-btn btn btn-outline-warning mx-3" class="bg-primary">
                    <h6 class="backbtn">商品管理</h6>
                </button>
            </a>
    <!-- 新增商品 -->
            <a href="insert_auct.jsp">
                <button class="add-btn btn  btn-outline-light" class="bg-primary">
                    <h6 class="backbtn">繼續新增</h6>
                </button>
            </a>
        </div>
    </section>

    <!-- 賣家商品管理頁面 end-->
    <section class="section-2  mb-5">
        <table class="table table-striped table-dark text-center">
            <thead>
                <tr>
                    <th scope="col">拍賣編號</th>
                    <th scope="col">商品名稱</th>
                    <th scope="col">商品類別</th>
                    <th scope="col">賣家ID</th>
                    <th scope="col">賣家名稱</th>
                    <th scope="col">競標開始時間</th>
                    <th scope="col">競標結束時間</th>
                    <th scope="col">市價</th>
                    <th scope="col">起拍價</th>
                    <th scope="col">出價增額</th>
                    <th scope="col">商品圖片</th>
                    <th scope="col">商品描述</th>
                    <th scope="col">售出狀態</th>
                    <th scope="col">上下架狀態</th> 
                </tr>
            </thead>

            <tbody>

<!-- JSTL for-each -->
              <tr>
                <th>${auctVO.auct_id}</th>
                <td>${auctVO.auct_name}</td>
                <td>${PtSvc.getOneProductType(auctVO.pt_id).typename}</td>
                <td>${auctVO.sale_id}</td>
                <td>${MemberSvc.getOneMember(auctVO.sale_id).mem_name}</td>
                <td> <fmt:formatDate value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
                <td> <fmt:formatDate value="${auctVO.auct_end}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
                <td>${auctVO.marketPrice}</td>
                <td>${auctVO.initPrice}</td>
                <td>${auctVO.auct_inc}</td>
			
				<td>
					<img src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" width="100px">
				</td>
				
				<td>${auctVO.auct_desc}</td>
				
				<td>
					<c:if test="${auctVO.auct_sold == 0}">
						<c:out value="未售出"></c:out>
					</c:if>
					<c:if test="${auctVO.auct_sold == 1}">
						<c:out value="售出"></c:out>
					</c:if>
				</td>
				<td>
					<c:if test="${auctVO.auct_down == 0}">
						<c:out value="上架"></c:out>
					</c:if>
					<c:if test="${auctVO.auct_down == 1}">
						<c:out value="下架"></c:out>
					</c:if>
				</td>

                

                 <td></td>
              </tr>

	        </tbody>
	        
	</table>
<!-- JSTL for-each   end-->

    </div>  
    
    </section>

    <a href="Auct_index.jsp">
        <button id="goBackBtn" class="bg-primary">
            <h6 class="backbtn">BID</h6>
        </button>
    </a>
    
</body>
</html>