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
<title>�s�W�v�аӫ~ - insert_auct.jsp</title>

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
			 <h3>�ڪ����� --- �ӫ~�޲z</h3></td><td>
			 <a href="Auct_index.jsp" class="back-btn"><button type="submit" class="back-btn mb-4">�s�W�ӫ~</button></a>
		     <a href="Auct_index.jsp" class="back-btn"><button type="submit" class="back-btn mb-4">�^�v�бM��</button></a>
		</td></tr>
	</table>

	<h3>��Ʒs�W:</h3>
	
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="auct.do" name="form1" enctype = "multipart/form-data">
		<table>
					
			<tr>
				<td>��aID:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="sale_id" size="45" value="<%=(auctVO == null)? "M000007" : auctVO.getSale_id()%>" /></td>
			</tr>
			
			
			
			<jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />
			<tr>
				<td>�ӫ~���O:<font color=red><b>*</b></font></td>
				<td>
					<select size="1" name="pt_id">
						<c:forEach var="ptVO" items="${ptSvc.all}">
							<option value="${ptVO.pt_id}" ${(auctVO.pt_id==ptVO.pt_id)?'selected':'' } >${ptVO.typename}
						</c:forEach>
					</select>
				</td>
			</tr>
	
			<tr>
				<td>�ӫ~�W��:</td>
				<td><input type="TEXT" name="auct_name" size="45" value="<%=(auctVO == null)? "�ӫ~�W��" : auctVO.getAuct_name()%>" /></td>
			</tr>
			
			<tr>
				<td>�v�ж}�l�ɶ�: </td>
				<td><input type="text" name="auct_start" id="start_dateTime" ></td>
			</tr>
			
			<tr>
				<td>�����v�Юɶ�:</td>
				<td><input type="text" name="auct_end" id="end_dateTime"></td>
			</tr>
			
			<tr>		
				<td>����:</td>
				<td><input type="TEXT" name="marketPrice" size="45"	value="<%=(auctVO == null)? "1" :auctVO.getMarketPrice()%>" /></td>
			</tr>
			<tr>		
				<td>�_���:</td>
				<td><input type="TEXT" name="initPrice" size="45"	value="<%=(auctVO == null)? "1" :auctVO.getInitPrice()%>" /></td>
			</tr>
			<tr>
				<td>�X���W�B:</td>
				<td><input type="TEXT" name="auct_inc" size="45" value="<%=(auctVO == null)? "200" :auctVO.getAuct_inc()%>" /></td>
			</tr>
			<tr>
				<td>�ӫ~�y�z:</td>
				<td><input type="TEXT" name="auct_desc" size="45" value="<%=(auctVO == null)? "�ӫ~�y�z" :auctVO.getAuct_desc()%>" /></td>
			</tr>
			
			
			<tr>
					<label for="exampleInputEmail1">�ӫ~�Ϥ�: </label>
					<img id="previewPic" src="<%=request.getContextPath()%>/front-end/auct/images/NOPIC.jpg" width="250px" height="250px">
					<input type="FILE" id="pic" name="auct_pic" size="45" value="<%=(auctVO == null) ? "" : auctVO.getAuct_pic()%>" placeholder="�ФW�ǹϤ�" />
			</tr>
		
		</table>
		<br>
		
		
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="�e�X�s�W">
	</FORM>
	
	<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->
	
	<!-- �ѦҺ���: https://xdsoft.net/jqplugins/datetimepicker/ -->
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
//�Ϥ��w��
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

