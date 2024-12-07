<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
  <title>
   Helping Hands
  </title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
  <style>
    body {
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background-color: #f5f5f5;
      padding: 20px;
    }
    .container {
      max-width: 1200px;
      margin: 0 auto;
    }
    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .navbar .logo img {
      height: 40px;
      width: auto;
    }
    .navbar a {
      text-decoration: none;
      color: #333;
      margin: 0 15px;
      font-size: 16px;
      position: relative;
    }
    .navbar a:hover {
      color: #007bff;
    }
    .navbar a.button {
      padding: 10px 20px;
      border: 1px solid #333;
      border-radius: 20px;
      background-color: #fff;
      color: #333;
      font-weight: bold;
    }
    .navbar a.button:hover {
      background-color: #333;
      color: #fff;
    }
    .hero {
      text-align: center;
      background: url('images/image3.jpg') no-repeat center center;
      background-size: cover;
      padding: 100px 20px;
      color: #333;
      height: 100vh;
    }
    .hero .blurred-box {
      background: rgba(255, 255, 255, 0.2);
      backdrop-filter: blur(10px);
      padding: 20px;
      border-radius: 70px;
      display: inline-block;
    }
    .hero h1 {
      font-size: 48px;
      margin: 20px 0;
    }
    .hero h2 {
      font-size: 24px;
      margin: 20px 0;
    }
    .hero .cta-button {
      padding: 15px 30px;
      background-color: #fff;
      color: #333;
      border: 1px solid #333;
      border-radius: 30px;
      text-decoration: none;
      font-size: 18px;
      font-weight: bold;
    }
    .hero .cta-button:hover {
      background-color: #333;
      color: #fff;
    }
    .footer {
      background-color: #fff;
      padding: 10px 0;
      position: fixed;
      bottom: 0;
      width: 100%;
      box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
      text-align: center;
    }
    .footer .scrolling-text {
      overflow: hidden;
      white-space: nowrap;
    }
    .footer .scrolling-text span {
      display: inline-block;
      font-size: 14px;
      color: #333;
      animation: scrollFooter 15s linear infinite;
    }
    @keyframes scrollFooter {
      from {
        transform: translateX(100%);
      }
      to {
        transform: translateX(-100%);
      }
    }
    .fundraiser-card img {
      transition: transform 0.3s ease;
    }
    .fundraiser-card img:hover {
      transform: scale(1.05);
    }
    .fundraiser-card .donations {
      position: absolute;
      bottom: 0;
      left: 0;
      color: black;
      padding: 2px;
      border-radius: 0 0 0 8px;
    }
    .fundraiser-card .description {
      margin-top: 10px;
      text-align: center;
    }
    .main-content {
      padding: 0 2cm;
    }
  </style>
 </head>
 <body>
  <div class="container">
   <div class="navbar">
    <div class="logo">
     <img alt="Helping Hands logo" height="60" src="images/image2.jpg" width="80"/>
    </div>
    <div class="nav-links">
     
     <a href="/tips">
      Tips
     
     </a>
     <a href="aboutus">
      About
     </a>
     <a href="login">
      Sign in
     </a>
     <a class="button" href="#">
      Start a Campaign
     </a>
    </div>
   </div>
   <div class="hero">
    <div class="blurred-box">
     <h2>
      Leading crowdfunding platform
     </h2>
     <h1>
      Your home for help
     </h1>
     <a class="cta-button" href="#">
      Start a GoFundMe
     </a>
    </div>
   </div>
   <div class="main-content">
  <h2 class="text-center text-3xl font-bold mt-10 mb-6">What We Do</h2>
  <div class="grid gap-6 grid-cols-3 mb-6">
    
    <div class="fundraiser-card relative bg-white shadow-lg rounded-lg overflow-hidden hover:shadow-2xl transition-shadow duration-300">
      <img src="images/disaster.png" alt="Natural Disasters" class="w-full h-48 object-cover">
      <div class="p-4 text-center">
        <h3 class="font-bold text-xl">Disaster Relief</h3>
        <p class="description text-gray-600 mt-2">Providing immediate support to victims of natural disasters.</p>
      </div>
    </div>
    
    <div class="fundraiser-card relative bg-white shadow-lg rounded-lg overflow-hidden hover:shadow-2xl transition-shadow duration-300">
      <img src="images/food.png" alt="Food Donations" class="w-full h-48 object-cover">
      <div class="p-4 text-center">
        <h3 class="font-bold text-xl">Food Donations</h3>
        <p class="description text-gray-600 mt-2">Connecting donors with communities in need of food supplies.</p>
      </div>
    </div>
    
    <div class="fundraiser-card relative bg-white shadow-lg rounded-lg overflow-hidden hover:shadow-2xl transition-shadow duration-300">
      <img src="images/blood.png" alt="Blood Donation" class="w-full h-48 object-cover">
      <div class="p-4 text-center">
        <h3 class="font-bold text-xl">Blood Donation</h3>
        <p class="description text-gray-600 mt-2">Organizing blood donation drives and connecting donors with recipients.</p>
      </div>
    </div>
  </div>

  <div class="grid gap-6 grid-cols-2 mb-6">
    
    <div class="fundraiser-card relative bg-white shadow-lg rounded-lg overflow-hidden hover:shadow-2xl transition-shadow duration-300">
      <img src="images/edu.jpg" alt="Education Supplies" class="w-full h-48 object-cover">
      <div class="p-4 text-center">
        <h3 class="font-bold text-xl">Education Supplies</h3>
        <p class="description text-gray-600 mt-2">Providing educational materials to underprivileged students.</p>
      </div>
    </div>
    
    <div class="fundraiser-card relative bg-white shadow-lg rounded-lg overflow-hidden hover:shadow-2xl transition-shadow duration-300">
      <img src="images/vol.jpg" alt="Volunteer Work" class="w-full h-48 object-cover">
      <div class="p-4 text-center">
        <h3 class="font-bold text-xl">Volunteer Network</h3>
        <p class="description text-gray-600 mt-2">Connecting volunteers with opportunities to make a difference.</p>
      </div>
    </div>
  </div>
</div>
   
   <div class="footer">
    <div class="scrolling-text">
     <span>Your support can make a real difference. Donate now to help those in need!</span>
    </div>
   </div>
  </div>
 </body>
</html>