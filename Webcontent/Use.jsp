<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./Style/swiper-bundle.min.css" />

<link rel="stylesheet" href="./Style/style.css" />
<style>
 * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        outline: none;
        font-family: 'Quicksand', sans-serif;
    }

    html {
        font-size: 62.5%;
    }

    .container {
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .form-wrapper {
        width: 100rem;
        height: 70rem;
        background-color: #fff;
        border-radius: 3rem;
        box-shadow: 0 2rem 6rem rgba(0, 0, 0, 0.3);
        position: relative;
        overflow: hidden;
        border: 5px solid;
        border-color: #A18AFF;
        display: flex;
    }

</style>
</head>
<body>
<div class="container">
    <div class="form-wrapper">
    <section class="main swiper mySwiper">
      <div class="wrapper swiper-wrapper">
        <div class="slide swiper-slide">
          
          <img src="images/img1.jpg" alt="" class="image" />
          <div class="image-data">
            <span class="text">Enjoy the finest coffee drinks.</span>
            <h2>
              Enjoy Our Exclusive <br />
              Coffee and Cocktails
            </h2>
            <a href="#" class="button">About Us</a>
          </div>
        </div>
        <div class="slide swiper-slide">
          <img src="images/img2.jpg" alt="" class="image" />
          <div class="image-data">
            <span class="text">We really like what we do.</span>
            <h2>
              Coffee Beans with a <br />
              Perfect Aroma
            </h2>
            <a href="#" class="button">About Us</a>
          </div>
        </div>
        <div class="slide swiper-slide">
          <img src="images/img3.jpg" alt="" class="image" />
          <div class="image-data">
            <span class="text">Making Our coffee with lover.</span>
            <h2>
              Alluring and Fragrant <br />
              Coffee Aroma
            </h2>
            <a href="#" class="button">About Us</a>
          </div>
        </div>
      </div>

      <div class="swiper-button-next nav-btn"></div>
      <div class="swiper-button-prev nav-btn"></div>
      <div class="swiper-pagination"></div>
    </section>

   
	</div>
</div>
 <!-- Swiper JS -->
    <script src="./Style/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
</body>
</html>