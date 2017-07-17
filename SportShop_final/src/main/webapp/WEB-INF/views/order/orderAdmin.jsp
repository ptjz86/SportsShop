<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:include page="../header.jsp"></jsp:include>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function (){
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
				<span class="label label-info">ȸ������ �ֹ� ����</span>
			</h2>
			<hr>
			<table border="1"
				class="table table-bordered table-condensed table-hover">
				<thead>
					<tr class="info">
						<th>#</th>
						<th>ID</th>
						<th>��ǰī�װ�</th>						
						<th>��ǰŸ��Ʋ</th>
						<th>��ǰ������</th>
						<th>��ǰ�̸�</th>
						<th>��ǰ�귣��</th>
						<th>��ǰ�̹���</th>
						<th>�ֹ� ����</th>
						<th>��� ���ϸ���</th>
						<th>ȹ�� ���ϸ���</th>
						<th>������ּ�</th>
						<th>�������ȭ��ȣ</th>
						<th>��ۻ���</th>						
					</tr>
				</thead>
				<tbody>
				 	<c:forEach items="${list}" var="c">
						<tr>
							<td>${c.ono}</td>
							<td>${c.id}	</td>
							<td>${c.o_category}</td>
							<td>${c.o_title}</td>
							<td>${c.o_size}</td>
							<td>${c.o_name}</td>
							<td>${c.o_brand_name}</td>
							<td><img src="/displayFile?fileName=${c.o_img_1}"></td>
							<td>${c.o_amount}</td>
							<td>${c.o_mileage_usage}</td>
							<td>${c.o_mileage_gain}</td>
							<td>${c.u_addr1} ${c.u_addr2}</td>
							<td>${c.u_phone}</td>
							<td>��ۻ����߰��ؾߵ�</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/page_footer.jsp"></jsp:include>
</body>
</html>