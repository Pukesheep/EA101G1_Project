<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.productType.model.*"%>

<%
  AuctVO auctVO = (AuctVO) request.getAttribute("auctVO"); //AuctServlet.java (Controller) �s�Jreq��auctVO���� (�]�A�������X��auctVO, �]�]�A��J��ƿ��~�ɪ�auctVO����)
%>

<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�ק��v�аӫ~</title>
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

	<!-- �ϥ�datetimepicker -->
    <link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.css" />    
    <script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.full.js"></script>
    
</head>

<body>

<!-- ��a�ק��v�аӫ~--����banner -->
    <section class="banner pt-3 mb-3 text-center">
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
                <h2>�ק��v�аӫ~</h2>
                
            </div>
        </div>
    </section>

    <section class="blank0"></section>
  
    <%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
<!-- ��a�ק��v�аӫ~--���� -->

	<section class="section-2 container mb-5">
        <form METHOD="post" ACTION="auct.do" name="form1" enctype = "multipart/form-data">
            <div class="form-row">
                <div class="form-group col-md-6">
                	<label for="">���s��  : <%=auctVO.getAuct_id()%></label> <br>
                    <label for="">��a�W�� : <%=auctVO.getSale_id()%> </label> <br>

                    
         <jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">�ӫ~���O:</label>
                        <select class="form-control" name="pt_id" id="exampleFormControlSelect1">
                            <c:forEach var="ptVO" items="${ptSvc.all}">
						    	<option value="${ptVO.pt_id}" ${(auctVO.pt_id==ptVO.pt_id)?'selected':'' } >${ptVO.typename}
							</c:forEach>
                        </select>
                     </div>
                    
                    <label for="auct_name">�ӫ~�W��:</label>
                    <input type="text" class="form-control mb-2" name="auct_name" id="auct_name" value="<%=auctVO.getAuct_name()%>" required>
                    
                    <label for="start_dateTime">�v�ж}�l�ɶ�:</label>
                    <input type="text" class="form-control mb-2" name="auct_start" id="start_dateTime" value="<%=auctVO.getAuct_start()%>" required>
                    
                    <label for="end_dateTime">�v�е����ɶ�:</label>
                    <input type="text" class="form-control mb-2" name="auct_end" id="end_dateTime" value="<%=auctVO.getAuct_end()%>" required>
                    
                    <label for="marketPrice">����:</label>
                    <input type="text" class="form-control mb-2" name="marketPrice" id="marketPrice" value="<%=auctVO.getMarketPrice()%>" required>
                    
                    <label for="initPrice">�_���:</label>
                    <input type="text" class="form-control mb-2" name="initPrice" id="initPrice" value="<%=auctVO.getInitPrice()%>" required>
                    
                    <label for="auct_inc">�X���W�B:</label>
                    <input type="text" class="form-control mb-2" name="auct_inc" id="auct_inc" value="<%=auctVO.getAuct_inc()%>" required>
                </div>

                <div class="form-group col-md-1"></div>

                <div class="form-group col-md-5">
                    <label for="auct_desc">�ӫ~�y�z:</label>
                    <textarea class="inputAuct_desc form-control mb-2" name="auct_desc" id="auct_desc" rows="4" cols="10" required><%=auctVO.getAuct_desc()%></textarea>

                    <label for="auct_pic">�ӫ~�Ϥ�: </label>
                    <div>
					<img id="previewPic" src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" width="250px" height="250px"  style="border-radius: 5px;">
					<input type="FILE" id="auct_pic" name="auct_pic" value="<%=(auctVO == null) ? "" : auctVO.getAuct_pic()%>" placeholder="�ФW�ǹϤ�"  class=" mb-5" required/>
					</div>

                    <br>
                    <input type="hidden" name="action" value="update">
					<input type="hidden" name="auct_id" value="<%=auctVO.getAuct_id()%>">
                    <button type="submit" class="add-btn btn btn-info">�T�{�ק�</button>
					
                </div>
            </div>
        </form>
    </section>
    <!-- ��a�s�W�ӫ~���� end-->
    
    <a href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp">
        <button id="goBackBtn" class="bg-primary">
            <h6 class="backbtn">BID</h6>
        </button>
    </a>


<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->
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
		//���Y�@�Ѥ��e������L�k���
		 var somedate1 = new Date();
	             $('#start_dateTime').datetimepicker({
	                 beforeShowDay: function(date) {
	               	  if (  date.getYear() <  somedate1.getYear() || 
	        		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	        		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	                     ) {
	                          return [false, ""]
	                     }
	                     return [true, ""];
	             }});
		 
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
		$("#auct_pic").change(function() {
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