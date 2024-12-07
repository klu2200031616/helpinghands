<%@page import="com.project.ProjectHelpingHands.admin.DonationDrive"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Donation Drive Details</title>
    <style>
  body {
            background-color: #e0f7fa;
            font-family: Arial, sans-serif;
        }

        .filter-container {
            text-align: center;
            margin: 20px 0;
        }

        .filter-container form {
            display: inline-block;
            text-align: left;
        }

        .filter-container select,
        .filter-container input[type="submit"] {
            padding: 8px;
            margin: 5px 0;
            font-size: 14px;
        }

        .filter-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .filter-container input[type="submit"]:hover {
            background-color: #45a049;
        }

        .card-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            margin-top: 20px;
            padding: 20px;
        }

        .card {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 700px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 15px;
            display: flex;
            flex-direction: row;
            gap: 15px;
            align-items: center;
        }

        .card img {
            width: 180px;
            height: 120px;
            object-fit: cover;
            border-radius: 8px;
        }

        .card .content {
            flex: 1;
            text-align: left;
        }

        .card h3 {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
        }

        .card p {
            font-size: 14px;
            color: #666;
            margin: 5px 0;
        }

        .card .buttons {
            margin-top: 10px;
            display: flex;
            gap: 10px;
        }

        .card .button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .card .button:hover {
            background-color: #45a049;
        }

        .card .button:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }

        .disclaimer {
            margin-top: 40px;
            background-color: #fff9c4; /* Light yellow background */
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-size: 14px;
            color: #555;
        }

        .disclaimer p {
            margin: 10px 0;
        }

        .disclaimer .link {
            color: #4CAF50;
            text-decoration: none;
        }


    </style>
</head>
<body>
    <jsp:include page="donarnav.jsp" />

    <div class="filter-container">
        <form method="get" action="${pageContext.request.contextPath}/donation/listDonations">
            <label for="type">Select Type:</label>
            <select name="type">
                <option value="" ${empty selectedType ? 'selected' : ''}>-- Select --</option>
                <option value="Food" ${selectedType == 'Food' ? 'selected' : ''}>Food</option>
                <option value="Educational" ${selectedType == 'Educational' ? 'selected' : ''}>Educational</option>
                <option value="Natural Disaster" ${selectedType == 'Natural Disaster' ? 'selected' : ''}>Natural Disaster</option>
                <option value="Cloths" ${selectedType == 'Cloths' ? 'selected' : ''}>Cloths</option>
            </select>
            <input type="submit" value="Filter">
        </form>
    </div>

    <div class="card-container">
        <c:forEach var="drive" items="${donationDrives}">
            <div class="card">
                <img src="${pageContext.request.contextPath}/uploads/${drive.imageFilePath}" alt="Donation Drive Image">
                <div class="content">
                    <h3>${drive.eventName}</h3>
                    <p><strong>Start Date:</strong> ${drive.startDate}</p>
                    <p><strong>End Date:</strong> ${drive.endDate}</p>
                    <p><strong>Venue:</strong> ${drive.street}, ${drive.city}, ${drive.state}, ${drive.pin}</p>
                    <p><strong>Description:</strong> ${drive.description}</p>

                    <div class="buttons">
                     
                      
                       <form action="${pageContext.request.contextPath}/items/donateItems/${drive.id}" method="get">
    <button class="button"  onclick="alert('Donate Items Clicked')" type="submit">Donate Items</button>
</form>
<form action="/donate" method="get">
                                <button class="button" onclick="alert('Donate Money Clicked')">Donate Money</button>
                                </form>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty donationDrives}">
            <div class="card">
                <p>No donation drives found.</p>
            </div>
        </c:if>
    </div>

    <div class="disclaimer">
        <p>If the venue is near to you, you are welcome to donate the items directly at the event location. If not, you can apply for the pickup option when you click on the donate items button to have your items collected from your location.</p>
        <p>We appreciate your generous contributions to help those in need!</p>
    </div>
</body>
</html>
