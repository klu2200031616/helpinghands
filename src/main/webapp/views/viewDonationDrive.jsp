<%@page import="com.project.ProjectHelpingHands.admin.DonationDrive"%>
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
        
         .buttonn {
            display: inline-block;
            padding: 8px 20px;
            background-color: #007BFF;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            
        }
        .buttonn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<header>
    <h1> Donation Drive Details</h1>
</header>

<div class="container">
    <h2>Pickup Information</h2>
    <div class="table-wrapper">
        <table>
        <thead>
            <tr>
             <th>ID</th>
            <th>Image</th>
                <th>Event Name</th>
                <th>Donation Preferred</th>
                <th>Start Date</th>
                <th>End Date</th>
                <!-- Modify venue to street, city, state -->
                <th>Street</th>
                <th>City</th>
                <th>State</th>
                 <th>Pin</th>
                <th>Description</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<DonationDrive> donationDrives = (List<DonationDrive>) request.getAttribute("donationDrives"); // Retrieve donation drives from request scope
                if (donationDrives != null) {
                    for (DonationDrive drive : donationDrives) { 
            %>
                <tr>
                    <td><%= drive.getId() %></td>
                    <td>
                        <img src="<%= request.getContextPath() + "/uploads/" + drive.getImageFilePath() %>" 
     alt="Donation Drive Image" style="width: 100px; height: auto;">
                    </td>
                    <td><%= drive.getEventName() %></td>
                    <td><%= drive.getDonationPreferred() %></td>
                    <td><%= drive.getStartDate() %></td>
                    <td><%= drive.getEndDate() %></td>
                    <!-- Display street, city, and state -->
                    <td><%= drive.getStreet() %></td>
                    <td><%= drive.getCity() %></td>
                    <td><%= drive.getState() %></td>
                    <td><%= drive.getPin() %></td>
                    <td><%= drive.getDescription() %></td>
                    <td>
                        <a href="<%= request.getContextPath() + "/donation/edit/" + drive.getId() %>" class="button">Edit</a>
                    </td>
                    <td>
                        <a href="<%= request.getContextPath() + "/donation/delete/"+ drive.getId() %>"  onclick="return confirm('Are you sure you want to delete this drive?');" class="delete-btn">Delete</a>
                    </td>
                </tr>
            <% 
                    } 
                } else { 
            %>
                <tr>
                    <td colspan="11">No donation drives found.</td>
                </tr>
            <% 
                } 
            %>
        </tbody>
    </table>

    </div>
    <a href="/adminhome" class="buttonn">Back to Dashboard</a>
</div>

</body>
</html>
