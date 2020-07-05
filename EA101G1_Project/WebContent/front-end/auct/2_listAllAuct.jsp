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
<html>
<head>
<meta charset="UTF-8">
<title>所有商品資料 - listAllAuct.jsp</title>

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
	width: 800px;
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
<body bgcolor='white'>

	<table id="table-1">
		<tr><td>
			 <h3>所有競標商品資料 - listAllAuct.jsp</h3>
			 <h4><a href="<%=request.getContextPath()%>/front-end/auct/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
		</td></tr>
	</table>
	
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

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
		<th>商品售出狀態</th>
		<th>上下架狀態</th>
		
		
	</tr>
	<%@ include file="../../files/page1.file" %> 
	<c:forEach var="auctVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
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
			
			<td><fmt:formatDate value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
			
			<td><fmt:formatDate value="${auctVO.auct_end}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			
			<td>${auctVO.marketPrice}</td>
			<td>${auctVO.initPrice}</td>
			<td>${auctVO.auct_inc}</td>
			
			<td>
				<img src="<%=request.getContextPath()%>/auct/pic.do?auct_id=${auctVO.auct_id}" width="100px">
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
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auct/auct.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="auct_id"  value="${auctVO.auct_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auct/auct.do" style="margin-bottom: 0px;">
			     <input type="submit" value="下架">
			     <input type="hidden" name="auct_id"  value="${auctVO.auct_id}">
			     <input type="hidden" name="action" value="update_down"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auct/auct.do" style="margin-bottom: 0px;">
			     <input type="submit" value="上架">
			     <input type="hidden" name="auct_id"  value="${auctVO.auct_id}">
			     <input type="hidden" name="action" value="update_up"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="../../files/page2.file" %>




</body>
</html>