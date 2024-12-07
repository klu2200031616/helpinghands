<%@page import="com.project.ProjectHelpingHands.Donar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
 <style>
     body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-image: url('images/adminbg.jpg'); /* Add your background image URL here */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
}


.containerNav {
    max-width: 1200px;
    margin: 0 auto;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    background-color: rgba(76, 175, 80, 1); /* Solid background by default */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    border-bottom: 2px solid #388E3C;
    transition: background-color 0.3s ease; /* Smooth transition for the hover effect */
}

.navbar:hover {
    background-color: rgba(76, 175, 80, 0.7); /* Change background transparency on hover */
}

.logo img {
    height: 50px;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 25px;
}

.nav-links a {
    text-decoration: none;
    color: #fff;
    font-size: 16px;
    padding: 8px 15px;
    border-radius: 5px;
    background-color: rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s ease, color 0.3s ease;
}

.nav-links a:hover {
    background-color: #FFD700;
    color: #333;
}

.navbar .button {
    padding: 10px 20px;
    border: 1px solid #FFD700;
    border-radius: 20px;
    background-color: #fff;
    color: #4CAF50;
    font-weight: bold;
    margin-left: 15px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.navbar .button:hover {
    background-color: #FFD700;
    color: #fff;
}

.profile {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 16px;
    color: #fff;
}

.profile i {
    font-size: 20px;
    color: #FFD700;
}

.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 40px 10%;
}

.card {
    display: flex;
    align-items: center;
    background-color: white;
    background-size: cover;
    background-repeat: no-repeat;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    margin: 10px;
    padding: 20px;
    width: 300px;
    transition: transform 0.3s;
    background-image: url('images/card-bg.jpg');
}

.card:hover {
    transform: scale(1.05);
}

.card img {
    height: 60px;
    width: auto;
    margin-right: 20px;
}

.card-text {
    font-size: 20px;
    font-weight: bold;
    color: green;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    min-width: 160px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
}

.dropdown-content a {
    color: green;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    transition: background-color 0.3s ease;
}

.dropdown-content a:hover {
    background-color: #f0f0f0;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #005700;
    border-radius: 4px;
}

.icon {
    font-size: 18px;
    color: white;
    padding: 8px 12px;
    transition: background-color 0.3s ease;
    cursor: pointer;
}

.icon:hover {
    background-color: #005700;
    border-radius: 4px;
}

    </style>
</head>
<body>
 <div class="containerNav">
   <div class="navbar">
    <div class="logo">
     <img alt="Helping Hands logo" height="60" src="images/image2.jpg" width="80"/>
    </div>
    <div class="nav-links">
   
     
      <a href="<%= request.getContextPath() %>/logout">Logout</a>
       <div class="profile">
            <i class="fas fa-user-circle fa-lg"></i>
            <% 
               Donar donar = (Donar) session.getAttribute("user"); // Retrieve donor from session
               if (donar != null) {
            %>
            <span id="username"><%= donar.getName() %></span> <!-- Display username -->
            <% 
               } else {
            %>
            <span>Please log in</span>
            <% 
               } 
            %>
         </div>
     
    </div>
   </div>
   <!-- Add Welcome Message -->
<div class="container">
   <h1 style="text-align: center; color: black; margin-bottom: 20px;">
      Welcome to Admin Home
   </h1>
   
    <div class="container">
        <a href="/items/pickups" class="card">
            <img src="https://cdn-icons-png.freepik.com/256/3045/3045670.png?semt=ais_hybrid" alt="Orders Icon">
            <div class="card-text">Pickups</div>
        </a>
        <a href="viewallproducts.jsp" class="card">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVp984WQCSjmwNULzOqM7aO83a8k9HrwHksbhXEJ8qFKCeieTwboZut3QVAR7obhidVaI&usqp=CAU" alt="Products Icon">
            <div class="card-text">Products</div>
        </a>
       <a href="/viewUsers" class="card">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpjQCpBrLxLxbK42EXzN54pfgw1-Yzt721Dt4wlyu28L4H2c8hDw1D8NhQj7hij2xMRJo&usqp=CAU" alt="Artisans Icon">
            <div class="card-text">View Users</div>
        </a>
        <a href="viewcustomers.jsp" class="card">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStAwYbeAXEUR9KdEOMhppqe05E3DsSaCARvab30P0GmKtiiTzdqvcrnxojWEov9I3QLiA&usqp=CAU" alt="Customers Icon">
            <div class="card-text">View Customers</div>
        </a>
       <a href="/donation/add" class="card">
            <img src="https://cdn-icons-png.flaticon.com/512/4285/4285597.png" alt="Add Events Icon">
            <div class="card-text">Add Donation Drive</div>
        </a>
        <a href="/donation/viewDrives" class="card">
            <img src="https://cdn-icons-png.freepik.com/512/4213/4213375.png" alt="View Events Icon">
            <div class="card-text">View All Donation Drives</div>
        </a>
    </div>



</body>
</html>