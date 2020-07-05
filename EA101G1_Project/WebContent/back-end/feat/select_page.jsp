<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Feat Homepage</title>

<style>

  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h2>Feature Home page</h2><h4>( MVC )</h4></td></tr>
</table>

<h3>�\��d��:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>

 <li><a href='listAllFeat.jsp'>List</a> all Feat.  <br><br></li>
 <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/feat/feat.do" >
        <b>��J�\��s��: (ex:f000001):</b>
        <input type="text" name="f_no">
        <input type="hidden" name="action" value="select_One_Feat">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

 <jsp:useBean id="fSvc" scope="page" class="com.feat.model.FService"/>
 
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/feat/feat.do" >
       <b>��ܭ��u�s��:</b>
       <select size="1" name="f_no">
         <c:forEach var="fVO" items="${fSvc.all}" > 
          <option value="${fVO.f_no}">${fVO.f_no}
         </c:forEach>  
       </select>
       <input type="hidden" name="action" value="select_One_Feat">
       <input type="submit" value="�d��">
    </FORM>
  </li>

 

</ul>	

<ul>
  <li><a href='addFeat.jsp'>Add</a> a new Feat.</li>
</ul>



</body>
</html>