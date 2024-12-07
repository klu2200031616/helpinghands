<%@ page import="com.project.ProjectHelpingHands.Donar" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donation Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJzX+J6X4qVwWvW0H76fTtWm9B2qYbG0G6B0Ijc5gZ8q8y8XTW0Xxk4Yjy" crossorigin="anonymous">
    <style>
        body {
            background-color: #f0f8ff;
            font-family: 'Arial', sans-serif;
        }
        .card-container {
            max-width: 500px;
            margin: 100px auto;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: #fff;
        }
        .donor-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 10px;
        }
        .donor-name {
            font-size: 24px;
            font-weight: bold;
            margin-top: 20px;
            color: #333;
        }
        .message {
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
            color: #555;
            line-height: 1.6;
        }
        .cta {
            text-align: center;
            margin-top: 30px;
            font-size: 16px;
            font-weight: bold;
            color: #28a745;
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
    <div class="card-container">
        <!-- Image of the donor -->
        <img src="images/thankyou.png" alt="Donor Image" class="donor-image">

        <!-- Donor name -->
        <div class="donor-name">
            <%= donar.getName() %>
        </div>

        <!-- Thank you message -->
        <div class="message">
        
            <p>Thank you for your generous contribution, <%= donar.getName() %>!</p>
             <p>You're on a donation streak! Your current streak is: <%= donar.getStreak() %> points!</p>
            <p>Your donation will go a long way in helping those in need, and it makes a real difference in the lives of many people. Together, we can build a better future for our community and create a ripple effect of kindness that inspires others to give.</p>
            <p>Your selfless act of giving is an inspiration to us all, and it shows that a small effort can lead to monumental change in the world. You have helped create a more compassionate and caring society. We are deeply grateful for your support!</p>
        </div>

        <!-- Call to action -->
        <div class="cta">
            Together, we can make the world a better place. Keep spreading kindness!
        </div>
    </div>

<% 
    } else {
        // If no donor is found, you can show an error or redirect them elsewhere.
        out.println("No donor information available.");
    }
%>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLH7lL0k4D6zYpXprkJdEp2dI4ExyyOme3+wAElThRjrAz6VauDb3BofN" crossorigin="anonymous"></script>

</body>
</html>
