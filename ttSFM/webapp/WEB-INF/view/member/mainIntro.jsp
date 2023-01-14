<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.log4j.LogManager" %>  
<%@page import="org.apache.log4j.Logger" %> 
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	HttpSession ss = request.getSession();
    String memnum = (String)ss.getAttribute("memnum");
	logger.info("memnum >> "+ memnum);
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티키타카 소개</title>
  <!-- Favicon-->
       <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
       <!-- Font Awesome icons (free version)-->
       <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
       <!-- Google fonts-->
       <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
       <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
       <!-- Core theme CSS (includes Bootstrap)-->
       <link rel="stylesheet" type="text/css" href="/ttSFM/include/mainIntroducepage.css">
		<link rel="stylesheet" href="/ttSFM/include/Login.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type='text/javascript'>

	$(document).ready(function(){
		$("#maingo").on("click", function(){
			$("#maindata").attr({
				"action":"maingo.sfm",
			    "method":"POST",
			    'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
	});
	
	window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
        if (!navbarCollapsible) {
            return;
        }
        if (window.scrollY === 0) {
            navbarCollapsible.classList.remove('navbar-shrink')
        } else {
            navbarCollapsible.classList.add('navbar-shrink')
        }
    };

    // Shrink the navbar 
    navbarShrink();
    // Shrink the navbar when page is scrolled
    document.addEventListener('scroll', navbarShrink);

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 72,
        });
    };

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });

});
	
</script>
</head>
   <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top">
              	 <img class="tikitaka" src="/ttSFM/img/fb/tikilogo2.png" style="width:100px;"/></a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">소셜 스포츠</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">티키타카</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">경기목록 보러가기</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- 헤더 -->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="/ttSFM/img/fb/fb13.jpg" alt="..." />
                <!-- Masthead Heading-->
                <br>
                <br>
                <h1 class="masthead-heading text-uppercase mb-0">MATCH START</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
               <img src="/ttSFM/img/fb/fb12.png" style="width: 892px;margin-top: 20px;">
            </div>
        </header>
        <!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">SOCIAL SPORTS</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <h3 align="center" style="font-size:30px;">일반인들이 사교(social)와 관계형성 및 여가시간 활용 등을 위한 목적으로 하는 스포츠 활동</h3>
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                          
                        </div>
                    </div>
                    <!-- Portfolio Item 2-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            
                        </div>
                    </div>
                    <!-- Portfolio Item 3-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                          
                        </div>
                    </div>
                    <!-- Portfolio Item 4-->
                    <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal4">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                           
                        </div>
                    </div>
                    <!-- Portfolio Item 5-->
                    <div class="col-md-6 col-lg-4 mb-5 mb-md-0">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal5">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                          
                        </div>
                    </div>
                    <!-- Portfolio Item 6-->
                    <div class="col-md-6 col-lg-4">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal6">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About Section-->
        <section class="page-section bg-primary text-white mb-0" id="about">
            <div class="container">
                <!-- About Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-white">TIKI TAKA</h2>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <!-- About Section Content-->
                <div class="row">
                	<p align="center"><b>다양한 사람들과 내가 원하는 시간, 장소에서 풋살하자 !!!</b></p></div>
                </div>
                <!-- About Section Button-->

            </div>
        </section>
        <!-- Contact Section-->
        
       <div class="left">
       	<br>
       	<br>
       	<br>
       	<br>
       	<br>
       	<br>
       	
<!-- 		 <h3 align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지금 가입하고  즐기자 !</h3> -->
<!--   		Submit Button -->
<!--   		<button class="btn btn-primary btn-xl disabled" id="submitButton" type="button" style="margin: 20px auto;margin-left: 313px;">회원가입</button> -->
		<br>
		<br>
			<h3 align="center">경기목록 보러가기 !</h3>
			<form id="maindata" name="maindata">
<%-- 				<input type="hidden" id="memnum" name="memnum" value="<%= memnum %>"/> --%>
				<button class="login100-form-btn" type="submit" id="maingo" name="maingo" style="margin: 20px auto;margin-left: 305px; width: 298px;">경기목록 보기</button>
			</form>
		</div>
        <div class="right">
      		<img src="/ttSFM/img/fb/fb16.jpg" style="width: 957px;height: 540px;">
		</div>               
    </body>
</html>