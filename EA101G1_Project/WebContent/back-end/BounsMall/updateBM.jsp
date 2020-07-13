<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.BounsMall.model.*" %>
<%@ page import="com.productType.model.*" %>

<% BMVO bmVO = (BMVO) request.getAttribute("bmVO"); %>

<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>修改紅利商品訊息</title>

<style>
	table#table-1 {
		background-color: #CCCCFF;
		border:2px solid black;
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
	table, th, td{
		border: 1px solid #CCCCFF;
	}
	th, td {
		padding: 5px;
		text-align: center;
	}
	img#display {
		width: 200px;
	}
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		<h3>修改紅利商品訊息</h3>
		<h4><a href="<%=request.getContextPath()%>/back-end/BounsMall/ListAll.jsp"><img src="<%=request.getContextPath()%>/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
</table>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form method="post" action="<%=request.getContextPath()%>/BounsMall/BounsMall.do" name="form1" enctype="multipart/form-data">
	<table>
		<tr>
			<td>紅利商品編號：<font color=red><b>*</b></font></td>
<%-- 			<td><%=bmVO.getBon_id()%></td> --%>
			<td>${bmVO.bon_id}</td>
		</tr>
		
		<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService"/>
		<tr>
			<td>商品分類編號：<font color="red"><b>*</b></font></td>
			<td>
				<select size="1" name="pt_id">
<%-- 					<c:forEach var="bmVO" items="${bmSvc.all}"> --%>
					<c:forEach var="ptVO" items="${ptSvc.all}">
<%-- 							<option value="${bmVO.pt_id}" ${(bmVO.pt_id==PtVO.pt_id)? 'select':''}>${PtVO.typename} --%>
							<option value="${ptVO.pt_id}" ${(bmVO.pt_id == ptVO.pt_id) ? 'selected' : '' }>${ptVO.typename}</option>
					</c:forEach>
<%-- 					</c:forEach> --%>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>紅利商品名稱：</td>
<%-- 			<td><input type="text" name="bon_name" size="45" value=<%=bmVO.getBon_name()%> /></td> --%>
			<td><input type="text" name="bon_name" size="45" value="${bmVO.bon_name}" /></td>
		</tr>
		<tr>
			<td>所需紅利點數：</td>
<%-- 			<td><input type="text" name="bon_price" size="45" value=<%=bmVO.getBon_price()%> /></td> --%>
			<td><input type="text" name="bon_price" size="45" value="${bmVO.bon_price}" /></td>
		</tr>
		<tr>
			<td>紅利商品圖片：</td>
			<td>
				<input type="file" name="bon_image" />
				<img src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${bmVO.bon_id}" id="display">
			</td>
		</tr>
		<tr>
			<td>紅利商品描述：</td>
<%-- 			<td><input type="text" name="bon_info" size="45" value=<%=bmVO.getBon_info()%> /></td> --%>
<%-- 			<td><input type="text" name="bon_info" size="45" value="${bmVO.bon_info}" /></td> --%>
			<td><textarea rows="5" cols="50" name="bon_info">${bmVO.bon_info}</textarea></td>
		</tr>
		<tr>
			<td>已兌換數量：</td>
<%-- 			<td><input type="text" name="bon_exchange" size="45" value=<%=bmVO.getBon_exchange()%> /></td> --%>
			<td><input type="text" name="bon_exchange" size="45" value="${bmVO.bon_exchange}" /></td>
		</tr>
		<tr>
			<td>現有總庫存：</td>
<%-- 			<td><input type="text" name="bon_stock" size="45" value=<%=bmVO.getBon_stock()%>/></td> --%>
			<td><input type="text" name="bon_stock" size="45" value="${bmVO.bon_stock}"/></td>
		</tr>
		
		<tr>
			<td>上架日期：</td>
			<td><input name="bon_addDate" id="f_date1" type="text"/></td>
		</tr>
		
		<tr>
			<td>紅利商品上架狀態：</td>
<%-- 			<td><input type="text" name="bon_status" size="45" value=<%=bmVO.getBon_status()%>/></td> --%>
			<td><select size="1" name="bon_stat">
				<option value=0 ${(bon_stat==0)? 'selected':''}>上架
				<option value=1 ${(bon_stat==1)? 'selected':''}>下架
			</select></td>
		</tr>
	</table>

<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="bon_id" value="${bmVO.bon_id}">
<input type="submit" value="送出修改">
</form>
</body>


<% 
  java.sql.Date hiredate = null;
  try {
	    hiredate = java.sql.Date.valueOf(request.getParameter("hiredate").trim());
   } catch (Exception e) {
	    hiredate = new java.sql.Date(System.currentTimeMillis());
   }
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
 	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '${bmVO.bon_addDate}', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
</script>

</html>