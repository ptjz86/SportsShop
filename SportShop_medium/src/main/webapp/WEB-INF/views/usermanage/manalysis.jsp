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
</head>
<body>
<jsp:include page="/WEB-INF/views/admin_page_header.jsp"></jsp:include>


<style>
#chartdiv {
  width: 100%;
  height: 500px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>


<!-- HTML -->
<div id="chartdiv"></div>


	<div class="container">
		<div class="row">
			<div class="table-responsive">
				<table class="table table_bordered table-hover" border="1">
					<thead>
						<tr class="info">
							<td>남자</td>
							<td>여자</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mAnalysis}" var="a">
						<tr>
							<td class="manCount" data-mcount="${a.mCount}">${a.mCount}</td>
							<td class="womanCount" data-wcount="${a.wCount}">${a.wCount}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="chart"></div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var strArray;
		
			var mCount =$(".manCount").attr("data-mcount");
			var wCount =$(".womanCount").attr("data-wcount");
		
			
			var chart = AmCharts.makeChart( "chartdiv", {
				  "type": "pie",
				  "theme": "light",
				  "dataProvider": [ {
				    "man": "man",
				    "litres": mCount
				  }, {
				    "woman": "woman",
				    "litres": wCount
				  }],
				  "valueField": "litres",
				  "titleField": "country",
				   "balloon":{
				   "fixedPosition":true
				  },
				  "export": {
				    "enabled": true
				  }
				} );
		});
	</script>
	
<jsp:include page="/WEB-INF/views/page_footer.jsp"></jsp:include>
</body>
</html>