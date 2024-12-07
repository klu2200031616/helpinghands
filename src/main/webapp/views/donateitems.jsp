<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.project.ProjectHelpingHands.admin.DonationDrive" %>
<html>
<head>
    <title>Donate Items</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        .form-section, .details-section {
            width: 45%;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }
        .form-section h3, .details-section h3 {
            color: #333;
            margin-bottom: 10px;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        #mapDirections {
            background-color: #008CBA;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        #mapDirections:hover {
            background-color: #0077A1;
        }
    </style>
</head>
<body>
    <jsp:include page="donarnav.jsp" />
    <div class="container">
        <!-- Left Side: Form -->
        <div class="form-section">
            <h3>Place Pickup</h3>
            <form action="${pageContext.request.contextPath}/items/placePickup/${drive.id}" method="get">
                ${param.id}
                <p><strong>Event Name:</strong> ${drive.eventName}</p>
                <p><strong>Event ID:</strong> ${drive.id}</p>
                <!-- Form fields for the pickup details -->
                <label for="street">Street:</label>
                <input type="text" id="street" name="street" required><br><br>

                <label for="city">City:</label>
                <input type="text" id="city" name="city" required><br><br>

                <label for="state">State:</label>
                <input type="text" id="state" name="state" required><br><br>

                <label for="pin">Pin Code:</label>
                <input type="text" id="pin" name="pin" required><br><br>

                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" required>

                <label for="email">Email:</label>
                <input type="text" id="email" name="email" required>

                <label for="foodItems">Food Items:</label>
                <textarea id="foodItems" name="foodItems"></textarea>

                <label for="educationalSupplies">Educational Supplies:</label>
                <textarea id="educationalSupplies" name="educationalSupplies"></textarea>

                <label for="clothes">Clothes:</label>
                <textarea id="clothes" name="clothes"></textarea>

                <input type="hidden" name="driveId" value="${param.driveId}">

                <button type="submit">Place Pickup</button>
            </form>
        </div>

        <!-- Right Side: Drive Details -->
        <div class="details-section">
            <h3>Drive Details</h3>
            <c:if test="${not empty drive}">
                <p><strong>Event Name:</strong> ${drive.eventName}</p>
                <p><strong>Start Date:</strong> ${drive.startDate}</p>
                <p><strong>End Date:</strong> ${drive.endDate}</p>
                <p><strong>Venue:</strong> 
                <span id="venueAddress">${drive.street}, ${drive.city}, ${drive.state}, ${drive.pin}</span> 
                </p>
               
                
                <p><strong>Description:</strong> ${drive.description}</p>
            </c:if>
            
<button id="mapDirections" onclick="window.location.href='https://www.google.com/maps?q=${drive.street},${drive.city}, ${drive.state}';">View Location</button>

   
        </div>
        
    </div>

</body>
</html>
