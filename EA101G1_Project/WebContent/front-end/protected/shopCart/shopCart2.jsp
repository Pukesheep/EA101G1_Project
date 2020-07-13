<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shopCart.model.*" %>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�ʪ���</title>
 <!-- TODO: ��title ��icon -->
    <link rel="icon shortcut" href="./img/ICON.ico">
    <!-- Bootstrap�x����� https://getbootstrap.com/ -->
    <!-- �s��Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
    <!-- �ϥ�font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- �ϥ�google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- �ϥ�style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

    <!-- �s��Bootstrap�һݭn��js -->
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
		b>img{
			width: 100px;
			hieight:100px;
		}
		th{
		
		}
 </style>
</head>
<body >
<!-- navbar -->
    <%@ include file="/../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    
    <!-- ���e -->
    <section class="blank1">
    <div class="container main">
<table  width="740" border="1">
	<tr bgcolor="#999999" style="width:740px;display:flex">
		<th width="500" colspan="2"><div align="center">�ӫ~����</div></th>
		<th width="100"><div align="center">����</div></th>
		<th width="100"><div align="center">�ƶq</div></th>
		<th width="100"><div align="center">�w�s</div></th>
		<th width="120"><div align="center">�p�p</div></th>
		<th width="120"></th>
	</tr>
<%Vector<PRODUCT> buylist = (Vector<PRODUCT>) session.getAttribute("shoppingcart");%>
<%if (buylist != null && (buylist.size() > 0)) {%>
<img src="images/tomcat.gif"> <font size="+3">�ثe�z�ʪ��������e�p�U�G</font><p>



	
	<%
	 for (int index = 0; index < buylist.size(); index++) {
		PRODUCT order = buylist.get(index);
	%>
	<tr bgcolor="#ffffff" style="display:block;margin-top:6px;width:740px" >
		<td width="300"><div align="center"><b><img src="<%=request.getContextPath()%>/shopCart/ShopCartPic.do?p_id=<%=order.getId()%>"></b></div></td>
		<td width="200"><div align="center"><b><%=order.getName()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getPrice()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getQuantity()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getStock()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getSub()%></b></div></td>
		
		<td width="100"><div align="center">
          <form name="deleteForm" action="<%=request.getContextPath()%>/shopCart/Shopping.do" method="POST">
              <input type="hidden" name="action" value="DELETE">
              <input type="hidden" name="del" value="<%= index %>">
              <input type="hidden" name="url" value="<%=request.getRequestURI()%>">
              <input type="submit" value="�R��">
          </form>
              </div>
        </td>
	</tr>
	<%}%>
</table>
<p>
          <form name="checkoutForm" action="<%=request.getContextPath()%>/shopCart/Shopping.do" method="POST">
              <input type="hidden" name="action"	value="CHECKOUT"> 
              <input type="submit" value="�I�ڵ��b">
          </form>
<%}else{%>
	<table border="1" width="740">�L�ӫ~</table>
<%}%>
	<p><a href="<%=request.getContextPath() %>/front-end/product/listAllProduct.jsp">�O�_�~���ʪ�</a></p>
	</div>
	</section>
</body>
</html>