<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
   
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	.proudctList li{
		list-style-type:none;		
		margin-bottom: 50px;
	}
	body{
	font-weight: bold;
	}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../header.jsp"></jsp:include>
<title>Insert title here</title>
<script type="text/javascript">

</script>


</head>
<body>

	<jsp:include page="/WEB-INF/views/admin_page_header.jsp"></jsp:include>
	<div class="container">
		<div class="row">			
			<br>
			<h2>
				<span class="label label-info">상품 상세 페이지</span> 추천수 : ${vo.p_goodcnt}
			</h2>
			<hr>			
			<table class="table">
				<tbody>
					<tr>
						<td rowspan="6"><img align="center" alt="상품이미지" src="/displayFile?fileName=${vo.p_img_2}"></td>
						<td colspan="2">제목 : ${vo.p_category}</td>
					</tr>
					<tr>
						<td width="300">카테고리 : ${vo.p_category}</td>
						<td width="300">상품명 : ${vo.p_name}</td>
					</tr>
					<tr>
						<td>브랜드 : ${vo.p_brand_name}</td>
						<td>원산지 : ${vo.p_made}</td>
					</tr>
					<tr>
						<td colspan="2" style="color: red;">판매가 : ${vo.p_price} &nbsp; <strong> 할인률 : ${vo.p_discount_rate} </strong> <div id="finalPrice"></div></td>
						<!-- <td style="color: red;"></td> -->
					</tr>
					<tr>
						<td colspan="2">SIZE : ${vo.p_size}	
						</td>						
					</tr>
					
					<tr>
						<td>재고량 : ${vo.p_amount}</td>
						<td>
							구매량 : <input type="number" id="count" name="count" value="1">
						</td>						
					</tr>
					<tr>
					<td colspan="3" class="text-right">

							<a id="cartInsert" class="btn btn-default text-center" type="button">장바구니담기</a>
							<button id="pucharseProduct" class="btn btn-default text-center" type="button">구매하기</a>
							<button class="btn btn-default text-center" type="button">추천하기</button>
							<a href="/userProductList/listSearchCriteria" class="btn btn-default text-center" type="button">목록</a>					
					</td>					
					</tr>
				</tbody>			
			</table>
			<div id="content" align="center">
				${vo.p_content}
			</div>
		</div>
	</div>	
	
	
	
	<jsp:include page="/WEB-INF/views/page_footer.jsp"></jsp:include>



</body>
<script type="text/javascript">
	$(document).ready(function() {		
		var p_price =${vo.p_price};
		var p_discount_rate =${vo.p_discount_rate};
		
		
		
		var final_price = p_price * (1-p_discount_rate/100);
		$("#finalPrice").html("할인적용된 가격 :"+final_price);		
		
		$("#pucharseProduct").click(function() {
			var count = $("#count").val();
			var amount=${vo.p_amount};
			var id = '${login.id}';
			
			if(count > amount){
				alert("구입 수량을 다시 입력해주세요. 등록한 상품수보다 많습니다.");
			}else{
				location.href="/product/purchaseProductPage?pno=${vo.pno}&count="+count;				
			}
						
		});
		
		$("#cartInsert").click(function() {			
			var pno = ${vo.pno};
			var id = '${login.id}';			
			var count = $("#count").val();
			var amount=${vo.p_amount};
			
			if(count > amount){
				alert("구입 수량을 다시 입력해주세요. 등록한 상품수보다 많습니다.");
			} else if (count < 0){
				alert("0보다 큰 값을 입력하세요");
			} else {
				//location.href="/product/purchaseProductPage?pno=${vo.pno}&count="+count;
				$.ajax({
					type : "PUT",
					url : "/cart/insert",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : "text",
					data : JSON.stringify({
						id : id,
						pno : pno,
						count : count
					}),
					success : function(result) {
						alert(result);					
					},error: function(result) {
						alert(result);
					}	 	
				});
			}
			
		/* 	 
		 */	
			  /*$.ajax({
					type : "PUT",
					url : "/cart/insert/" + ano,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : "text",
					success : function(result) {							
						getAllList();					
					}
			}); */			
			
			/* /cart/insert?pno=${vo.pno}&id=${login.id} */
		});
		
	});
	

</script>
</html>