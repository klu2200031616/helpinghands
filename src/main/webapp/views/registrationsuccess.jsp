<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.project.ProjectHelpingHands.Donar" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* Success container */
        .success-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-top: 50px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .success-container h1 {
            font-size: 2em;
            color: #28a745;
        }

        .success-container p {
            font-size: 1.2em;
            margin-bottom: 20px;
            color: #333;
        }

        .thank-you-image {
            animation: scale-up 1s ease-in-out;
            margin-bottom: 20px;
        }

        @keyframes scale-up {
            0% {
                transform: scale(0);
            }
            100% {
                transform: scale(1);
            }
        }

        .view-drive-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        .view-drive-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
 <jsp:include page="donarnav.jsp" />
 <% 
    Donar donar = (Donar) session.getAttribute("user"); // Retrieve donor from session
    if (donar != null) {

    donar.addDonationStreak();  // Increment streak by 100
    session.setAttribute("user", donar);  // Update the session with the new streak value

%>
    <div class="success-container">
        <h1>Thank you for registering!</h1>
        <p> <%= donar.getName() %>, your registration for the event <strong>${text}</strong> has been successfully completed.</p>
        <img src="/images/regthank.png" alt="Thank You" class="thank-you-image">
        <p>Your participation is highly appreciated, and it will make a significant difference!</p>
        <a href="/volunteer/registered" class="view-drive-button">View Registered Drive</a>
    </div>
    <%} %>
</body>
</html>
