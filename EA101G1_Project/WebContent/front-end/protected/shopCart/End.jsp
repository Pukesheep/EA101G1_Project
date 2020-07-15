<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopCart.model.PRODUCT" %>
<%@page import="com.member.model.*"%>
<%@page import="com.productOrderList.model.*"%>

<% 
String card = (String)request.getParameter("card");
%>
<%=card %>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>確認結帳</title>
 <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="./img/ICON.ico">
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

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
        
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	
 <style>
 		font{
 		font-family:Microsoft JhengHei;
 		}
 		
 		div{
 		text-align:center;
 		}
 		
 		#head font{
 		color:white;
 		}
 		
		div.col-2>img{
			width: 100%;
		}
		
		div.col-12>img{
			width: 20%;
		}
		hr.class-1 { 
            border-top: 5px solid #8c8b8b; 
            width:2000;
        } 
		
 </style>
</head>
<!-- navbar -->
    <%@ include file="/../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    
    <!-- 內容 -->
    <section class="blank1">
<div class="container">
	<div class="row"><font style="color:#E0E0E0;font-size:40px">購買商品</font ><hr class="class-1" /></div>
   		<div class="row justify-content bg-primary mb-3 rounded" id="head" style="height:40px">
   			<div class="col-5 align-self-center"><font>商品明細</font></div>
   			<div class="col-1 align-self-center"><font>價格</font></div>
   			<div class="col-2 align-self-center"><font>數量</font></div>
   			<div class="col-4 align-self-center"><font>小計</font></div>
   		</div>
   		<%
		Vector<PRODUCT> buylist = (Vector<PRODUCT>) session.getAttribute("shoppingcart");
		Double amount =  (Double) session.getAttribute("amount");
		
		List<PolVO> list = new ArrayList<PolVO>();
	%>	
	<%	for (int i = 0; i < buylist.size(); i++) {
			PRODUCT order = buylist.get(i);
			String name = order.getName();
			Double price= order.getPrice();
			Integer quantity = order.getQuantity();
			Double sub =order.getSub();
			String p_id = order.getId();
			
			PolVO polvo = new PolVO();
			polvo.setP_id(p_id);
			polvo.setOrder_qua(quantity);
			polvo.setP_price(price);
			
			
			list.add(polvo);
	%>
   		<div class="row justify-content mb-2 bg-white rounded">
   			<div class="col-2 align-self-center"><img src="<%=request.getContextPath()%>/shopCart/ShopCartPic.do?p_id=<%=order.getId()%>"></div>
   			<div class="col-3 align-self-center"><a href="<%=request.getContextPath()%>/front-end/product/listOneProduct.jsp?p_id=<%=p_id%>"><font><%=name%></font></a></div>
   			<div class="col-1 align-self-center"><font>$<fmt:formatNumber pattern="#" value="<%=price%>" /></font></div>
   			<div class="col-2 align-self-center"><font><%=quantity%></font></div>
   			<div class="col-4 align-self-center"><font>$<fmt:formatNumber pattern="#" value="<%=sub%>" /></font></div>
   		</div>
   		<%
		}
	session.setAttribute("list",list);
	%>	
		<div class="row justify-content-end rounded" style="background-color:white;height:60px;margin-bottom:2px">
			<div class="col-3 align-self-center">總金額:<font style="font-size: 1.5em;color:#ff5353">NT$<fmt:formatNumber pattern="#" value="<%=amount%>" /></font></div>
		</div>
		
		<%
		Double ratio = 0.1;
		Double mem_bonus = amount*ratio;
		%>
		<div class="row justify-content-end rounded" style="background-color:white;height:60px;margin-bottom:2px">
			<div class="col-3 align-self-center"><img style="width:20px" src="<%=request.getContextPath()%>/front-end/protected/shopCart/image/tokens.png">可獲得紅利:<font style="font-size: 1.5em;color:#ffd700"><fmt:formatNumber pattern="#" value="<%=mem_bonus%>" /></font>點</div>
		</div>
				
   		<div class="row justify-content-end rounded" style="background-color:#c6d4df">
   			<div class="col-2 align-self-center"></div>
   			<div class="col-2 align-self-center"></div>
   			<div class="col-2 align-self-center">

   			</div>
   			<div class="col-3">
   			<div class="row p-3">
		   		<div class="col-6 align-self-center mt-3">
		   		</div>
		   		<div class="col-6 align-self-start mt-3"><a class="btn btn-primary" id="end" href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">繼續購物</a><div>
		   		</div>
   			</div>
   			</div>
   		</div>
   		

	</div>
	<script>
$(#end).click(function(){
	<%session.removeAttribute("shoppingcart");%>
});
</script>
	</section>
</body>
</html>