<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.comm.model.*" %>

<%
	CommVO commVO = (CommVO) request.getAttribute("commVO");
	// CommServlet.java (Controller) �s�J req �� commVO ���� (�]�A�������X�� postVO, �]�]�A��J��ƿ��~�ɪ� postVO ����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
<title>�d����ƭק� - update_comm_input.jsp</title>

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
			<h3>�d����ƭק� - update_comm_input.jsp</h3>
			<h4><a href="<%=request.getContextPath()%>/front-end/comm/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">�^����</a></h4>
		</td>
	</tr>
</table>

<h3>��ƭק�</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font>�Эץ��H�U���~</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>
				${message}
			</li>
		</c:forEach>
	</ul>
</c:if>

<form action="<%=request.getContextPath()%>/comm/comm.do" method="post">
<%= commVO == null %>
	<table>
		<tr>
			<td>
				�d���s���G<font><b>*</b></font>
			</td>
			<td>
				<%=commVO.getComm_id()%>
			</td>
		</tr>
		<tr>
			<td>
				�峹�s���G<font><b>*</b></font>
			</td>
			<td>
				<%=commVO.getPost_id()%>
			</td>
		</tr>
		<tr>
			<td>
				�|���s���G<font><b>*</b></font>
			</td>
			<td>
				<%=commVO.getMem_id()%>
			</td>
		</tr>
		<tr>
			<td>
				�d�����A�G
			</td>
			<td>
				<select name="c_status">
					<option value="0" ${commVO.c_status eq 0 ? "selected" : "" }>����</option>
					<option value="1" ${commVO.c_status ne 0 ? "selected" : "" }>���</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				�d�����e�G
			</td>
			<td>
				<textarea name="c_text" rows="5" cols="500"><%= (commVO == null) ? "�п�J�d�����e" : commVO.getC_text() %></textarea>
			</td>
		</tr>
		<tr>
			<td>
				�̫�ק�ɶ��G
			</td>
			<td>
				<input type="text" name="last_edit" size="45" id="f_date1">
			</td>
		</tr>
		<tr>
			<td>
				�d���ɶ��G
			</td>
			<td>
				<input type="text" name="post_time" size="45" id="f_date2">
			</td>
		</tr>
		
	</table>
	<br>
	<input type="hidden" name="action" value="update">
	<input type="hidden" name="comm_id" value="${commVO.comm_id}">
	<input type="hidden" name="post_id" value="${commVO.post_id}">
	<input type="hidden" name="mem_id" value="${commVO.mem_id}">
	<input type="submit" value="�e�X�ק�">
</form>

</body>

<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

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
 	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=commVO.getLast_edit()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        $('#f_date2').datetimepicker({
            theme: '',              //theme: 'dark',
  	       timepicker:false,       //timepicker:true,
  	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
  	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
  		   value: '<%=commVO.getPost_time()%>', // value:   new Date(),
            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
            //startDate:	            '2017/07/10',  // �_�l��
            //minDate:               '-1970-01-01', // �h������(���t)���e
            //maxDate:               '+1970-01-01'  // �h������(���t)����
         });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
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

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
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


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
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