<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.groupBuy.model.*"%>

<%
	GroupBuyVO groupBuyVO = (GroupBuyVO) request.getAttribute("groupBuyVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>團購案新增 - addGroupBuy.jsp</title>

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
		<tr>
			<td>
				<h3>團購案新增 - addGroupBuy.jsp</h3>
			</td>
			<td></td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/groupbuy/select_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>團購新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/groupBuy/groupbuy.do" name="form1">
		<table>
			
			<tr>
				<td>開始時間:</td>
				<td><input name="start_Date" id="s_date1" type="text"></td>
			</tr>
			<tr>
				<td>結束時間:</td>
				<td><input name="end_Date" id="f_date1" type="text"></td>
			</tr>
			<tr>
				<td>團購期間:</td>
				<td><input type="TEXT" name="grotime_Date" size="20"
					value="<%=7%>" /></td>
			</tr>

			<tr>
				<td>團購狀態:</td>
				<td><input type="TEXT" name="status" size="20"
					value="0" /></td>
			</tr>
			<tr>
				<td>人數:</td>
				<td><input type="TEXT" name="people" size="20"
					value="<%=(groupBuyVO == null) ? "" : groupBuyVO.getPeople()%>" /></td>
			</tr>
			<tr>
				<td>金額:</td>
				<td><input type="TEXT" name="money" size="20"
					value="<%=(groupBuyVO == null) ? "" : groupBuyVO.getMoney()%>" /></td>
			</tr>
			<jsp:useBean id="groSvc" scope="page"
				class="com.groupBuy.model.GroupBuyService" />
			    <li>
					<b>折扣一:</b> <select size="1" name="reb1_No">
						<c:forEach var="groupBuy" items="${groSvc.all}">
							<option value="${groupBuy.reb1_No}">${groupBuy.reb1_No}
						</c:forEach>
					</select> 
				</li>
				<li>
					<b>折扣二:</b> <select size="1" name="reb2_No">
						<c:forEach var="groupBuy" items="${groSvc.all}">
							<option value="${groupBuy.reb2_No}">${groupBuy.reb2_No}
						</c:forEach>
					</select> 
			   </li>
				<li>
					<b>折扣三:</b> <select size="1" name="reb3_No">
						<c:forEach var="groupBuy" items="${groSvc.all}">
							<option value="${groupBuy.reb3_No}">${groupBuy.reb3_No}
						</c:forEach>
					</select> 
				</li>
				<li>
					<b>商品編號:</b> <select size="1" name="p_Id">
						<c:forEach var="groupBuy" items="${groSvc.all}">
							<option value="${groupBuy.p_Id}">${groupBuy.p_Id}
						</c:forEach>
					</select> 
				</li>
							 	
				

		</table>
		<br> <input type="hidden" name="action" value="insert"> 
				<input type="submit" value="送出新增">
	</FORM>
	
</body>

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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

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
	
	
	
<%--
	var Today = new Date();
	var somedate1 = new Date(Today.getFullYear() + "-" + (Today.getMonth() + 1)
			+ "-" + Today.getDate());
	$('#s_date1')
			.datetimepicker(
					{
						beforeShowDay : function(date) {
							if (date.getYear() < somedate1.getYear()
									|| (date.getYear() == somedate1.getYear() && date
											.getMonth() < somedate1.getMonth())
									|| (date.getYear() == somedate1.getYear()
											&& date.getMonth() == somedate1
													.getMonth() && date
											.getDate() < somedate1.getDate())) {
								return [ false, "" ]
							}
							return [ true, "" ];
						}
					});
--%>
</script>
</html>
