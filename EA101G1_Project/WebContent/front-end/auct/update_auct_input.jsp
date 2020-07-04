<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.productType.model.*"%>

<%
  AuctVO auctVO = (AuctVO) request.getAttribute("auctVO"); //AuctServlet.java (Controller) �s�Jreq��auctVO���� (�]�A�������X��auctVO, �]�]�A��J��ƿ��~�ɪ�auctVO����)

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�v�аӫ~��ƭק� - update_auct_input.jsp</title>
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
			 <h3>�v�аӫ~��ƭק� - update_auct_input.jsp</h3>
			 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
		</td></tr>
	</table>
	
	<h3>�v�аӫ~��ƭק�:</h3>

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
			<td>�ӫ~�s��:<font color=red><b>*</b></font></td>
			<td><%=auctVO.getAuct_id()%></td>
		</tr>
				
		<tr>
			<td>��aID:<font color=red><b>*</b></font></td>
			<td><%=auctVO.getSale_id()%></td>
		</tr>
		
		<tr>
			<td>��a�W��:<font color=red><b>*</b></font></td>
			<td><%=auctVO.getSale_id()%></td>
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
			<td><input type="TEXT" name="auct_name" size="45" value="<%=auctVO.getAuct_name()%>" /></td>
		</tr>
		
		<tr>
			<td>�v�ж}�l�ɶ�: </td>
			<td><input type="text" name="auct_start" id="start_dateTime" value="<%=auctVO.getAuct_start()%>"></td>
		</tr>
			
		<tr>
			<td>�����v�Юɶ�:</td>
			<td><input type="text" name="auct_end" id="end_dateTime" value="<%=auctVO.getAuct_end()%>"></td>
		</tr>
		
		<tr>		
			<td>����:</td>
			<td><input type="TEXT" name="marketPrice" size="45"	value="<%=(auctVO == null)? "1" :auctVO.getMarketPrice()%>" /></td>
		</tr>
		<tr>
			<td>�_���:</td>
			<td><input type="TEXT" name="initPrice" size="45"	value="<%=auctVO.getInitPrice()%>" /></td>
		</tr>
		<tr>
			<td>�X���W�B:</td>
			<td><input type="TEXT" name="auct_inc" size="45" value="<%=auctVO.getAuct_inc()%>" /></td>
		</tr>
		<tr>
			<td>�ӫ~�y�z:</td>
			<td><input type="TEXT" name="auct_desc" size="45" value="<%=auctVO.getAuct_desc()%>" /></td>
		</tr>
		<tr>
			<label for="exampleInputEmail1">�ӫ~�Ϥ�: </label>
			<img id="previewPic" src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" width="350px" height="220px">			
			<input type="FILE" id="pic" name="auct_pic" size="45" value="<%=(auctVO == null) ? "" : auctVO.getAuct_pic()%>" placeholder="�ФW�ǹϤ�" />
		</tr>
		
		
	
	</table>
	<br>
	
	<input type="hidden" name="action" value="update">
	<input type="hidden" name="auct_id" value="<%=auctVO.getAuct_id()%>">
	<input type="submit" value="�e�X�ק�">
	
	</FORM>


<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

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