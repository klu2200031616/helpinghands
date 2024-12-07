<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Donation Drive</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f9f9f9, #f0f4f8);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-top: 50px;
            font-size: 30px;
        }

        form {
            width: 60%;
            margin: 40px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 12px 0 6px;
            color: #2c3e50;
            font-size: 16px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="date"],
        input[type="file"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #b2bec3;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
            color: #2c3e50;
            background-color: #f8f9fa;
            transition: border-color 0.3s ease;
        }

        input[type="file"] {
            padding: 8px;
        }

        textarea {
            height: 120px;
            resize: vertical;
        }

        button {
            display: block;
            width: 100%;
            padding: 14px;
            margin-top: 20px;
            background-color: #27ae60;
            color: white;
            font-size: 18px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #1e8449;
        }

        form select {
            background-color: #f8f9fa;
            color: #2c3e50;
        }

        form select:focus,
        input:focus,
        textarea:focus {
            outline: none;
            border-color: #27ae60;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .form-group label {
            width: 100%;
            font-size: 14px;
            color: #34495e;
        }

        .form-group input,
        .form-group select {
            width: 48%;
        }

        .form-group input[type="file"] {
            width: 100%;
        }

        .form-group .half-width {
            width: 48%;
        }

        @media (max-width: 768px) {
            form {
                width: 90%;
            }
        }

        .button {
            display: inline-block;
            padding: 8px 20px;
            background-color: #007BFF;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
        }

        .button:hover {
            background-color: #0056b3;
        }

       

    </style>
</head>
<body>
    <h2>Add Donation Drive</h2>
    <form:form action="/donation/add" modelAttribute="donationDrive" method="post" enctype="multipart/form-data">
        <div class="form-container">
            <div class="form-group">
                <div class="half-width">
                    <label>Event Name:</label>
                    <form:input path="eventName" />
                </div>
                <div class="half-width">
                    <label>Image:</label>
                    <input type="file" name="imageFile" />
                </div>
            </div>

            <div class="form-group">
                <div class="half-width">
                    <label>Preferred Donation:</label>
                    <form:select path="donationPreferred">
                        <form:option value="" label="-- Select --" />
                        <form:option value="Money" label="Money" />
                        <form:option value="Items" label="Items" />
                    </form:select>
                </div>
                <div class="half-width">
                    <label>Donation Drive Type:</label>
                    <form:select path="type">
                        <form:option value="" label="-- Select --" />
                        <form:option value="Food" label="Food" />
                        <form:option value="Educational" label="Educational" />
                        <form:option value="Natural Disaster" label="Natural Disaster" />
                        <form:option value="Cloths" label="Cloths" />
                        <form:option value="Volunteer" label="Volunteer" />
                    </form:select>
                </div>
            </div>

            <div class="form-group">
                <div class="half-width">
                    <label>Start Date:</label>
                    <form:input path="startDate" type="date" />
                </div>
                <div class="half-width">
                    <label>End Date:</label>
                    <form:input path="endDate" type="date" />
                </div>
            </div>

            <div class="form-group">
                <div class="half-width">
                    <label>Street:</label>
                    <form:input path="street" />
                </div>
                <div class="half-width">
                    <label>City:</label>
                    <form:input path="city" />
                </div>
            </div>

            <div class="form-group">
                <div class="half-width">
                    <label>State:</label>
                    <form:input path="state" />
                </div>
                <div class="half-width">
                    <label>Pin Code:</label>
                    <form:input path="pin" />
                </div>
            </div>

            <label>Description:</label>
            <form:textarea path="description" />

            <button type="submit">Add Donation Drive</button>
             </div>
    <a href="/adminhome" class="button">Back to Dashboard</a>
</div>

        </div>
    </form:form>
</body>
</html>
