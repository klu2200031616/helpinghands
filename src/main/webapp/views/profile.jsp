<%@page import="com.project.ProjectHelpingHands.Donar"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f9f9f9;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
        }

        .header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #007bff;
        }

        .edit-btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .edit-btn:hover {
            background-color: #0056b3;
        }

        .user-info {
            margin-top: 20px;
        }

        .user-info h2 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .user-info p {
            margin: 10px 0;
            font-size: 1rem;
            color: #555;
        }

        .info-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .info-group button {
            font-size: 0.9rem;
            padding: 5px 10px;
            border: none;
            background: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .info-group button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
<jsp:include page="donarnav.jsp" />
    <div class="container">
        <% 
           Donar donar = (Donar) session.getAttribute("user");
           if (donar != null) {
        %>
        <!-- Header Section -->
        <div class="header">
            <div>
                <img src="<%= request.getContextPath() %>/uploads/<%= donar.getProfileImagePath() != null && !donar.getProfileImagePath().isEmpty() ? donar.getProfileImagePath() : "default-profile.png" %>" 
                     alt="Profile Image" class="profile-img">
            </div>
            <div>
                <h2><%= donar.getName() %></h2>
            </div>
        </div>

        <!-- User Info Section -->
        <div class="user-info">
            <div class="info-group">
                <p><strong>Email:</strong> <%= donar.getEmail() %></p>
            </div>
            <div class="info-group">
                <p><strong>Address:</strong> <%= donar.getAddress() %></p>
                
            </div>
            <div class="info-group">
                <p><strong>Phone Number:</strong> <%= donar.getPhoneNumber() %></p>
              
            </div>
        </div>

      
<!--         <div class="user-info">
            <button class="edit-btn" onclick="editProfile()">Edit Profile</button>
        </div>  -->

        <% 
           } else { 
        %>
        <p>User not logged in. Please <a href="<%= request.getContextPath() %>/login">log in</a> to view your profile.</p>
        <% 
           } 
        %>
    </div>

    <script>
        function editProfile() {
            window.location.href = "<%= request.getContextPath() %>/editUserProfile";
        }

        function editAddress() {
            window.location.href = "<%= request.getContextPath() %>/editAddress.jsp";
        }

        function editPhone() {
            window.location.href = "<%= request.getContextPath() %>/editPhone.jsp";
        }
    </script>
</body>
</html>
