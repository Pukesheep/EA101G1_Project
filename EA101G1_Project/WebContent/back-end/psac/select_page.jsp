<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Psac Homepage</title>

<style>

  table#a {
	width: 100%;
	background-color: #5588DD;
	margin-top: 20px;
	margin-bottom: 20px;
    border: 5px solid Gray;
    height: 50px;
    text-align: center;
  }
  
  h3{
  	text-align:center;
  }
  
  div{
  width:400px;
  margin:0 auto;
  }
  
</style>

</head>
<body bgcolor='white'>

<table id="a">
   <tr><td><h2>�峹���|�� </h2><h4>( MVC )</h4></td></tr>
</table>

<h3>�峹���|�׬d��:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="a">
<ul>

 <li><a href='<%=request.getContextPath()%>/back-end/psac/listAllPsac.jsp'>�d�ߥ������|��</a>  <br><br></li>
 <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" >
        <b>��J�峹���|�׽s��: (ex:p000001):</b>
        <input type="text" name="psac_no">
        <input type="hidden" name="action" value="select_One_Psac">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

 <jsp:useBean id="psacSvc" scope="page" class="com.psac.model.PsacService"/>
 
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" >
       <b>��ܤ峹���|�׽s��:</b>
       <select size="1" name="psac_no">
         <c:forEach var="psacVO" items="${psacSvc.all}" > 
          <option value="${psacVO.psac_no}">${psacVO.psac_no}
         </c:forEach>  
       </select>
       <input type="hidden" name="action" value="select_One_Psac">
       <input type="submit" value="�d��">
    </FORM>
  </li>

</ul>	

<ul>
  <li><a href='<%=request.getContextPath()%>/back-end/psac/addPsac.jsp'>�s�W�峹���|��</a></li>
</ul>
</div>

</body>
</html>