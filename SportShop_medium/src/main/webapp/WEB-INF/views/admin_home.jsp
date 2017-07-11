<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Excerciser</title>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}



	img {
		width: 500px;
		height: 450px;
		
	}
	
	div #leftBox {

	height: 300px;
	width: 200px;
	
	}
	
	div #rightBox {

	width: 220px;
	
	}
</style>
<script type="text/javascript">
  $(document).ready(function() {
	  
	  setInterval("getServerTime()", 1000);
	

  
  });
  
  function getServerTime() {
		$.ajax({
			url: "/replies/time",
			type : "GET",
			success: function(result) {
				
				$("#serverTime").html(result);
							
			}
			
			
		});
		
	}
  
  
  </script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/admin_page_header.jsp"></jsp:include>

	<div class="container text-center">
		<div class="row">
			<div class="col-sm-3 well">
				<div class="well">
					<p>
						<a href="#">My Profile</a>
					</p>
					<a href="#">내 정보관리</a>
					<!--    <a href="#">주문 관리</a> -->
					<!-- <a id="logout" href="/user/logout">로그아웃</a> -->
					<!--         <img src="bird.jpg" class="img-circle" height="65" width="65" alt="Avatar"> -->
				</div>

				<div class="alert alert-success fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
					<p>
						<strong>Enjoy!</strong>
					</p>
					Exceriser에 오신 것을 환영합니다.
				</div>

			</div>

			<div class="col-sm-7">
			
				<div style="position: relative; left: 100px;" class="row">

					<div>
						<img class="mySlides" src="../resources/img/soccer.jpg">
						<img class="mySlides" src="../resources/img/baseball.jpg"> 
						<img class="mySlides" src="../resources/img/basketball.jpg">
						
					</div>

				</div>
				
				<br>
				
				
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default text-left">
							<div class="panel-body">
								<p contenteditable="true">공지사항 보여주는 곳</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">밑에 상품 목록 보여주는곳.</div>

				<div class="row">
					<div class="col-sm-3">
						<div class="well">
							<p>축구 상품 목록들.</p>
							<!-- <img src="bird.jpg" class="img-circle" height="55" width="55" alt="Avatar"> -->
						</div>
					</div>
					<div class="col-sm-9">
						<div class="well">
							<p>여기 ul li로 목록 보여줘야됨... 축구 상품 베스트 상품들. 여기를 슬라이드식으로 보여주는 것이
								좋을까?</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div class="well">
							<p>야구 상품 목록들.</p>
							<!-- <img src="bandmember.jpg" class="img-circle" height="55" width="55" alt="Avatar"> -->
						</div>
					</div>
					<div class="col-sm-9">
						<div class="well">
							<p>여기 ul li로 목록 보여줘야됨... 야구 상품 베스트 상품들. 여기를 슬라이드식으로 보여주는 것이
								좋을까?</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div class="well">
							<p>농구 상품 목록들</p>
							<!-- <img src="bandmember.jpg" class="img-circle" height="55" width="55" alt="Avatar"> -->
						</div>
					</div>
					<div class="col-sm-9">
						<div class="well">
							<p>여기 ul li로 목록 보여줘야됨.... 농구 상품 베스트 상품들. 여기를 슬라이드식으로 보여주는 것이
								좋을까?</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div class="well">
							<p>축구 게시판, 야구 게시판, 농구 게시판 한개씩 보여주기. 조금만하게</p>
							<!-- <img src="bird.jpg" class="img-circle" height="55" width="55" alt="Avatar"> -->
						</div>
					</div>
					<div class="col-sm-9">
						<div class="well">
							<p>축구게시판 ul1개, 야구 게시판 ul1개, 농구 게시판 ul1개</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-2 well">
				<!-- <div class="thumbnail">
        <p>Upcoming Events:</p>
        <img src="paris.jpg" alt="Paris" width="400" height="300">
        <p><strong>Paris</strong></p>
        <p>Fri. 27 November 2015</p>
        <button class="btn btn-primary">Info</button>
      </div>       -->
				<div class="well">
					<p id="serverTime"></p>
				</div>
				<div class="well">
					<p>ADS1</p>
				</div>
				<div class="well">
					<p>ADS2</p>
				</div>
				<div class="well">
					<p>ADS3</p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var slideIndex = 0;
			carousel();

			function carousel() {
				var i;
				var x = document.getElementsByClassName("mySlides");
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				slideIndex++;
				if (slideIndex > x.length) {
					slideIndex = 1
				}
				x[slideIndex - 1].style.display = "block";
				setTimeout(carousel, 2000); // Change image every 2 seconds
			}
			
			
			
			$("#logout").click(function() {
				alert("ㅇㅇ");
				
			});
			
		});
	</script>

	<jsp:include page="/WEB-INF/views/page_footer.jsp"></jsp:include>

</body>
</html>

