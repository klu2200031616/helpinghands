<%@ page import="com.project.ProjectHelpingHands.admin.DonationDrive" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Donation Drive</title>
</head>
<body>
    <h1>Edit Donation Drive</h1>
    <form action="/donation/edit/${donationDrive.id}" method="POST" enctype="multipart/form-data">
        <label for="eventName">Event Name:</label>
        <input type="text" name="eventName" value="${donationDrive.eventName}" required /><br><br>

        <label for="donationPreferred">Donation Preferred:</label>
        <input type="text" name="donationPreferred" value="${donationDrive.donationPreferred}" required /><br><br>

        <label for="startDate">Start Date:</label>
        <input type="date" name="startDate" value="${donationDrive.startDate}" required /><br><br>

        <label for="endDate">End Date:</label>
        <input type="date" name="endDate" value="${donationDrive.endDate}" required /><br><br>

        <!-- Modify venue to street, city, and state -->
        <label for="street">Street:</label>
        <input type="text" name="street" value="${donationDrive.street}" required /><br><br>

        <label for="city">City:</label>
        <input type="text" name="city" value="${donationDrive.city}" required /><br><br>

        <label for="state">State:</label>
        <input type="text" name="state" value="${donationDrive.state}" required /><br><br>
        
          <label for="pin">Pin:</label>
        <input type="text" name="pin" value="${donationDrive.pin}" required /><br><br>

        <label for="description">Description:</label>
        <textarea name="description" required>${donationDrive.description}</textarea><br><br>

        <label for="imageFile">Image:</label>
        <input type="file" name="imageFile" /><br><br>

        <button type="submit">Save Changes</button>
    </form>
</body>
</html>
