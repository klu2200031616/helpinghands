<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.project.ProjectHelpingHands.Donar" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Volunteer Drives</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* Container for the drives */
        .drives-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin: 20px;
            font-family: Arial, sans-serif;
        }

        /* Individual card container */
        .card-container {
            display: flex;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card-container:hover {
            transform: scale(1.02);
        }

        /* Image section */
        .card-image {
            flex: 1;
        }

        .card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Content section */
        .card-content {
            flex: 2;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-content h2 {
            font-size: 1.8em;
            margin-bottom: 10px;
            color: #333;
        }

        .card-content p {
            font-size: 1em;
            margin-bottom: 10px;
            color: #555;
        }

        /* Register button */
        .register-button {
            align-self: flex-start;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        .register-button:hover {
            background-color: #218838;
        }

        /* Disabled button style */
        .register-button[disabled] {
            background-color: #ddd;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <jsp:include page="donarnav.jsp" />
    <div class="drives-container">
        <h1>Volunteer Drives</h1>
        <c:forEach var="drive" items="${volunteerDrives}">
            <div class="card-container">
                <!-- Image Section -->
                <div class="card-image">
                    <img src="${pageContext.request.contextPath}/uploads/${drive.imageFilePath}" alt="Donation Drive Image">
                </div>
                <!-- Content Section -->
                <div class="card-content">
                    <h2>${drive.eventName}</h2>
                    <p><strong>Venue:</strong> ${drive.street}, ${drive.city}, ${drive.state}, ${drive.pin}</p>
                    <p><strong>Start Date:</strong> ${drive.startDate}</p>
                    <p><strong>End Date:</strong> ${drive.endDate}</p>
                    <p>${drive.description}</p>
                    
                
                            <form action="${pageContext.request.contextPath}/volunteer/register/${drive.id}" method="POST">
                                <button class="register-button" type="submit">Register</button>
                            </form>
                  
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
