<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.comm.model.*" %>

<%
	CommVO commVO = (CommVO) request.getAttribute("commVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
<title>留言資料新增 - addComm.jsp</title>

<style>
	table#table-1 {
		width: 100%;
		background-color: #CCCCFF;
		border: 2px solid black;
		text-align: center;
	}
	table#table-1 h4 {
		color: red;
		display: block;
		matgin-bottom: 1px;
	}
	h4 {
		color: blue;
		display: inline;
	}
	table {
		width: 100%;
		background-color: white;
		margin-top: 1px;
		margin-bottom: 1px;
		text-align: center;
	}
	table, th, td {
		border: 0px solid #CCCCFF;
	}
	th, td {
		padding: 1px;
	}
	body {
		background-color: white;
	}
	#back {
		width: 100px;
		height: 32px;
	}
	font {
		color: red;
	}
	li {
		color: red;
	}
	#tomcat {
		width: 100px;
		height: 100px;
	}
	#display {
		width: 200px;
		height: 200px;
	}
	textarea {
		width: 500px;
	}
	td {
		text-align: left;
	}
</style>

</head>
<body>

<table id="table-1">
	<tr>
		<td>
			<h3>留言資料新增 - addComm.jsp</h3>
		</td>
		<td>
			<h4><a href="<%=request.getContextPath()%>/front-end/comm/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/tomcat.png" id="tomcat">回首頁</a></h4>
		</td>
	</tr>
</table>

<h3>資料新增</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font>請修正以下錯誤：</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>
				${message}
			</li>
		</c:forEach>
	</ul>
</c:if>

<form action="<%=request.getContextPath()%>/comm/comm.do" method="post" name="form1">

	<table>
		<tr>
			<td>
				文章編號：
			</td>
			<td>
				<input type="text" name="post_id" size="45" value="<%= (commVO == null) ? "POST000007" : commVO.getPost_id() %>">
			</td>
		</tr>
		<tr>
			<td>
				會員編號：
			</td>
			<td>
				<input type="text" name="mem_id" size="45" value="<%= (commVO == null) ? "M000005" : commVO.getMem_id() %>">
			</td>
		</tr>
		<tr>
			<td>
				留言狀態：
			</td>
			<td>
				<select name="c_status">
					<option value="0" ${commVO.c_status eq 0 ? "selected" : "" }>隱藏</option>
					<option value="1" ${commVO.c_status ne 0 ? "selected" : "" }>顯示</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				留言內容：
			</td>
			<td>
				<textarea name="c_text" rows="5" cols="500"><%= (commVO == null) ? "請輸入留言內容" : commVO.getC_text() %></textarea>
			</td>
		</tr>
		<tr>
			<td>
				最後修改時間：
			</td>
			<td>
				<input type="text" name="last_edit" id="f_date1">
			</td>
		</tr>
		<tr>
			<td>
				留言時間：
			</td>
			<td>
				<input type="text" name="post_time" id="f_date2">
			</td>
		</tr>	
	
	</table>
	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" name="送出新增">

</form>

</body>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%
	java.sql.Timestamp last_edit = null;
	java.sql.Timestamp post_time = null;
	
	try {
		last_edit = commVO.getLast_edit();
		post_time = commVO.getPost_time();
	} catch (Exception e) {
		last_edit = new java.sql.Timestamp(System.currentTimeMillis());
		post_time = new java.sql.Timestamp(System.currentTimeMillis());
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
   	       timepicker:true,       //timepicker:true,
   	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
   	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
   		   value: '<%=last_edit%>', // value:   new Date(),
             //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
             //startDate:	            '2017/07/10',  // 起始日
             //minDate:               '-1970-01-01', // 去除今日(不含)之前
             //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
          });
         
         $('#f_date2').datetimepicker({
             theme: '',              //theme: 'dark',
   	       timepicker:true,       //timepicker:true,
   	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
   	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
   		   value: '<%=post_time%>', // value:   new Date(),
             //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
             //startDate:	            '2017/07/10',  // 起始日
             //minDate:               '-1970-01-01', // 去除今日(不含)之前
             //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
          });
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

</script>

</html>