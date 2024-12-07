<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Form</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .feedback-container {
            background-color: #ffffff;
            padding: 40px;
            width: 500px;
            max-width: 90%;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            transform: translateY(-30px);
        }
        h1 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #333;
            font-weight: bold;
            text-align: center;
        }
        p {
            font-size: 18px;
            margin-bottom: 25px;
            color: #555;
            text-align: center;
        }
        input, textarea, button {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        input:focus, textarea:focus {
            border-color: #4CAF50;
            outline: none;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            padding: 15px;
            border-radius: 6px;
        }
        button:hover {
            background-color: #45a049;
        }
        textarea {
            resize: vertical;
            min-height: 150px;
        }
        .quote {
            font-size: 24px;
            font-weight: italic;
            text-align: center;
            color: #777;
            margin-bottom: 30px;
            font-style: oblique;
        }
        .success-message {
            color: #4CAF50;
            font-size: 18px;
            text-align: center;
            display: none;
        }
    </style>
</head>
<body>
    <div class="feedback-container">
        <h1>Your Feedback Matters</h1>
        <p class="quote">"Your thoughts and opinions help us improve!"</p>
        <form id="feedbackForm" action="/submit-feedback" method="post" onsubmit="handleSubmit(event)">
            <input type="text" name="name" placeholder="Your Name" required />
            <input type="email" name="email" placeholder="Your Email" required />
            <textarea name="feedback" rows="5" placeholder="Write your feedback here..." required></textarea>
            <button type="submit">Submit Feedback</button>
        </form>
        <p class="success-message" id="successMessage">Thank you for your feedback! You will be redirected shortly...</p>
    </div>

    <script>
        // JavaScript function to handle form submission and display success message
        function handleSubmit(event) {
            event.preventDefault();  // Prevent form submission

            // Show success message
            document.getElementById('successMessage').style.display = 'block';

            // Redirect after 3 seconds
            setTimeout(function() {
                window.location.href = '/donarhome';  // Redirect to donarhome
            }, 3000);  // 3 seconds delay before redirect
        }
    </script>
</body>
</html>