<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.immed.model.*"%>

<%
	ImmedVO immedVO = (ImmedVO) request.getAttribute("immedVO"); //ImmedServlet.java (Concroller) 存入req的immedVO物件 (包括幫忙取出的immedVO, 也包括輸入資料錯誤時的immedVO物件)
%>

<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<title>直購商品修改 - update_immed_jsp</title>
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

table td {
	width: 100%;
}

table td img.immed_pic {
	width: 150px;
}

h4 {
	color: blue;
	display: inline;
}

td.previewTd {
	display: flex;
	flex-direction: column-reverse;
}

.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

</head>
<body>

	<table id="table-1">
		<tr>
			<td>
				<h3>直購商品資料修改 - update_immed_input.jsp</h3>
				<h4>
					<a href="select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>直購商品資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form METHOD="post" ACTION="immed.do" name="form1"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>直購商品編號:<font color=red><b>*</b></font></td>
				<td><input type="hidden" name="immed_id"
					value="<%=immedVO.getImmed_id()%>"><%=immedVO.getImmed_id()%></td>
			</tr>
			<tr>
				<td>賣家編號:</td>
				<td><input type="hidden" name="sale_id"
					value="<%=immedVO.getSale_id()%>"><%=immedVO.getSale_id()%></td>
			</tr>
			<tr>
				<td>買家編號:</td>
				<td><input type="TEXT" name="buy_id" value="${immedVO.buy_id}"></td>
			</tr>
			<tr>
				<td>直購商品種類編號:</td>
				<td><input type="TEXT" name="pt_id"
					value="<%=immedVO.getPt_id()%>"></td>
			</tr>
			<tr>
				<td>直購商品名稱:</td>
				<td><input type="TEXT" name="immed_name"
					value="<%=immedVO.getImmed_name()%>"></td>
			</tr>
			<tr>
				<td>商品直購價:</td>
				<td><input type="TEXT" name="immed_prc"
					value="<%=immedVO.getImmed_prc()%>"></td>
			</tr>
			<tr>
				<td>直購商品圖片:</td>
				<td class="previewTd"><input type="file"
					onchange="readURL(this)" name="immed_pic" targetID="preview_img"
					accept="image/gif, image/jpeg, image/png"> <img
					style="width: 200px;" id="preview_img"
					src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"></td>
			</tr>
			<tr>
				<td>直購商品描述:</td>
				<td><textarea style="width: 350px; height: 250px;"
						name="immed_desc" id="fimmed_desc"
						value="<%=immedVO.getImmed_desc()%>"><%=immedVO.getImmed_desc()%></textarea></td>
			</tr>
			<tr>
				<td>訂單時間:</td>
				<td><input name="ord_time" id="ford_time" type="text"
					value="<%=immedVO.getOrd_time()%>"></td>
			</tr>

			<jsp:useBean id="ordstatSvc" scope="page"
				class="com.ordstat.model.OrdstatService" />
			<tr>
				<td>訂單狀態編號:</td>
				<td><select name="ordstat_id" size="1">
						<c:forEach var="ordstatVO" items="${ordstatSvc.all}">
							<option value="${ordstatVO.ordstat_id}"
								${(immedVO.ordstat_id==dordstatVO.ordstat_id)?'selected':'' }>${ordstatVO.ordstat}</option>
						</c:forEach>
				</select></td>
			<tr>
				<td>商品售出狀態:</td>
				<td><input name="immed_sold" id="fimmed_sold" type="text"
					value="<%=immedVO.getImmed_sold()%>"></td>
			</tr>
			<tr>
				<td>商品下架狀態:</td>
				<td><input name="immed_down" id="fordstat_id" type="text"
					value="<%=immedVO.getImmed_down()%>"></td>
			</tr>
			<tr>
				<td>收件人姓名:</td>
				<td><input name="rcpt_name" id="fimmed_sold" type="text"
					value="${immedVO.rcpt_name}"></td>
			</tr>
			<tr>
				<td>收件人電話:</td>
				<td><input name="rcpt_cell" id="fimmed_sold" type="text"
					value="${immedVO.rcpt_cell}"></td>
			</tr>
			<tr>
				<td>收件人地址:</td>
				<td><input name="rcpt_add" id="fimmed_sold" type="text"
					value="${immedVO.rcpt_add}"></td>
			</tr>
		</table>
		<br> 
		<input type="hidden" name="from" value="back-end">
		<input type="hidden" name="action" value="update"> <input
			type="submit" value="送出修改">
	</form>

	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var img_box = document.getElementById('preview_img');
				img_box.setAttribute('style',
						'display:inline-block; width:200px;');
				var imageTagID = input.getAttribute("targetID");
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = document.getElementById(imageTagID);
					img.setAttribute("src", e.target.result)
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>

	<script>
        $.datetimepicker.setLocale('zh');
        $('#ford_time').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 		   value: '<%=immedVO.getOrd_time()%>',
			// value:   new Date(),
			//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
			//startDate:	            '2017/07/10',  // 起始日
			minDate : '-1970-01-01', // 去除今日(不含)之前
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
</body>
</html>