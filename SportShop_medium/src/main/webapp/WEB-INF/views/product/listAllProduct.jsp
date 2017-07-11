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
					<th>īƮ ���</th>
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
						<td><a href="/cart/insert?pno=${pList.pno}&id=${login.id}" class="btn btn-primary">���</a></td>
						
						<%-- <td>${pList.updatedate}</td> �������.jsp�� �̵��ϰ� ����! --%>
					</tr>
					
				</c:forEach>
				</tbody>	
			
			</table>
			
			
				
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/page_footer.jsp"></jsp:include>



</body>
</html>