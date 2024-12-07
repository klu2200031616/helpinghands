<%@page import="com.project.ProjectHelpingHands.Donar"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
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

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 1rem;
            margin-bottom: 5px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        input[readonly], textarea[readonly] {
            background-color: #f9f9f9;
        }

        .submit-btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Profile</h2>
         <% 
           Donar donar = (Donar) session.getAttribute("user");
           if (donar != null) {
        %>
        <form action="<%= request.getContextPath() %>/updateUserProfile" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= donar.getName() %>" readonly />
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= donar.getEmail() %>" readonly />
            </div>
            <div class="form-group">
                <label for="profileImage">Profile Image:</label>
                <input type="file" id="profileImage" name="profileImage" />
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" rows="3"><%= donar.getAddress() %></textarea>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" value="<%= donar.getPhoneNumber() %>" />
            </div>
            <button type="submit" class="submit-btn">Update Profile</button>
        </form>
        <% 
           } else { 
        %>
        <p>User not logged in. Please <a href="<%= request.getContextPath() %>/login">log in</a> to view your profile.</p>
        <% 
           } 
        %>
    </div>
</body>
</html>
