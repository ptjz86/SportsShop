<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"></jsp:include>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="통계, 통계지리, 정보, 서비스" />
<meta name="Description" content="통계, 통계지리, 정보, 서비스" />
<title>공간통계 Open API제공리스트:통계지리 정보서비스</title>
<link rel="stylesheet" type="text/css" href="/OpenAPI2/resource/css/subpage/layout.css" />
<script type="text/javascript" language="javascript" src="/OpenAPI2/resource/js/jquery-1.8.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="/OpenAPI2/resource/css/map.css" />
	<script src="/OpenAPI2/resource/js/OpenLayers.js" type="text/javascript" ></script>
	<script src="/OpenAPI2/getMapControl.do?apikey=adminkey" type="text/javascript" ></script>
<script type="text/javascript">
//<![CDATA[
           function init(){
    	 self.focus();
     }
	function fncUrlView(){
		var form = document.caBoundary;
		var url = "http://sgis.kostat.go.kr/OpenAPI2/caBoundary.do?apikey=";
		var apikey = "";
		
		if(form.apikey.value != null && form.apikey.value !=""){
			url += form.apikey.value;
		}
		if(form.format.value != null && form.format.value != ""){
			url += "&format="+form.format.value;
		}
		if(form.reqtype.value != null && form.reqtype.value != ""){
			url += "&reqtype="+form.reqtype.value;
		}
		if(form.value.value != null && form.value.value != ""){
			url += "&value="+form.value.value;
		}
		form.url.value = url;
	}
	function fncExecute(){
		var form = document.caBoundary;
		var url = form.url.value;
		$.get(
				url ,
				function(data) {
					if(data.toString == null || data.firstChild != null){
						var str = xmlToString(data);
						form.result.value = str;
					}else{
						form.result.value = data;
					}
				}
		); 
		createMap();
	}
	function fncReqType(type){
		var form = document.caBoundary;
		form.reqtype.value = type;
		if(type=="code"){
			form.value.value = "25020";
		}else if(type=="area"){
			form.value.value = "POLYGON((197083.37619849 453025.14333113,196540.09871408 452506.56027784,198028.8201324 452076.17162136,198134.65340858 452619.44910577,197083.37619849 453025.14333113))";
		}else{
			form.value.value = "RECTANGLE(195809.38965089 451511.55603181,198631.61034911 453275.44396819)";
		}
	}
	
	function fncFormat(type){
		var form = document.caBoundary;
		form.format.value = type;
	}
	function xmlToString(xmlData) { 
		var xmlString;
		 if (window.ActiveXObject){
			 if (navigator.appVersion.indexOf("MSIE") != -1) {
					var ieInfo = navigator.appVersion.split("MSIE");
					var browserVersion = parseFloat(ieInfo[1]);
					if(browserVersion == "10"){
						xmlString = (new XMLSerializer()).serializeToString(xmlData);
					}else{
						xmlString = xmlData.xml;
					}
			} 
		 }else{
			 xmlString = (new XMLSerializer()).serializeToString(xmlData);
		 }
		 return xmlString;
	} 
	
	var i=0;
	function createMap(){
		if(i==0){
		/* 1. sgismap영역에 map생성 */
		mapCreate("sgismap");				

		/* 2. 지도 크기변경	 */
		document.getElementById("sgismap").style.width = "650px";
		document.getElementById("sgismap").style.height  = "150px";
		
		/* 3. 지도 레벨로 설정.*/
		var zoomLevel = (9);	

		/* 4. 중심점 설정(x,y) */
		var lonLat = new OpenLayers.LonLat(234563, 317915);
		
		/* 5. 설정한 좌표의 중심으로 지도를 이동 */
		sgismap.setCenter(lonLat, zoomLevel);
		}
		i=1;
		test();
	}
	
	function test(){
		var str = $("#urlStr").val();
		var form = document.caBoundary;
		var format = form.format.value;
		var apikey = $("#apikey").val();;
		$.ajax({ 
    		"url" : "/OpenAPI2/subpage/popTest/openAPI2_07_popExe.jsp"	,		    
    		data:{"str": str, "format": format, "apikey": apikey},
			"type" : "POST",
			"success" : function(result) {	
				$("#sgismap2").html(result);
				$("#sgisSource").val(result);
			},
			"error": function(x,o,e){
				alert(e);
					}
			});
		
		
	}
//]]>
</script>
</head>

<body onload="init()">
<noscript><p><a href="#">이 페이지에는 자바스크립트가 사용되었습니다.</a></p></noscript>

<div id="wrap" style="overflow:auto; height:695px">
    <!--contents-->
    <div id="contents">
    <h2 id="q_contents">컨텐츠 영역</h2>
      <div id="article">
		<!-- API 추가 시작 -->
			<div class="api_wrap">
			<p class="api_title">도시화지역 경계 API 활용 방법</p>
			<p class="api_tt2"> 1.로그인을 하시고 인증키 발급을 신청합니다.</p>
			<p class="api_tt2"> 2.통계청의 승인을 받아 인증키를 받게 됩니다.</p>
			<p class="api_tt2"> 3.아래 Request Parmeter에 값을 입력합니다.</p>
			<p class="api_tt2">   &nbsp;&nbsp; - "API발급키"는 발급 받으신 키 값을 반드시 입력해야 합니다.</p>
			<p class="api_tt2">   &nbsp;&nbsp; - 각 입력 항목에 값을 입력합니다.</p>
			<p class="api_tt2"> 4. “url보기” 버튼을 클릭합니다. 버튼 아래에 입력하신 조건을 만족하는 url이 나타납니다.</p>
			<p class="api_tt2"> 5. “예제 실행하기” 버튼을 클릭하면 다음과 같이 동작합니다.</p>
			<p class="api_tt2">   &nbsp;&nbsp; - Response 값이 나타납니다.</p>
			<p class="api_tt2">   &nbsp;&nbsp; - 소스코드가 생성됩니다.</p>
			<p class="api_tt2">   &nbsp;&nbsp; - 지도와 함께 결과가 표시됩니다.</p>
			<p class="api_tt2"> 6.조건을 다시 선택하여 결과를 조회할 수 있습니다.</p>
			<div class="api_sample">
			<form name="caBoundary">
			<input type="hidden" name="format" value="kml" />
			<input type="hidden" name="reqtype" value="code" />
			<table class="api_db2" summary="Request Parameter, 값으로 구성됩니다.">
				<caption>통계항목검색 API의 예제입니다.</caption>
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="t_c">Request Parameter</th>
						<th scope="col">값</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="t_c">apikey</td>
						<td><input type="text" name="apikey" id="apikey" value="API발급키"/></td>
					</tr>
					<tr>
						<td class="t_c">format</td>
						<td>
							<input type="radio" name="formatType" value="kml" checked="checked" id="format1" onclick="fncFormat('kml')" /><label for="format1" >kml</label>
							<input type="radio" name="formatType" value="geojson" id="format2" onclick="fncFormat('geojson')"/><label for="format2" >geojson</label>
						</td>
					</tr>
					<tr >
						<td class="t_c">reqtype</td>
						<td>
							<input type="radio" name="reqTypeID" value="code" checked="checked" onclick="fncReqType('code')" id="reqtype1"/><label for="reqtype1">행정구역단위</label>
							<input type="radio" name="reqTypeID" value="area" onclick="fncReqType('area')" id="reqtype2"/><label for="reqtype2" >임의영역</label>
							<input type="radio" name="reqTypeID" value="rect" onclick="fncReqType('rect')" id="reqtype3"/><label for="reqtype3" >사각형영역</label>
						</td>
					</tr>
					<tr>
						<td class="t_c">value</td>
						<td><input type="text" name="value" value="25020"/></td>
					</tr>
					<tr>
						<td class="t_c">url보기</td>
						<td><input type="button" name="urlview" onclick="fncUrlView()" value="url보기"/></td>
					</tr>
					<tr>
						<td colspan="2">
						<textarea rows="5" cols="50" readonly="readonly" name="url" id="urlStr" style="height:40px"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<a href="#" onclick="fncExecute();"><img src="/OpenAPI2/resource/images/btn_sample_play.gif" alt="예제실행하기" /></a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<textarea rows="5" cols="50" readonly="readonly" name="result" style="height:90px"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<textarea id="sgisSource" rows="5" cols="50" readonly="readonly" style="height:90px"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<div id="sgismap" style='width:650px;  height:150px; border:2px solid #DDDDDD;'></div>
						<div id="sgismap2"></div>
						</td>
					</tr>
				</tbody>
				</table>
			</form>
			</div><!--// api_sample -->
		</div><!--// api_wrap -->
		<!-- API 추가 끝 -->
      <!-- 상단 박스-->
      </div>
    </div>
    <!--/contents-->
</div>
</body>
</html>


