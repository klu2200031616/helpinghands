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
    <h1>Pickup Donation Details</h1>
</header>

<div class="container">
    <h2>Pickup Information</h2>
    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>Pickup Point</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                    <th>Food Items</th>
                    <th>Educational Supplies</th>
                    <th>Clothes</th>
                    <th>Donor Name</th>
                    <th>Donation Drive</th>
                    <th>Status</th> <!-- New column for status -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="pickup" items="${pickups}">
                    <tr>
                        <td>${pickup.street}, ${pickup.city}, ${pickup.state}, ${pickup.pin}</td>
                        <td>${pickup.phoneNumber}</td>
                        <td>${pickup.email}</td>
                        <td>${pickup.foodItems}</td>
                        <td>${pickup.educationalSupplies}</td>
                        <td>${pickup.clothes}</td>
                        <td>${pickup.donar.id}</td>
                        <td>${pickup.drive.eventName}</td>
                        <td>
                            <!-- Check if status is 'Cancelled' -->
                            <c:choose>
                                <c:when test="${pickup.status == 'Cancelled'}">
                                    Cancelled
                                </c:when>
                                <c:otherwise>
                                    <!-- If status is not 'Cancelled', show the dropdown -->
                                    <form action="/items/updateStatus" method="post">
                                        <input type="hidden" name="pickupId" value="${pickup.id}">
                                        <select name="status" onchange="this.form.submit()">
                                            <option value="Pending" ${pickup.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                            <option value="Completed" ${pickup.status == 'Completed' ? 'selected' : ''}>Completed</option>
                                            <option value="In Progress" ${pickup.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                            <option value="Scheduled" ${pickup.status == 'Scheduled' ? 'selected' : ''}>Scheduled</option>
                                        </select>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <a href="/adminhome" class="button">Back to Dashboard</a>
</div>

</body>
</html>
