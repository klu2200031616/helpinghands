<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Helping Hands</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet" />
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
        
        
        
        .what-we-do {
    padding: 50px 20px;
    background-color: #ffffff;
    text-align: center;
}

.what-we-do .section-title {
    font-size: 32px;
    margin-bottom: 30px;
    color: #333333;
    font-weight: bold;
}

.card-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
}

.card {
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
    background-color: #f9f9f9;
}

.card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.card-content {
    padding: 20px;
    text-align: left;
}

.card h3 {
    font-size: 20px;
    margin-bottom: 10px;
    color: #007bff;
}

.card p {
    font-size: 16px;
    color: #555555;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
    background-color: #f0f8ff;
}

.card:hover h3 {
    color: #0056b3;
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
    </style>
</head>
<body>

    <div class="container">
        <%@ include file="navbar.jsp" %>
        <div class="hero">
            <div class="blurred-box">
                <h2>Leading crowdfunding platform</h2>
                <h1>What to Donate Anoynmously, then what are you waiting for</h1>
                <a class="cta-button" href="/donate">Donate Now</a>
            </div>
        </div>
        
        
        
    <!-- What We Do Section -->
    <section class="what-we-do">
        <h2 class="section-title">What We Do</h2>
        <div class="card-container">
            <div class="card">
                <img src="images/foodh.jpg" alt="Food Donation">
                <div class="card-content">
                    <h3>Food Donation</h3>
                    <p>Provide meals to those in need and fight hunger in our community.</p>
                </div>
            </div>
            <div class="card">
                <img src="images/edu.jpg" alt="Education Support">
                <div class="card-content">
                    <h3>Education Support</h3>
                    <p>Help children access education and create a brighter future.</p>
                </div>
            </div>
            <div class="card">
                <img src="images/blood.png" alt="Supplies Donation">
                <div class="card-content">
        <h3>Blood Donation Camps</h3>
        <p>Organize blood donation drives to save lives and support emergency needs.</p>
    </div>
            </div>
            <div class="card">
                <img src="images/money.jpg" alt="Monetary Support">
                <div class="card-content">
                    <h3>Monetary Support</h3>
                    <p>Offer financial aid to families struggling to make ends meet.</p>
                </div>
            </div>
            <div class="card">
                <img src="images/disaster.jpg" alt="Disaster Relief">
                <div class="card-content">
                    <h3>Disaster Relief</h3>
                    <p>Help victims of natural disasters rebuild their lives.</p>
                </div>
            </div>
            <div class="card">
    <img src="images/cloths.jpg" alt="Clothes Donation">
    <div class="card-content">
        <h3>Clothes Donation</h3>
        <p>Distribute clothes to those in need, ensuring dignity and warmth for all.</p>
    </div>
</div>
<div class="card">
    <img src="images/ea.jpg" alt="Easy Access">
    <div class="card-content">
        <h3>Easy Access</h3>
        <p>Ensure simple and convenient access to all our services and resources.</p>
    </div>
</div>
<div class="card">
    <img src="images/epick.jpg" alt="Easy Pickups">
    <div class="card-content">
        <h3>Easy Pickups</h3>
        <p>Facilitate hassle-free pickups for donated items directly from your location.</p>
    </div>
</div>

        </div>
    </section>
        
<div class="text-center py-12">
   <h2 class="text-2xl font-bold">
    Our process
   </h2>
   <p class="text-gray-600 mt-4">
    At Helping Hands, we make it easy for you to make a difference. Here's how our process works:
   </p>
   <div class="flex justify-center mt-8 space-x-8">
    <div class="text-center">
     <i class="fas fa-hand-holding-heart text-4xl text-yellow-500">
     </i>
     <h3 class="text-xl font-bold mt-2">
      Identify Needs
     </h3>
    </div>
    <div class="text-center">
     <i class="fas fa-donate text-4xl text-yellow-500">
     </i>
     <h3 class="text-xl font-bold mt-2">
      Collect Donations
     </h3>
    </div>
    <div class="text-center">
     <i class="fas fa-hands-helping text-4xl text-yellow-500">
     </i>
     <h3 class="text-xl font-bold mt-2">
      Distribute Aid
     </h3>
    </div>
    <div class="text-center">
     <i class="fas fa-smile text-4xl text-yellow-500">
     </i>
     <h3 class="text-xl font-bold mt-2">
      Share Impact
     </h3>
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
