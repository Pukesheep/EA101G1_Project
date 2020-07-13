<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shopCart.model.*" %>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>購物車</title>
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

		
 </style>
</head>
<body >
<!-- navbar -->
<%--     <%@ include file="/../../files/header.jsp" %> --%>
    <!-- navbar end -->
    <section class="blank0"></section>
    
    <!-- 內容 -->
    <section class="blank1">
   <div class="container">
   		<div class="row justify-content bg-primary mb-3 rounded" id="head" style="height:40px">
   			<div class="col-5 align-self-center"><font>商品明細</font></div>
   			<div class="col-1 align-self-center"><font>價格</font></div>
   			<div class="col-2 align-self-center"><font>數量</font></div>
   			<div class="col-1 align-self-center"><font>庫存</font></div>
   			<div class="col-2 align-self-center"><font>小計</font></div>
   			<div class="col-1 align-self-center"><font>操作</font></div>
   		</div>
   		
   		<%Vector<PRODUCT> buylist = (Vector<PRODUCT>) session.getAttribute("shoppingcart");%>
		<%if (buylist != null && (buylist.size() > 0)) {%>
		
		
   		<%
	 for (int index = 0; index < buylist.size(); index++) {
		PRODUCT order = buylist.get(index);
	%>
   		<div class="row justify-content mb-2 bg-white rounded">
   			<div class="col-2 align-self-center"><img src="<%=request.getContextPath()%>/shopCart/ShopCartPic.do?p_id=<%=order.getId()%>"></div>
   			<div class="col-3 align-self-center"><a href="<%=request.getContextPath()%>/front-end/product/listOneProduct.jsp?p_id=<%=order.getId()%>"><font><%=order.getName()%></font></a></div>
   			<div class="col-1 align-self-center"><font>$<%=order.getPrice()%></font></div>
   			<div class="col-2 align-self-center"><font><%=order.getQuantity()%></font></div>
   			<div class="col-1 align-self-center"><font><%=order.getStock()%></font></div>
   			<div class="col-2 align-self-center"><font><%=order.getSub()%></font></div>
   			<div class="col-1 align-self-center">
   			<form name="deleteForm" action="<%=request.getContextPath()%>/shopCart/Shopping.do" method="POST">
              <input type="hidden" name="action" value="DELETE">
              <input type="hidden" name="del" value="<%= index %>">
              <input type="hidden" name="url" value="<%=request.getRequestURI()%>">
              <input class="btn btn-primary" type="submit" value="刪除">
          </form>
   			</div>
   		</div>
   		<%}%>
   		<div class="row justify-content-end rounded" style="background-color:#c6d4df" style="height:80px">
   			<div class="row p-3">
		   		<div class="col-6 align-self-center mt-3">
		   		 <form name="checkoutForm" action="<%=request.getContextPath()%>/shopCart/Shopping.do" method="POST">
		              <input type="hidden" name="action" value="CHECKOUT"> 
		              <input class="btn btn-primary" type="submit" value="付款結帳">
		          </form>
		   		</div>
		   		<div class="col-6 align-self-start mt-3"><a class="btn btn-primary" href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp">繼續購物</a><s/div>
		   		</div>
   			</div>
   		</div>
   		<%}else{%>
		
   			<div class="row justify-content mt-5"><div class="col-12 align-self-center"><img src="<%=request.getContextPath()%>/images/cart.png"></div></div>
   			<div class="row justify-content"><div  class="col-12 align-self-center" style="opacity: 0.5; font-size:20px">購物車裡還沒有商品喔</div></div>
   			<div class="row justify-content"><div class="col-12 align-self-center"><a class="btn btn-primary" href="<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp" role="button">前往購物</a></div></div>
		<%}%>
	</div>
	</section>
</body>
</html>