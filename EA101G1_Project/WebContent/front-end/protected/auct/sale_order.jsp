<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>

<%
	AuctService auctSvc = new AuctService();

	MemberVO memVO = (MemberVO)session.getAttribute("memberVO");
	String sale_id = memVO.getMem_id();

    List<AuctVO> list = auctSvc.getSaleOrderList(sale_id);
    pageContext.setAttribute("list",list);
%>


<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="OrdstatSvc" scope="page" class="com.ordstat.model.OrdstatService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單管理</title>
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
        body:after{
		    background: #dbebfa;
		}
         
    </style>

</head>

<body>

    <!-- 賣家商品管理頁面 -->
    <section class="banner pt-3 text-center ">
        <div class="row">
            <div class="LOGO col-md-2 pl-5 mt-2">
                <div>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/front-end/index.jsp">
                        <span class="logo"><i class="fas fa-bomb"></i></span>
                        <span class="logo2">S.F.G</span>
                        <span class="logo3">{{{</span>
                    </a>
                </div>
            </div>

            <div class="col-md-8 mt-3">
                <h2>我的拍賣區 --- 訂單管理</h2>              
            </div>
    <!-- 回拍賣管理 -->
            <a href="<%=request.getContextPath()%>/front-end/protected/auct/listAllAuct.jsp">
                <button class="add-btn btn btn-outline-warning mx-3" class="bg-primary">
                    <h6 class="backbtn">回拍賣管理</h6>
                </button>
            </a>
   
        </div>
    </section>

    <!-- 賣家商品管理頁面 end-->
    <section class="section-2  mb-5">
 		<table class="table table-striped table-secondary text-center">
		  <thead>
		    <tr>
		    	
		  		<th scope="col">拍賣編號</th>
                <th scope="col">商品名稱</th>
                <th scope="col">商品圖片</th>
                <th scope="col">贏家ID</th>
                <th scope="col">贏家名稱</th>
                <th scope="col">拍賣金額</th>
                <th scope="col">訂單時間</th>
                <th scope="col">訂單狀態</th>
                <th scope="col">出貨</th>
                
		    </tr>
		  </thead>
		  
		  <tbody>
		  
<!-- JSTL for-each -->
 <%@ include file="page1.file" %> 
<c:forEach var="auctVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">	 
		  
		    <tr>
		      <th scope="row">${auctVO.auct_id}</th>
		      <td>${auctVO.auct_name}</td>
		      <td>
		      	 <img src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" width="100px">
		      </td>
		      
		      <td>${auctVO.buy_id}</td>
		      <td>${MemberSvc.getOneMember(auctVO.buy_id).mem_name}</td>
		      <td>${auctVO.maxPrice}</td>
		      <td>${auctVO.ord_time}</td>
		      <td>${OrdstatSvc.listOneOrdstat(auctVO.ordstat_id).ordstat}</td>
		      <td>
		     	 <c:if test="${auctVO.ordstat_id==003}">   <!-- 已付款,待出貨 -->
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/auct/auct.do" style="margin-bottom: 0px;">
				          <input class="btn btn-info" type="submit" value="出貨">
				          <input type="hidden" name="auct_id"  value="${auctVO.auct_id}">
				          <input type="hidden" name="action"	value="update_ordstat">
				      </FORM>
			     </c:if>
			      
			     <c:if test="${auctVO.ordstat_id==002}">   <!-- 待付款 -->
	                  <input class="btn btn-dark" type="submit" value="出貨" disable>
	             </c:if>
			     <c:if test="${auctVO.ordstat_id==005}">   <!-- 待收貨 -->
	                  <input class="btn btn-dark" type="submit" value="出貨" disable>
	             </c:if>
			 </td>
		    </tr>
	
		  </tbody>
</c:forEach>
<!-- JSTL for-each   end-->

		</table>
		
<%@ include file="page2.file" %>
    
    </section>
    

    <a href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp">
        <button id="goBackBtn" class="bg-primary">
            <h6 class="backbtn">BID</h6>
        </button>
    </a>
    
</body>
</html>