<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.auct.model.*"%>

<%
  AuctVO auctVO = (AuctVO) request.getAttribute("auctVO");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>新增競標商品 - insert_auct.jsp</title>

<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

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
			 <h3>我的拍賣區 --- 商品管理</h3></td><td>
			 <a href="Auct_index.jsp" class="back-btn"><button type="submit" class="back-btn mb-4">新增商品</button></a>
		     <a href="Auct_index.jsp" class="back-btn"><button type="submit" class="back-btn mb-4">回競標專區</button></a>
		</td></tr>
	</table>

	<h3>資料新增:</h3>
	
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="auct.do" name="form1" enctype = "multipart/form-data">
		<table>
					
			<tr>
				<td>賣家ID:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="sale_id" size="45" value="<%=(auctVO == null)? "M000007" : auctVO.getSale_id()%>" /></td>
			</tr>
			
			
			
			<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />
			<tr>
				<td>商品類別:<font color=red><b>*</b></font></td>
				<td>
					<select size="1" name="pt_id">
						<c:forEach var="ptVO" items="${ptSvc.all}">
							<option value="${ptVO.pt_id}" ${(auctVO.pt_id==ptVO.pt_id)?'selected':'' } >${ptVO.typename}
						</c:forEach>
					</select>
				</td>
			</tr>
	
			<tr>
				<td>商品名稱:</td>
				<td><input type="TEXT" name="auct_name" size="45" value="<%=(auctVO == null)? "商品名稱" : auctVO.getAuct_name()%>" /></td>
			</tr>
			
			<tr>
				<td>競標開始時間: </td>
				<td><input type="text" name="auct_start" id="start_dateTime" ></td>
			</tr>
			
			<tr>
				<td>結束競標時間:</td>
				<td><input type="text" name="auct_end" id="end_dateTime"></td>
			</tr>
			
			<tr>		
				<td>市價:</td>
				<td><input type="TEXT" name="marketPrice" size="45"	value="<%=(auctVO == null)? "1" :auctVO.getMarketPrice()%>" /></td>
			</tr>
			<tr>		
				<td>起拍價:</td>
				<td><input type="TEXT" name="initPrice" size="45"	value="<%=(auctVO == null)? "1" :auctVO.getInitPrice()%>" /></td>
			</tr>
			<tr>
				<td>出價增額:</td>
				<td><input type="TEXT" name="auct_inc" size="45" value="<%=(auctVO == null)? "200" :auctVO.getAuct_inc()%>" /></td>
			</tr>
			<tr>
				<td>商品描述:</td>
				<td><input type="TEXT" name="auct_desc" size="45" value="<%=(auctVO == null)? "商品描述" :auctVO.getAuct_desc()%>" /></td>
			</tr>
			
			
			<tr>
					<label for="exampleInputEmail1">商品圖片: </label>
					<img id="previewPic" src="<%=request.getContextPath()%>/front-end/auct/images/NOPIC.jpg" width="250px" height="250px">
					<input type="FILE" id="pic" name="auct_pic" size="45" value="<%=(auctVO == null) ? "" : auctVO.getAuct_pic()%>" placeholder="請上傳圖片" />
			</tr>
		
		</table>
		<br>
		
		
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出新增">
	</FORM>
	
	<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->
	
	<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->
	<link   rel="stylesheet" type="text/css" href="datetimepicker/jquery.datetimepicker.css" />
	<script src="datetimepicker/jquery.js"></script>
	<script src="datetimepicker/jquery.datetimepicker.full.js"></script>
	
	<style>
	  .xdsoft_datetimepicker .xdsoft_datepicker {
	           width:  300px;   /* width:  300px; */
	  }
	  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	           height: 151px;   /* height:  151px; */
	  }
	</style>
	
	<script>
	$.datetimepicker.setLocale('zh'); // kr ko ja en
	$(function(){
		 $('#start_dateTime').datetimepicker({
		  format:'Y-m-d H:i:s',
		  onShow:function(){
		   this.setOptions({
		    maxDate:$('#end_dateTime').val()?$('#end_dateTime').val():false
		   })
		  },
		  timepicker:true,
		  step: 1
		 });
		 
		 $('#end_dateTime').datetimepicker({
		  format:'Y-m-d H:i:s',
		  onShow:function(){
		   this.setOptions({
		    minDate:$('#start_dateTime').val()?$('#start_dateTime').val():false
		   })
		  },
		  timepicker:true,
		  step: 1
		 });
	});
	</script>

	
<script>
//圖片預覽
		$("#pic").change(function() {
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#previewPic").attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
</script>	


</body>
</html>

