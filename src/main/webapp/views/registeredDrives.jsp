<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="com.project.ProjectHelpingHands.Donar"%>
<%@page import="com.project.ProjectHelpingHands.admin.Volunteer"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Drives</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fa;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            color: #2c3e50;
        }

        .drives-container {
            margin: 30px auto;
            padding: 20px;
            max-width: 900px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .drive-item {
            padding: 20px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f7f7f7;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
        }

        .drive-info {
            flex: 1;
        }

        .drive-actions button {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .drive-actions button:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>

<h1>Registered Donation Drives</h1>
 <jsp:include page="donarnav.jsp" />

<% 
    Donar donar = (Donar) session.getAttribute("user");
    if (donar == null) { 
        out.println("<p>No donor information available.</p>");
    } else {
        List<Volunteer> drives = (List<Volunteer>) request.getAttribute("donationDrives");
        if (drives == null || drives.isEmpty()) {
%>
            <p>No drive available.</p>
<% 
        } else {
            // Create a Set to track unique drive IDs
            Set<Long> uniqueDriveIds = new HashSet<>();
            
            // Iterate through the drives and filter by unique drive ID
            for (Volunteer drive : drives) {
                Long driveId = drive.getDonationDrive().getId(); // Assuming getDriveId() returns a unique ID
                if (!uniqueDriveIds.contains(driveId)) {
                    uniqueDriveIds.add(driveId); // Add drive ID to Set if it's not already added
%>
                    <div class="drives-container">
                        <div class="drive-item">
                            <div class="drive-info">
                                <img src="<%= request.getContextPath() + "/uploads/" + drive.getDonationDrive().getImageFilePath() %>" alt="Donation Drive Image" style="width: 100px; height: 100px;">
                                <h3><%= drive.getDonationDrive().getEventName() %></h3>
                                <p><strong>Start Date:</strong> <%= drive.getDonationDrive().getStartDate() %></p>
                                <p><strong>End Date:</strong> <%= drive.getDonationDrive().getEndDate() %></p>
                                <p><strong>Venue:</strong> <%= drive.getDonationDrive().getStreet() %>, <%= drive.getDonationDrive().getCity() %>, <%= drive.getDonationDrive().getState() %>, <%= drive.getDonationDrive().getPin() %></p>
                                <p><strong>Description:</strong> <%= drive.getDonationDrive().getDescription() %></p>
                            </div>
                        </div>
                    </div>
<% 
                }
            }
        }
    }
%>

</body>
</html>
