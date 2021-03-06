<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
 <style type="text/css">
 .fileDrop{
		width: 80%;
		height: 100px; 
		border: 1px dotted gray;
		background-color: lightslategray;
		margin: auto;
	}
 </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin_page_header.jsp"></jsp:include>
	<div class="container">
		<div class="row">			
			<br>
			<h2>
				<span class="label label-info">상품 등록</span>
			</h2>
			<hr>
			
		
				 
			<%-- <input value="${cri.page}" name="page" type="hidden">
			<input value="${cri.perPageNum}" name="perPageNum" type="hidden"> --%>
				<form id="myForm" role="form" enctype="multipart/form-data" method="post">
				
				<table border="1" style="border-color: red;" class="table table-bordered table-hover">				
				
				<tr>
					<td>구기종목</td>
					<td><select class="selectpicker show-tick" data-width="auto"
							id="p_category" name="p_category">
							<option disabled data-icon="fa fa-sort"
								data-header="Select a condiment">카테고리선택</option>
							<option value="baseball">야구</option>
							<option value="soccer">축구</option>
							<option value="basketball">농구</option>							
						</select>
						</td>
				</tr>
				
				<tr>
					<td>상품제목</td>
					<td><input id="p_title" name="p_title" class="form-control" placeholder="제목명"></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input id="p_name" name="p_name" class="form-control" placeholder="상품명"></td>
				</tr>
				<tr>
					<td>브랜드</td>
					<td><input id="p_brand_name" name="p_brand_name" class="form-control" placeholder="제조 회사명"></td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td><select class="selectpicker show-tick" data-width="auto"
							id="p_size" name="p_size">
							<option disabled data-icon="fa fa-sort"
								data-header="Select a condiment">카테고리선택</option>
							<option value="xs">XS</option>
							<option value="s">S</option>
							<option value="m">M</option>							
							<option value="l">Large</option>							
							<option value="x-lg">X-Large</option>							
						</select>
					</td>
				</tr>
				<tr>
					<td>원가</td>
					<td><input type="number" id="p_ori_price" name="p_ori_price" class="form-control" placeholder="제품 원가격을 입력하시오"></td>
				</tr>
				<tr>
					<td>판매가</td>
					<td><input type="number" id="p_price" name="p_price" class="form-control" placeholder="판매가격을 적으시오"></td>
				</tr>
				<tr>
					<td>할인율(0~100%까지)</td>
					<td><input type="number" id="p_discount_rate" name="p_discount_rate" class="form-control" placeholder="할인율을 0부터 100 사이의 숫자를 적으시오"></td>
				</tr>
				<tr>
					<td>입고량</td>
					<td><input type="number" id="p_ori_amount" name="p_ori_amount" class="form-control" placeholder="제품 등록량을 적으시오"></td>
				</tr>
				<tr>
					<td>재고량</td>
					<td><input type="number" id="p_amount" name="p_amount" class="form-control" placeholder="입고량과 동일합니다."></td>
				</tr>
				<tr>
					<td>원산지</td>
					<td><input  name="p_made" id="p_made" class="form-control" placeholder="원산지를 적으시오"></td>
				</tr>
				
				<!-- 등록자는 로그인 구현후 삭제한다!!!
				
					로그인을 하면 해당 id를 가져와 밑에 바로 readonly 로 뿌려준다.
				 -->
				
				
					
				<%-- 	<td><input  name="id" id="id" value="${login.id}" type="hidden" class="form-control" placeholder="DB상품 등록자 본인 이름"></td> --%>
				
				<input  name="id" id="id" value="${login.id}" type="hidden" class="form-control" placeholder="DB상품 등록자 본인 이름"></td>
				
				
				<tr>
					<td>메인 이미지 파일</td>
					<td><input  name="file1 " id="file1 " type="file" class="form-control" placeholder="메인이미지 파일을 선택하세요"></td>
				</tr>
				
				<tr>
					<td>서브 이미지</td>
					<td><input  name="file2" id="file2" type="file" class="form-control" placeholder="서브이미지 파일을 선택하세요"></td>
				</tr> 
				<%-- <tr>
					<td>판매자(id)</td>
					<td><input  name="id" id="id" class="form-control" readonly="readonly">${userVO.id}</td>
				</tr> --%>
				
				
				</table>			
							
			<div class="form-group">
				<h3>상품상세내용</h3>
				<textarea name="p_content" id="p_content" class="form-control"></textarea>	
			</div>			
		
								
			</form>
			
			<div class="form-group">
            <div class="col-lg-12" align="right">
                <button type="submit" class="btn btn-success btn-lg">상품등록</button>
            </div>
			</div>
		
					
		</div>
	</div>
	
		<br>
		<jsp:include page="/WEB-INF/views/page_footer.jsp"></jsp:include>

		<!-- <script id="source" type="text/x-handlebars-template">
			
			 <li class="col-xs-3">
					<span>
						<img src="{{imgsrc}}">
					</span>
					<div>
						<a href="{{getLink}}">{{fileName}}</a>				
						<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><span class="glyphicon glyphicon-remove-circle"/></a>					
					</div>
				</li> 			
			</script>  
		-->

	<!-- 로그인창 중앙정렬 -->
	<script type="text/javascript">
	
	$(document).ready(function () {
		
		  var position ='${login.position}';
		  
		  if(position == 'user'){
			  alert("권한이 없습니다.");
			  location.href="/";
		  }
		
		
		CKEDITOR.replace('p_content', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'100%',
            height:'400px',
            filebrowserImageUploadUrl: '/community/imageUpload' //여기 경로로 파일을 전달하여 업로드 시킨다. 
        });
		
		 CKEDITOR.on('dialogDefinition', function( ev ){
	            var dialogName = ev.data.name;
	            var dialogDefinition = ev.data.definition;
	          
	            switch (dialogName) {
	                case 'image': //Image Properties dialog
	                    //dialogDefinition.removeContents('info');
	                    dialogDefinition.removeContents('Link');
	                    dialogDefinition.removeContents('advanced');
	                    break;
	            }
	        });
		
		
		
		$("button[type='submit']").click(function () {
			
			
			var $form = $("form[role='form']");
			var p_category = $("#p_category").val();
			var p_title= $("#p_title").val();
			var p_name= $("#p_name").val();
			var p_brand_name= $("#p_brand_name").val();
			var p_size= $("#p_size").val();
			var p_ori_price= $("#p_ori_price").val();
			var p_price= $("#p_price").val();
			var p_discount_rate= $("#p_discount_rate").val();
			var p_ori_amount= $("#p_ori_amount").val();
			var p_amount= $("#p_amount").val();
			var p_made= $("#p_made").val();
			var p_content= $("#p_content").val();
			
			
			var id= $("#id").val();//로그인 구현후 삭제할 변수!!!!
	
		/* var p_img_1  구현 준비중*/ 
			
		
		if (p_category == "") {
			alert("종목명을 입력하세요");
			return false;						
		}else if (p_title == "") {
			alert("타이틀을 입력하세요");
			return false;
		} else if (p_name == "") {
			alert("상품명을 입력하세요");
			return false;
		}else if (p_brand_name == "") {
			alert("브랜드명을 입력하세요");
			return false;
		}else if (p_brand_name == "") {
			alert("사이즈를 입력하세요");
			return false;
		}else if (p_ori_price == "") {
			alert("원가격을 입력하세요");
			return false;
		}else if (p_price == "") {
			alert("판매가격을 입력하세요");
			return false;
		}else if (p_discount_rate == "") {
			alert("할인율을 입력하세요");
			return false;
		}else if (p_ori_amount == "") {
			alert("입고량을 입력하세요");
			return false;
		}else if (p_amount == "") {
			alert("초기 재고량을 입력하세요");
			return false;
		}else if (p_made == "") {
			alert("원산지를 입력하세요");
			return false;
		 }else {
			
			alert("상품이 등록되어졌습니다.")
			
			$form.attr("action", "/product/insertProduct");
			$form.attr("method", "post");
			$form.get(0).submit();	
		
		}  
		
	

		
		
		
		});
		
		
		
		/* var width=$("div.container").innerWidth();
		var height = window.innerHeight;
		var h=$(".row").innerHeight(); */
		//$(".row").css("margin-top", height/2-h/2);

	
		
         
        /* CKEDITOR.replace( 'content', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'100%',
            height:'400px',
            filebrowserImageUploadUrl: '/community/imageUpload' //여기 경로로 파일을 전달하여 업로드 시킨다.
        });
         
         
        CKEDITOR.on('dialogDefinition', function( ev ){
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;
          
            switch (dialogName) {
                case 'image': //Image Properties dialog
                    //dialogDefinition.removeContents('info');
                    dialogDefinition.removeContents('Link');
                    dialogDefinition.removeContents('advanced');
                    break;
            }
        });
 */         
    })



	</script>
</body>
</html>