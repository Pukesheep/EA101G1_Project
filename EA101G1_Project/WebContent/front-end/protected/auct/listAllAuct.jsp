<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>

<%
	AuctService auctSvc = new AuctService();

	MemberVO memVO = (MemberVO)session.getAttribute("memberVO");
	String sale_id = memVO.getMem_id();

    List<AuctVO> list = auctSvc.getSaleList(sale_id);
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�ӫ~�޲z</title>
    <!-- TODO: ��title ��icon -->
    <link rel="icon shortcut" href="images/ICON(yellow).ico">
    <!-- Bootstrap�x����� https://getbootstrap.com/ -->
    <!-- �s��Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- �ϥ�font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- �ϥ�google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- �ϥ�style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/insert_auct.css">

    <!-- �s��Bootstrap�һݭn��js -->
    <!-- jquery.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- popper.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <!-- bootstrap.min.js -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

    <style>
        .add-btn{
            position: relative; top:60px; left: 30px; 
        }     
    </style>

</head>

<body>

    <!-- ��a�ӫ~�޲z���� -->
    <section class="banner pt-3 text-center ">
        <div class="row">
            <div class="LOGO col-md-2 pl-5 mt-2">
                <div>
                    <a class="navbar-brand" href="../index.html">
                        <span class="logo"><i class="fas fa-bomb"></i></span>
                        <span class="logo2">S.F.G</span>
                        <span class="logo3">{{{</span>
                    </a>
                </div>
            </div>

            <div class="col-md-8 mt-3">
                <h2>�ڪ����� --- �v�аӫ~�޲z</h2>              
            </div>
    <!-- �v�Эq�� -->
            <a href="<%=request.getContextPath()%>/front-end/protected/auct/sale_order.jsp">
                <button class="add-btn btn btn-outline-warning mx-3" class="bg-primary">
                    <h6 class="backbtn">�ӫ~�q��</h6>
                </button>
            </a>
    <!-- �s�W�ӫ~ -->
            <a href="<%=request.getContextPath()%>/front-end/protected/auct/insert_auct.jsp">
                <button class="add-btn btn  btn-outline-light" class="bg-primary">
                    <h6 class="backbtn">�s�W�ӫ~</h6>
                </button>
            </a>
        </div>
    </section>

    <!-- ��a�ӫ~�޲z���� end-->
    <section class="section-2  mb-5">
        <table class="table table-striped table-dark text-center">
            <thead>
                <tr>
                    <th scope="col">���s��</th>
                    <th scope="col">�ӫ~�W��</th>
                    <th scope="col">�ӫ~���O</th>
<!--                     <th scope="col">��aID</th> -->
                    <th scope="col">�v�ж}�l�ɶ�</th>
                    <th scope="col">�v�е����ɶ�</th>
                    <th scope="col">����</th>
                    <th scope="col">�_���</th>
                    <th scope="col">�X���W�B</th>
                    <th scope="col">�ӫ~�Ϥ�</th>
                    <th scope="col">��X���A</th>
                    <th scope="col">�W�U�[���A</th> 
                    <th scope="col">�ק�</th> 
                    <th scope="col">�U�[</th>           
                </tr>
            </thead>

            <tbody>

<!-- JSTL for-each -->
<%@ include file="page1.file" %> 
	<c:forEach var="auctVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
              <tr>
                <th>${auctVO.auct_id}</th>
                <td>${auctVO.auct_name}</td>
                <td>${PtSvc.getOneProductType(auctVO.pt_id).typename}</td>
<%--                 <td>${auctVO.sale_id}</td> --%>
                <td> <fmt:formatDate value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
                <td> <fmt:formatDate value="${auctVO.auct_end}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
                <td>${auctVO.marketPrice}</td>
                <td>${auctVO.initPrice}</td>
                <td>${auctVO.auct_inc}</td>
			
				<td>
					<img src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" width="100px">
				</td>
				
				<td>
					<c:if test="${auctVO.auct_sold == 0}">
						<c:out value="����X"></c:out>
					</c:if>
					<c:if test="${auctVO.auct_sold == 1}">
						<c:out value="��X"></c:out>
					</c:if>
				</td>
				<td>
					<c:if test="${auctVO.auct_down == 0}">
						<c:out value="�W�["></c:out>
					</c:if>
					<c:if test="${auctVO.auct_down == 1}">
						<c:out value="�U�["></c:out>
					</c:if>
				</td>

                <td>
                <jsp:useBean id="auctVO" scope="page" class="com.auct.model.AuctVO" />
				<%
				java.util.GregorianCalendar time = new java.util.GregorianCalendar();
				long now_ms = time.getTimeInMillis();
				pageContext.setAttribute("now_ms", now_ms);
				
					Timestamp startTime = auctVO.getAuct_start();
					long startTime2 = startTime.getTime();
					pageContext.setAttribute("startTime2", startTime2);
					
					Timestamp endTime = auctVO.getAuct_end();
					long endTime2 = endTime.getTime();
					pageContext.setAttribute("endTime2", endTime2);
													
				%>
					 <c:if test="${auctVO.auct_down == 1 && auctVO.auct_sold == 0}">   <!-- �U�[ �B ����X -->
	                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/auct/auct.do" style="margin-bottom: 0px;">
	                        <input class="btn btn-info" type="submit" value="�ק�">
	                        <input type="hidden" name="auct_id"  value="${auctVO.auct_id}">
	                        <input type="hidden" name="action"	value="getOne_For_Update">
	                    </FORM>
	                </c:if>
	              
	                <c:if test="${auctVO.auct_down == 0 && now_ms < startTime2}">   <!-- �W�[ �B �}�l�e -->
	                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/auct/auct.do" style="margin-bottom: 0px;">
	                        <input class="btn btn-info" type="submit" value="�ק�">
	                        <input type="hidden" name="auct_id"  value="${auctVO.auct_id}">
	                        <input type="hidden" name="action"	value="getOne_For_Update">
	                    </FORM>
	                </c:if>
	              
	                <c:if test="${auctVO.auct_down == 0 && now_ms >= startTime2}">   <!-- �W�[ �B �}�l�� -->
	                  	<input class="btn btn-dark" type="submit" value="�ק�" disable>
	                </c:if>
	                
	                <c:if test="${auctVO.auct_down == 1 && auctVO.auct_sold == 1}">   <!-- �U�[ && ��X -->
	                  	<input class="btn btn-dark" type="submit" value="�ק�" disable>
	                </c:if>
	                
<!-- 	              �U�[ && ��X �S�� button -->
                </td>
                
                <td>
<%--                 	--${auctVO.auct_down == 0 && now_ms < startTime2}---${now_ms}--${startTime2} -- --%>
	                <c:if test="${auctVO.auct_down == 0 && now_ms < startTime2}">	<!-- �W�[ �B �b���}�l�e -->
	                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/auct/auct.do" style="margin-bottom: 0px;">
	                        <input class="btn btn-info" type="submit" value="�U�[">
	                        <input type="hidden" name="auct_id"  value="${auctVO.auct_id}">
	                        <input type="hidden" name="action"	value="update_down">
	                    </FORM>
	                </c:if>
	                
	                <c:if test="${auctVO.auct_down == 0 && now_ms >= startTime2}">   <!-- �W�[ �B ���}�l -->
	                  	<input class="btn btn-dark" type="submit" value="�U�[" disable>
	                </c:if>
	                
	                <c:if test="${auctVO.auct_down == 1 }">   <!-- �U�[  -->
	                  	<input class="btn btn-dark" type="submit" value="�U�[" disable>
	                </c:if>
<!-- �I�ګ�ӫ~�۰ʤU�[�A�ҥH�ӫ~�}�l����A�N�L�k��ʤU�[�F -->
	                
                </td> 
                

                 <td></td>
              </tr>

	        </tbody>
	        
		</c:forEach>
	</table>
<%@ include file="page2.file" %>
<!-- JSTL for-each   end-->

    </div>  
    
    </section>

    <a href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp">
        <button id="goBackBtn" class="bg-primary">
            <h6 class="backbtn">BID</h6>
        </button>
    </a>
    
</body>
</html>