<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>

<%
  AuctVO auctVO = (AuctVO) request.getAttribute("auctVO");

  MemberVO memVO = (MemberVO)session.getAttribute("memberVO");
  String sale_id = memVO.getMem_id();
  
  pageContext.setAttribute("sale_id",sale_id);
%>

<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增競標商品</title>
    <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="images/ICON(yellow).ico">
    <!-- Bootstrap官方網站 https://getbootstrap.com/ -->
    <!-- 連結Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 使用font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- 使用google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- 使用style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/insert_auct.css">

    <link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />    
    <script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
    
</head>

<body>

    <!-- 賣家新增競標商品--頁面banner -->
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
                <h2>新增競標商品</h2>
                
            </div>
        </div>
    </section>

    <section class="blank0"></section>
    
    <%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
 <!-- 賣家新增競標商品--頁面 -->
    <section class="section-2 container mb-5">
        <form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/auct/auct.do" name="form1" enctype = "multipart/form-data">
            <div class="form-row">
                <div class="form-group col-md-6">
                
                	<label for="inputEmail4">賣家ID: ${MemberSvc.getOneMember(sale_id).mem_id}</label>
                	<input type="hidden" name="sale_id" value="${sale_id}">
                    <br>
                    <label for="inputEmail4">賣家名稱: ${MemberSvc.getOneMember(sale_id).mem_name}</label>
                    <br><br>
         <jsp:useBean id="ptSvc" scope="page" class="com.productType.model.PtService" />
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">商品類別:</label>
                        <select class="form-control" id="exampleFormControlSelect1">
                            <c:forEach var="ptVO" items="${ptSvc.all}">
						    	<option value="${ptVO.pt_id}" ${(auctVO.pt_id==ptVO.pt_id)?'selected':'' } >${ptVO.typename}
							</c:forEach>
                        </select>
                     </div>
                    
                    <label for="auct_name">商品名稱:</label>
                    <input type="text" class="form-control mb-2" name="auct_name" id="auct_name" value="<%=(auctVO == null)? "商品名稱" : auctVO.getAuct_name()%>" maxlength="39" required>
                    
                    <label for="start_dateTime">競標開始時間:</label>
                    <input type="text" class="form-control mb-2" name="auct_start" id="start_dateTime" required>
                    
                    <label for="end_dateTime">競標結束時間:</label>
                    <input type="text" class="form-control mb-2" name="auct_end" id="end_dateTime" required>
                    
                    <label for="marketPrice">市價:</label>
                    <input type="text" class="form-control mb-2" name="marketPrice" id="marketPrice" value="<%=(auctVO == null)? "1" :auctVO.getMarketPrice()%>" required>
                    
                    <label for="initPrice">起拍價:</label>
                    <input type="text" class="form-control mb-2" name="initPrice" id="initPrice" value="<%=(auctVO == null)? "1" :auctVO.getInitPrice()%>" required>
                    
                    <label for="auct_inc">出價增額:</label>
                    <input type="text" class="form-control mb-2" name="auct_inc" id="auct_inc" value="<%=(auctVO == null)? "200" :auctVO.getAuct_inc()%>" required>
                </div>

                <div class="form-group col-md-1"></div>

                <div class="form-group col-md-5">
                    <label for="auct_desc">商品描述:</label>
                    <textarea class="inputAuct_desc form-control mb-2" name="auct_desc" id="auct_desc" rows="4" cols="10" required>
                    <%=(auctVO == null)?"商品描述":auctVO.getAuct_desc()%>
                    </textarea>

                    <label for="auct_pic">商品圖片: </label>
                    <div>
					<img id="previewPic" src="<%=request.getContextPath()%>/front-end/auct/images/NOPIC.jpg" width="250px" height="250px"  style="border-radius: 5px;">
					<input type="FILE" id="auct_pic" name="auct_pic" value="<%=(auctVO == null) ? "" : auctVO.getAuct_pic()%>" placeholder="請上傳圖片"  class=" mb-5"  required/>
					</div>

                    <br>
                    <input type="hidden" name="action" value="insert">
                    <button type="submit" class="add-btn btn btn-info">新增商品</button>
					
                </div>
            </div>
        </form>
    </section>
    <!-- 賣家新增商品頁面 end-->
    
    <a href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp">
        <button id="goBackBtn" class="bg-primary">
            <h6 class="backbtn">BID</h6>
        </button>
    </a>

    <!-- <section class="blank-3"></section> -->
    
<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->
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