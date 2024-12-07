<!DOCTYPE html>
<%@page import="com.project.ProjectHelpingHands.Donar"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <title>Helping Hands Navbar</title>
    <style>
        /* Reset styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: white;
            padding: 10px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .navbar-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .nav-links {
            list-style: none;
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .nav-links li a {
            text-decoration: none;
            color: #333;
            padding: 8px 12px;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        .nav-links li a:hover {
            background-color: #007bff;
            color: white;
        }

        .profile {
            position: relative;
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .profile .profile-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #007bff;
        }

        .profile-name {
            font-size: 1rem;
            font-weight: 500;
            color: #333;
        }

        .dropdown {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: white;
            border: 1px solid #ddd;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            z-index: 10;
            width: 200px;
        }

        .dropdown a {
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
            color: #333;
            padding: 10px 15px;
            transition: background-color 0.3s, color 0.3s;
        }

        .dropdown a:hover {
            background-color: #007bff;
            color: white;
        }

        .profile:hover .dropdown {
            display: block;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="navbar-container">
            <div class="logo">Helping Hands</div>
            <ul class="nav-links">
           <li><a href="/donarhome"> Home</a></li>
                <li><a href="/donation/listDonations"><i class="icon">&#128176;</i> Donate</a></li>
                <li><a href="/donation/volunteer"><i class="icon">&#128105;&#127995;&#8205;&#9878;&#65039;</i> Volunteer</a></li>
                <li><a href="/tips"><i class="icon">&#8505;</i> Tips</a></li>
                <li><a href="/feedback"><i class="icon">&#128172;</i> Feedback</a></li>
                <li class="profile">
                    <% 
                       Donar donar = (Donar) session.getAttribute("user");
                       if (donar != null) { 
                    %>
                        <div class="profile-info">
                            <img src="<%= request.getContextPath() %>/uploads/<%= donar.getProfileImagePath() != null && !donar.getProfileImagePath().isEmpty() ? donar.getProfileImagePath() : "default-profile.png" %>" 
                                alt="Profile Image" class="profile-img">
                            <span class="profile-name"><%= donar.getName() %></span>
                        </div>
                    <% 
                       } else { 
                    %>
                        <div class="profile-info">
                            <img src="images/default.png" alt="Default Profile" class="profile-img">
                            <span class="profile-name">Guest</span>
                        </div>
                    <% 
                       } 
                    %>
                    <div class="dropdown">
                        <a href="/angelpoints"><i class="icon">&#9733;</i> AngelPoints</a>
                        <a href="/items/pickuptracker"><i class="fas fa-truck"></i> Pickups Tracker</a>
                        <a href="/volunteer/registered"><i class="fas fa-users"></i> Registered Drives</a>
                        <a href="/profile"><i class="fas fa-user-circle"></i> Profile</a>
                        <a href="<%= request.getContextPath() %>/logout"><i class="icon">&#128274;</i> Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</body>
</html>
