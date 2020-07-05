<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.groupBuy.model.*"%>

<%
  GroupBuyVO groupBuyVO = (GroupBuyVO) request.getAttribute("groVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工資料修改 - update_gro_input.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>員工資料修改 - update_gro_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/groupbuy/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/groupBuy/groupbuy.do" name="form1">
<table>
	<tr>
		<td>團購案:<font color=red><b>*</b></font></td>
		<td><%=groupBuyVO.getGro_Id()%></td>
	</tr>
    <tr>
		<td>商品編號:</td>
		<td><input type="TEXT" name="p_Id" size="45" value="<%=groupBuyVO.getP_Id()%>" /></td>
	</tr>
	<tr>
		<td>折扣1:</td>
		<td><input type="TEXT" name="reb1_No" size="45"	value="<%=groupBuyVO.getReb1_No()%>" /></td>
	</tr>
	<tr>
		<td>折扣2:</td>
		<td><input type="TEXT" name="reb2_No" size="45"	value="<%=groupBuyVO.getReb2_No()%>" /></td>
	</tr>
	<tr>
		<td>折扣3:</td>
		<td><input type="TEXT" name="reb3_No" size="45"	value="<%=groupBuyVO.getReb3_No()%>" /></td>
	</tr>
	<tr>
		<td>開始日期:</td>
		<td><input name="start_Date" id="s_date1" type="text" ></td>
	</tr>
	<tr>
		<td>結束日期:</td>
		<td><input name="end_Date" id="f_date1" type="text" ></td>
	</tr>
	<tr>
		<td>團購期間:</td>
		<td><input type="TEXT" name="grotime_Date" size="45"value="<%=groupBuyVO.getGrotime_Date()%>" /></td>
	</tr>
	<tr>
		<td>團購狀態:</td>
		<td><input type="TEXT" name="status" size="45"	value="<%=groupBuyVO.getStatus()%>" /></td>
	</tr>
	<tr>
		<td>人數:</td>
		<td><input type="TEXT" name="people" size="45"	value="<%=groupBuyVO.getPeople()%>" /></td>
	</tr>
   <tr>
		<td>金額:</td>
		<td><input type="TEXT" name="money" size="45"	value="<%=groupBuyVO.getMoney()%>" /></td>
	</tr>
	
	
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="gro_Id" value="<%=groupBuyVO.getGro_Id()%>">
<input type="submit" value="送出修改"></FORM>

</body>






<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%
	java.sql.Timestamp start_date = null;
	java.sql.Timestamp end_date = null;
	try {
		start_date = groupBuyVO.getStart_Date();
		end_date = groupBuyVO.getEnd_Date();
	} catch (Exception e) {
		start_date = new java.sql.Timestamp(System.currentTimeMillis());
		end_date = new java.sql.Timestamp(System.currentTimeMillis());
	}
	
	
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>
<script>
	$.datetimepicker.setLocale('zh');
	$('#s_date1').datetimepicker({
	   theme: '',              //theme: 'dark',
	   timepicker:true,       //timepicker:true,
	   step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	   format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
	   value: '<fmt:formatDate value="<%=start_date%>" pattern="yyyy-MM-dd HH:mm:ss" />', // value:   new Date(),
	   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	   //startDate:	            '2017/07/10',  // 起始日
	   //minDate:               '-1970-01-01', // 去除今日(不含)之前
	   //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
	$.datetimepicker.setLocale('zh');
	$('#f_date1').datetimepicker({
	   theme: '',              //theme: 'dark',
	   timepicker:true,       //timepicker:true,
	   step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	   format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
	   value: '<fmt:formatDate value="<%=end_date%>" pattern="yyyy-MM-dd HH:mm:ss" />', // value:   new Date(),
	   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	   //startDate:	            '2017/07/10',  // 起始日
	   //minDate:               '-1970-01-01', // 去除今日(不含)之前
	   //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
</script>


</html>