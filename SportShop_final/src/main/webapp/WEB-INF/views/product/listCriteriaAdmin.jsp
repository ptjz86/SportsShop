<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:include page="../header.jsp"></jsp:include>
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function () {
	
	  var position ='${login.position}';
	  
	  if(position == 'user'){
		  alert("������ �����ϴ�.");
		  location.href="/";
	 }
	 
	 
});
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/admin_page_header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<br>
			<h2>
				<span class="label label-info">�����Ȳ</span>
			</h2>
			<hr>
			
			<table border="1" class="table table-bordered table-condensed table-hover">
				<thead>
				<tr class="info">
					<th>��ǰ��ȣ</th>
					<!-- <td>����� ������ �÷����� ��</td> -->
					<th>����</th>
					<th>����</th>
					<th>��ǰ��</th>
					<th>�귣���</th>
					<th>������</th>
					<th>����</th>
					<th>�ǸŰ�</th>
					<th>������</th>
					<th>�԰�</th>
					<th>���</th>
					<th>������</th>
					<th>��õ��</th>
					<th>�����</th>
					<th>������</th>
					<th>����</th>
					<th>����</th>					
					<!-- <td>���뺸��</td> ������� �������� �Ѿ�Բ� �ϱ� -->
				</tr>
				</thead>
				
				
				<tbody>
				
				<c:forEach items="${listAllProduct}" var="pList"> <!-- attribute�� ������ �����͸� �ҷ��´� -->
					<tr>													
						<td>${pList.pno}</td>
						<td>${pList.p_category}</td>
						<td>${pList.p_title}</td>
						<td>${pList.p_name}</td>
						<td>${pList.p_brand_name}</td>
						<td>${pList.p_size}</td>
						<td>${pList.p_ori_price}</td>
						<td>${pList.p_price}</td>
						<td>${pList.p_discount_rate}</td>
						<td>${pList.p_ori_amount}</td>
						<td>${pList.p_amount}</td>
						<td>${pList.p_made}</td>
						<td>${pList.p_goodcnt}</td>
						<td>${pList.regdate}</td>
						<td>${pList.updatedate}</td>
						<td><a href="/product/updateProduct?pno=${pList.pno}" class="btn btn-info">����</a></td>
						<td><a href="/product/deleteProduct?pno=${pList.pno}" class="btn btn-warning">����</a></td>						
						
						<%-- <td>${pList.updatedate}</td> �������.jsp�� �̵��ϰ� ����! --%>
					</tr>
					
				</c:forEach>
				</tbody>	
			
			</table>
			
			<div class="row">
				<div class="text-center">
					<ul class="pagination">
						<li>							
							<li>
						<c:if test="${pageMaker.cri.page >1 }">
						<li><a href="listCriteriaAdmin${pageMaker.makeQuery(1)}">
											<span aria-hidden="true">First</span>
									</a></li>
						<li><a
							href="listCriteriaAdmin${pageMaker.makeQuery(pageMaker.cri.page-1)}">&laquo;</a></li>
							
						</c:if>
						
												
						<c:forEach begin="${pageMaker.startPageNum}"
						end="${pageMaker.endPageNum}" var="idx">
						<li							
							<c:out value="${pageMaker.cri.page==idx?'class=active' : ''}" />><a
							href="listCriteriaAdmin?page=${idx}&perPageNum=${pageMaker.cri.perPageNum}">${idx}</a></li>
					</c:forEach>					
					
					<c:if test="${pageMaker.cri.page < pageMaker.totalPage}">
						<li><a
							href="listCriteriaAdmin${pageMaker.makeQuery(pageMaker.cri.page+1)}">&raquo;</a></li>
							
						<li><a
										href="listCriteriaAdmin${pageMaker.makeQuery(pageMaker.totalPage)}">
											<span aria-hidden="true">Last</span>
									</a></li>
					</c:if>					
					</ul>

				</div>
			</div>
		
		
			
			
				
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/page_footer.jsp"></jsp:include>



</body>
</html>