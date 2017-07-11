<%@page import="kr.co.domain.UserVO"%>
<%@page import="java.util.Map"%>
<%@page import="kr.co.domain.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<jsp:include page="/WEB-INF/views/admin_page_header.jsp"></jsp:include>
	<div class="container">
		
		<div class="row">
		
			<h1>구매리스트</h1>
			<table border="1" class="table table-bordered table-condensed table-hover">
					<thead>
				<tr>
					<td hidden="hidden">상품번호</td>
					<td>썸네일</td>
					<td>종목</td>
					<td>제목</td>
					<td>상품명</td>
					<td>브랜드명</td>
					<td>사이즈</td>
					<td>원가</td>
					<td>판매가</td>
					<td>할인율(%)</td>
					<td style="color: blue;">할인적용가격</td>
					<td style="color: purple;">할인가</td>
					
					<td style="color: green;">적립금</td>
					<td>구매량</td>
 					<td>재고량</td>
					<td>원산지</td>
					<td>추천수</td>
					<td style="color: red" >결재가격</td>
					
					<!-- <td>내용보기</td> 내용관련 페이지로 넘어가게끔 하기 -->
				</tr>
				</thead>
				
				
				
				<c:if test="${empty p_vo}"> <!-- 장바구니로 거쳐 왔을떄, 장바구니로 거쳐 왔을때 할인가 할인율등 값을 VO에다 저장했다가 다시 빼는 방법을 고민 -->
				<tbody>
				<c:forEach items="${list}" var="pList"> <!-- attribute로 저장한 데이터를 불러온다 -->
						
					<tr>													
						<td hidden="hidden">${pList.pno}</td>
						<td ><span><img src="/displayFile?fileName=${pList.p_img_1}"/></span></td>
						<td >${pList.p_category}</td>
						<td >${pList.p_title}</td> <!-- 상품정보 게시판을 넘어간다. -->
						<td >${pList.p_name}</td>
						<td >${pList.p_brand_name}</td>
						<td >${pList.p_size}</td>
						<td>${pList.p_ori_price}</td>
						<td>${pList.p_price}</td>
						<td>${pList.p_discount_rate}</td>
						<td style="color: blue;" class="discountedPrice${p_list.seperatorNum}">${pList.discountedPrice}</td>
						<td style="color: purple;" class="discount${p_list.seperatorNum}">${pList.discount}</td>
						<td style="color: green;" class="mileage${p_list.seperatorNum}">${pList.mileage}</td>
						
						
						<td style="color: olive;">${pList.count}</td>
						<td>${pList.p_amount}</td>
						<td>${pList.p_made}</td>
						<td>${pList.p_goodcnt}</td>
						<td style="color: red;">${pList.discountedPrice}</td>						
					</tr>
					
					</c:forEach>
					</tbody>
					</c:if>
					
					<c:if test="${empty list}"> <!-- 즉시 구매로 왔을때 -->
					<tbody>
					<tr>													
						<td hidden="hidden">${p_vo.pno}</td>
						<c:if test="${not empty p_vo.p_img_1}">
						<td><span><img src="/displayFile?fileName=${p_vo.p_img_1}"/></span></td>
						</c:if>
						<td>${p_vo.p_category}</td>						
						<td>${p_vo.p_title}</td> <!-- 상품내용 게시판으로 이동한다. -->
						<td>${p_vo.p_name}</td>
						<td>${p_vo.p_brand_name}</td>
						<td>${p_vo.p_size}</td>
						<td>${p_vo.p_ori_price}</td>
						<td>${p_vo.p_price}</td>
						<td>${p_vo.p_discount_rate}</td>
						<td style="color: blue;">${p_vo.discountedPrice}</td>
						<td style="color: purple;">${p_vo.discount}</td>
						<td style="color: green;">${p_vo.mileage}</td>
						
						
						
						<td>${p_vo.count}</td>
						<td>${p_vo.p_amount}</td>
						<td>${p_vo.p_made}</td>
						<td>${p_vo.p_goodcnt}</td>
						<td style="color: red;">${p_vo.discountedPrice}</td>					
					</tr>
							
									
					</tbody>
				</c:if>
			</table>
			
			<div class="form-group">
				<h2 style="color: red; font-style: italic">결제 정보</h2> <h4 style="font: bold;">*적립금을 사용하지 않으실 경우 현재가가 본인의 결재 가격이 됩니다*</h4>				
				<hr>
				<c:if test="${empty list}"> <!-- 즉! 즉시구매했을때 적용되는 구문 -->
					<div style="font-size: large; float: left">현재가:</div><div id="discountedPrice" style="font-size: large; float: left;">${p_vo.discountedPrice}</div><div style="font-size: large;">원</div>
				</c:if>
				<c:if test="${empty p_vo}"> <!-- 장바구니를 통해서 들어왔을때 적용되는 구문! --> 
					<!-- 밑 purPage_vo는 따로 어트리뷰트 한 객체이다. 총할인적용된 금액, 할인받을 금액, 쌓을 적립금이 내장되어있다. -->
					<div style="font-size: large; float: left">현재가:</div><div id="discountedPrice" style="font-size: large; float: left;">${PurPage_vo.totalPrice}</div><div style="font-size: large;">원</div>
				</c:if>
				
				
				<hr>
				
				<c:if test="${empty list}"> <!-- 즉시구매 -->
					<div>사용할 마일리지를 적어주세요</div>
					<div class="col-xs-4">
					<div class="input-group">
					<input type="number" id="mileage" class="form-control" style="float: left;" value="0">
					<span class="input-group-btn">
					<button id="p_voApply" class="btn btn-primary">적용</button>
					</span>			
					</div>
					</div>
				</c:if>
				
				<c:if test="${empty p_vo}"><!-- 카트리스트구매, 이거 이쁘게 만들기 -->
					<h3>사용할 마일리지를 적어주세요</h3>
					<div class="col-xs-4">
					<div class="input-group">
					<input type="number" id="mileage" class="form-control" value="0">
					<span class="input-group-btn">
					<button id="listApply" class="btn btn-primary">적용</button>
					
					</span>			
					</div>
					</div>
				</c:if>
				
				<div class="col-xs-2">
					<h4 id="useMileage" style="font-style: italic;"></h4> <!-- 사용한 마일리지를 창 옆에 바로 보여줍니다. -->
				</div>
			
			</div>
		</div>
			
			
			<div class="row">
				<hr>
				<div class="form-group">
					<div class="col-xs-2">
						<h3 style="font-style: italic; float: left;">Total 할인받는 금액 :</h3>
					</div>
					
					<div class="col-xs-2">
						<h3 id="totalDiscount" style="color: blue;"></h3>
					</div>
				
				
				</div>
				<div class="form-group">
					<div class="col-xs-2">
						<h3 style="font-style: italic; float: left;">결재 금액 :</h3>
					</div>
					
					<div class="col-xs-2">
						<h3 id="totalPrice" style="color: red;"></h3>
					</div>
				
				
				</div>
				<div class="form-group">
					<div class="col-xs-2">
						<h3 style="font-style: italic; float: left;">누적될 Total 적림금 :</h3>
						
					</div>
					<div class="col-xs-2">
					<h3 id="totalMileage" style="color: purple;"></h3>
					</div>
				</div>
			
			</div>
			<hr>	
			<div class="row">
			<div class="form-group" style="float: right;">
			<button class="btn btn-primary" id="payment" >결제</button>
			<button class="btn btn-primary" id="gobackCart">장바구니로</button>
			</div>	
			</div>	
			<hr>	

		
		
			<div class="row">
			<h1>배송 받을 주소</h1>
			<hr>
			<div class="input-group" align="center">
			
			받는사람 : <input id="name" type="text" name="u_name" value="${login.name }"><br>
			주소1 : <input id="addr1" type="text" name="u_addr1" value="${login.addr1 }"><br>
			주소2 : <input id="addr2" type="text" name="u_addr2" value="${login.addr2 }"> <br>
			전화번호 : <input id="phone" type="text" name="u_phone" value="${login.phone }">
		
			
			</div>	
			</div>	
				
				
				
				
			
			</div>
				
		 		
			<%
			
			int i = '1';
			List<ProductVO> list = null;
			UserVO uVO = new UserVO(); 
			uVO = (UserVO) session.getAttribute("login");
			System.out.println(uVO.getId()+"************************");
			
			if( request.getAttribute("list") != null ){
			
			list = (ArrayList<ProductVO>) request.getAttribute("list");
			
			String strVO="";		
			
			
			for(i=0; i < list.size() ; i++){
				
				strVO += "{'pno':" +list.get(i).getPno() +
						 ",'id':'"+ uVO.getId() +
						 "','o_category':'"+ list.get(i).getP_category()+
						 "','o_title':'"+list.get(i).getP_title()+
						 "','o_name':'"+list.get(i).getP_name()+
						 "','o_brand_name':'"+list.get(i).getP_brand_name()+
						 "','o_size':'"+list.get(i).getP_size()+
						 "','o_img_1':'"+list.get(i).getP_img_1()+
						 "','o_amount':"+list.get(i).getCount()+
						 ",'o_price':"+list.get(i).getP_price()+
						 ",'o_mileage_gain':"+list.get(i).getMileage()+
						 ",'o_final_price':"+list.get(i).getDiscountedPrice()+"},";
						
			
				
			};
				
				if(strVO.length() != 0){
				String NoCommaStrVO = strVO.substring(0, strVO.length()-1);
				String json_strVO = "["+NoCommaStrVO+"]";
				pageContext.setAttribute("json_strVO", json_strVO);
				int productNum = i;
				pageContext.setAttribute("productNum", productNum);
				} else {
				
				String json_strVO = "1"; //숫자 1을 입력 안할경우 엄청난 딜레마에 빠질것임 없으면 안된다.!!!!! 어느숫자라도 넣어야함
				pageContext.setAttribute("json_strVO", json_strVO);	
				int productNum = 1;
				pageContext.setAttribute("productNum", productNum);	
				}
				
			} else {
				
				String json_strVO = "1"; //숫자 1을 입력 안할경우 엄청난 딜레마에 빠질것임 없으면 안된다.!!!!! 어느숫자라도 넣어야함
				pageContext.setAttribute("json_strVO", json_strVO);
				int productNum = 1;
				pageContext.setAttribute("productNum", productNum);
			}	
						
						
			%> 
		
	
		
	<jsp:include page="/WEB-INF/views/page_footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(document).ready(function () {		
			
			
			var insertOno;
			
			var useMileage;
			var totalPrice;
			var totalDiscount;
			var totalMileage; 
			var p_vo = '${p_vo.pno}';
			var id = '${login.id}';
			var ProductNum = ${pageScope.productNum}; // 총 상품 갯수
			
			
			if (p_vo == '') { // 카트에서 넘어 왔을경우
				var totalDiscount =	'${PurPage_vo.totalDiscount}';
				var totalMileage = '${PurPage_vo.totalMileage}';
				var discountedPrice =$("#discountedPrice").text();
				var totalPrice = discountedPrice; 
				$("#totalDiscount").html(totalDiscount+"원");	
				$("#totalMileage").html(totalMileage+" points");
			}	
			
			if (p_vo != '') { //즉시 구매일경우 p_vo값이 존재한다.
				var totalDiscount =	'${p_vo.discount}';
				var totalMileage = '${p_vo.mileage}';
				var discountedPrice =$("#discountedPrice").text();	
				var totalPrice = discountedPrice; // 마일리지 적용전 최종가격
				$("#totalDiscount").html(totalDiscount+"원");
				$("#totalMileage").html(totalMileage+" points");
				
			}
			
			
			$("#listApply").click(function () {
				var discountedPrice =$("#discountedPrice").text();	
					//purPage_vo는 따로 어트리뷰트 한 객체이다. 총할인적용된 금액, 할인받을 금액, 쌓을 적립금이 내장되어있다.
				
				useMileage = $("#mileage").val();	 	
			 	var lastvalue = useMileage.charAt(useMileage.length -1);
			 	var totalDiscount =	'${PurPage_vo.totalDiscount}';
				var totalMileage = '${PurPage_vo.totalMileage}';	
			 	
				if (useMileage > discountedPrice/2) { 
					alert("마일리지 사용은 총 결재 금액의 50%를 넘을 수 없습니다.")
					return false;
				} if (useMileage < 1000) {
					alert("마일리지는 1000원 이상부터 사용할 수 있습니다.")
					return false;
				} if (lastvalue != 0) {
					alert("1의 자리수는 0으로 맞춰 주세요");
					return false;
				}	
				/* 여기에 자신이 보유하고 있는 마일리지 보다 더많은 값을 입력시 실행 안되게 처리! */
				
				else {
						totalPrice = discountedPrice - useMileage;
						$("#totalPrice").attr("totalPrice", totalPrice);
			 			$("#totalPrice").html(totalPrice+"원");
			 			$("#totalDiscount").attr("totalDiscount",totalDiscount);	
			 			$("#totalDiscount").html(totalDiscount+"원");	
						$("#totalMileage").attr("totalMileage",totalMileage);
						$("#totalMileage").html(totalMileage+" points");		 			
						$("#useMileage").attr("mileage",useMileage);
			 			$("#useMileage").html(useMileage + "points");
			 			
					}
			
			
			});
						
			 $("#p_voApply").click(function() {
			 	
				var discountedPrice =$("#discountedPrice").text();	
				 	
			  	    useMileage = $("#mileage").val();	 	
			 	var lastvalue = useMileage.charAt(useMileage.length -1);
			 			
						if (useMileage > discountedPrice/2) { 
							alert("마일리지 사용은 총 결재 금액의 50%를 넘을 수 없습니다.")
							return false;
						} if (useMileage < 1000) {
							alert("마일리지는 1000원 이상부터 사용할 수 있습니다.")
							return false;
						} if (lastvalue != 0) {
							alert("1의 자리수는 0으로 맞춰 주세요");
							return false;
						}	
						/* 여기에 자신이 보유하고 있는 마일리지 보다 더많은 값을 입력시 실행 안되게 처리! */
						
				else {
							totalPrice = discountedPrice - useMileage;	
							$("#totalPrice").attr("totalPrice", totalPrice);
				 			$("#totalPrice").html(totalPrice+"원");
				 			$("#totalDiscount").attr("totalDiscount",totalDiscount);	
				 			$("#totalDiscount").html(totalDiscount+"원");	
							$("#totalMileage").attr("totalMileage",totalMileage);
							$("#totalMileage").html(totalMileage+" points");		 			
							$("#useMileage").attr("mileage",useMileage);
				 			$("#useMileage").html(useMileage + "points");
						}
			 		 	
			 });
			 
				
			
			
			
			
		
		
				
		 	  $("#payment").click(function() {
				
					var isOK = confirm("결제를 진행하시겠습니다까?");
						    																
					if (isOK && totalPrice != "") {
						window.open("https://www.inicis.com/Support_new/stdpay/INIStdPaySample/INIStdPayRequest.php", "결제진행", "height=1000, width=600, top=200, left=200");	
							
						if (p_vo == '') {
							
							var id = '${login.id}';
							var data = ${pageScope.json_strVO};
							
							var onoMax = "";
							
							var addr1 = $("#addr1").val();
							var addr2 = $("#addr2").val();
							var name = $("#name").val();
							var phone = $("#phone").val();
					 	
						
							
							$.ajax({
								type: "post",
								url: "/product/cartOrderInfoHistory",
								headers: {
									"Content-Type":"application/json",
									"X-HTTP-Method-Override":"POST"
								},
								dataType: "text",
								data: JSON.stringify(data),
								contentType:"application/json", //이것을 해주어야 json 형태로 넘어갈 수 있음!!!!!
								success : function(result) {
									/* alert(result); */
									 
									
								 	$.ajax({
										type: "PUT",
										url: "/product/OrderListValues/",
										headers: {
											"Content-Type":"application/json",
											"X-HTTP-Method-Override":"PUT"
										},
										dataType: "text",							
										data: JSON.stringify({
											totalDiscount : totalDiscount,
											totalMileage : totalMileage,
											id : '${login.id}',
											u_addr1 : addr1,
											u_addr2 : addr2,
											u_name : name,
											u_phone : phone,
											count : ProductNum,
											totalPrice : totalPrice,
											useMileage : useMileage
											
										}),							
										success : function(result) {	
											/* alert(result);		 */										
										}
									});	  
									
									
									
								}
							});
						
							
					 	
						
					
						}	 
						
						
						
						
						
						
						if (p_vo != '' && totalPrice != "") { //즉시 구매일 경우
							
						var id = '${login.id}';
						var data = ${pageScope.json_strVO};
							
						var onoMax = "";
							
						var addr1 = $("#addr1").val();
						var addr2 = $("#addr2").val();
						var name = $("#name").val();
						var phone = $("#phone").val();	
							
							
						$.ajax({
							type: "post",
							url: "/product/singleOrderInfoHistory",
							headers: {
								"Content-Type":"application/json",
								"X-HTTP-Method-Override":"DELETE"
							},
							dataType: "text",
							data: JSON.stringify({
								pno : '${p_vo.pno}',
								id : '${login.id}',
								o_category : '${p_vo.p_category}',
								o_title : '${p_vo.p_title}',
								o_name : '${p_vo.p_name}',
								o_brand_name : '${p_vo.p_brand_name}',
								o_size : '${p_vo.p_size}',
								o_img_1 : '${p_vo.p_img_1}',
								o_amount : '${p_vo.count}',
								o_price : '${p_vo.p_price}',
								o_mileage_gain : '${p_vo.mileage}',
								o_final_price : totalPrice
							}),							
							success : function(result) {	
								alert(result);		
								
								$.ajax({
									type: "PUT",
									url: "/product/OrderListValues",
									headers: {
										"Content-Type":"application/json",
										"X-HTTP-Method-Override":"PUT"
									},
									dataType: "text",
									data: JSON.stringify({
										
										
										totalDiscount : totalDiscount,
										totalMileage : totalMileage,
										id : '${login.id}',
										u_addr1 : addr1,
										u_addr2 : addr2,
										u_name : name,
										u_phone : phone,
										count : ProductNum,
										totalPrice : totalPrice,
										useMileage : useMileage
										
									}),							
									success : function(result) {	
										alert(result);												
									}
								});
							}
						});	
						
							
						}
					} else {
						alert ("0원은 결제 하실 수 없습니다.")
					}
					
					
		 	 });  
			
					
				
				
				
		
		});
	
	</script>

</body>
</html>