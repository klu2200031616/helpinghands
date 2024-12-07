<!DOCTYPE html>
<%@ page import="com.project.ProjectHelpingHands.Donar" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Angel Points</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJzX+J6X4qVwWvW0H76fTtWm9B2qYbG0G6B0Ijc5gZ8q8y8XTW0Xxk4Yjy" crossorigin="anonymous">
    <style>
        body {
            background-color: #f0f8ff;
            font-family: 'Arial', sans-serif;
            text-align: center;
        }
        .card-container {
            max-width: 600px;
            margin: 100px auto;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: #fff;
        }
        .angel-icon {
            font-size: 50px;
            color: #FFD700;
            animation: rotate 2s infinite linear;
            margin-bottom: 20px;
        }
        .donor-name {
            font-size: 24px;
            font-weight: bold;
            margin-top: 20px;
            color: #333;
        }
        .message {
            font-size: 18px;
            color: #555;
            margin-top: 20px;
            line-height: 1.6;
        }
        .cta {
            text-align: center;
            margin-top: 30px;
            font-size: 20px;
            font-weight: bold;
            color: #28a745;
        }
        .points {
            font-size: 36px;
            font-weight: bold;
            color: #4CAF50;
            margin-top: 20px;
            animation: bounce 1.5s ease-in-out infinite;
        }
        .star {
            font-size: 100px;
            color: #FFD700;
            animation: star-animation 2s infinite;
            margin-top: 50px;
        }
        
        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }

        @keyframes bounce {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-20px);
            }
            100% {
                transform: translateY(0);
            }
        }

        @keyframes star-animation {
            0% {
                transform: scale(1);
                opacity: 1;
            }
            50% {
                transform: scale(1.2);
                opacity: 0.7;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<jsp:include page="donarnav.jsp" />

<% 
    Donar donar = (Donar) session.getAttribute("user"); // Retrieve donor from session
    if (donar != null) {
%>

    <div class="card-container">
        <!-- Animated Angel Icon -->
        <div class="angel-icon">
            &#9733; <!-- Star Icon -->
        </div>

        <!-- Donor Name -->
        <div class="donor-name">
            <%= donar.getName() %>
        </div>

        <!-- Thank you message -->
        <div class="message">
            <p>Thank you for being such an amazing donor!</p>
            <p>Your contribution is truly making a difference, and we're so grateful for your kindness.</p>
            <p>You've earned <strong>${donar.getStreak()}</strong> Angel Points so far!</p>
        </div>

        <!-- Points display with animation -->
        <div class="points">
            <%= donar.getStreak() %> Angel Points
        </div>

        <!-- Motivational Call to Action -->
        <div class="cta">
            Keep spreading the love! Every donation counts toward making the world a better place.
        </div>

        <!-- Animated Star -->
        <div class="star">
            &#9733; <!-- Star Icon -->
        </div>
    </div>

<% System.out.println(donar.getStreak()) ;} else { %>
    <div class="card-container">
        <p>You are not logged in. Please log in to view your Angel Points.</p>
    </div>
<% } %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLH7lL0k4D6zYpXprkJdEp2dI4ExyyOme3+wAElThRjrAz6VauDb3BofN" crossorigin="anonymous"></script>

</body>
</html>
