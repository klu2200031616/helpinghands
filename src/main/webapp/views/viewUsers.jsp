<%@page import="com.project.ProjectHelpingHands.Donar"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pickup Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #5f6368;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .container {
            padding: 30px;
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .table-wrapper {
            margin-top: 20px;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .button {
            display: inline-block;
            padding: 8px 20px;
            background-color: #007BFF;
            color: white;
            border-radius: 4px;
            text-decoration: none;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<header>
    <h1>Registered Donors Details</h1>
</header>

<div class="container">
    <h2>Pickup Information</h2>
    <div class="table-wrapper">
       <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Address</th>
                <th>Donation Preference</th>
                
            </tr>
        </thead>
        <tbody>
            <% 
                List<Donar> users = (List<Donar>) request.getAttribute("users"); // Retrieve users from request scope
                if (users != null) {
                    for (Donar user : users) { 
            %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getPhoneNumber() %></td>
                    <td><%= user.getAddress() %></td>
                    <td><%= user.getDonationPreference() %></td>
                    
                </tr>
            <% 
                    } 
                } else { 
            %>
                <tr>
                    <td colspan="7">No non-admin users found.</td>
                </tr>
            <% 
                } 
            %>
        </tbody>
    </table>

    </div>
    <a href="/adminhome" class="button">Back to Dashboard</a>
</div>

</body>
</html>
