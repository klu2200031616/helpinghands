<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donate</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('https://your-image-url.com/background.jpg'); /* Replace with your background image URL */
            background-size: cover;
            background-position: center;
            font-family: 'Arial', sans-serif;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: 18px;
            color: #555;
        }

        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        button:active {
            background-color: #004085;
        }

        /* Responsive design */
        @media (max-width: 600px) {
            .form-container {
                width: 90%;
                padding: 30px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="form-container">
            <h2>Donation Form</h2>
            <form action="/donate/pay" method="post">
                <label for="amount">Enter Donation Amount:</label>
                <input type="number" id="amount" name="amount" required>
                <button type="submit">Pay with PayPal</button>
            </form>
        </div>
    </div>

</body>

</html>
