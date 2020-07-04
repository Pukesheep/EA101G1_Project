<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.auct.model.*"%>

<%
  AuctVO auctVO = (AuctVO) request.getAttribute("auctVO"); //AuctServlet.java(Controller), 存入req的auctVO物件
%>

<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>競標商品資料 - listOneAuct.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body  bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>競標商品資訊 - ListOneAuct.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

	<table>
		<tr>
			<th>競標商品編號</th>
			<th>競標商品名稱</th>
			<th>商品類別</th>
			<th>賣家ID</th>
			<th>賣家名稱</th>
			<th>競標開始時間</th>
			<th>競標結束時間</th>
			<th>市價</th>
			<th>起拍價</th>
			<th>出價增額</th>
			<th>商品圖片</th>
			<th>商品描述</th>
	
	
		</tr>
				
		<tr>
			<td>${auctVO.auct_id}</td>
			<td>${auctVO.auct_name}</td>
			
			<td>
				${PtSvc.getOneProductType(auctVO.pt_id).typename} 
			</td>
			
			<td>${auctVO.sale_id}</td>
			<td>
				${MemberSvc.getOneMember(auctVO.sale_id).mem_name} 
			</td>
			
			<td><fmt:formatDate value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td><fmt:formatDate value="${auctVO.auct_end}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			
			<td>${auctVO.marketPrice}</td>
			<td>${auctVO.initPrice}</td>
			<td>${auctVO.auct_inc}</td>
			
			<td>
				<img src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" style="width:100px;">
			</td>
			
			<td>${auctVO.auct_desc}</td>
			
		</tr>
	</table>


</body>
</html>