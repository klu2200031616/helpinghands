<!DOCTYPE html>
<%@page import="com.project.ProjectHelpingHands.admin.ItemsDonated"%>
<%@page import="java.util.List"%>
<%@page import="com.project.ProjectHelpingHands.Donar"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pickup Tracker</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
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

        .tracker-container {
            margin: 30px auto;
            padding: 20px;
            max-width: 900px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .progress-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            margin: 30px 0;
        }

        .progress-step {
            text-align: center;
            width: 33.33%;
            position: relative;
        }

        .progress-step span {
            display: block;
            font-size: 16px;
            margin-top: 10px;
            color: #555;
        }

        .progress-line {
            position: absolute;
            top: 50%;
            left: 5%;
            right: 5%;
            height: 5px;
            background: #ddd;
            z-index: 1;
        }

        .progress-line-active {
            background: #4caf50;
            width: 66%; /* Adjust based on progress */
            height: 5px;
            position: absolute;
            top: 50%;
            left: 5%;
            z-index: 2;
        }

        .progress-circle {
            width: 60px;
            height: 60px;
            background-color: #ddd;
            border-radius: 50%;
            z-index: 3;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }
 

        .progress-circle.active {
            background-color: #4caf50;
        }

        .progress-circle img {
            width: 30px;
            height: 30px;
        }

        .pickup-details {
            margin: 20px 0;
        }

        .pickup-item {
            padding: 20px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f7f7f7;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .pickup-info {
            flex: 1;
            margin-right: 20px;
        }

        .pickup-actions button {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .pickup-actions button:hover {
            background-color: #45a049;
        }

        .pickup-info p {
            margin: 5px 0;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
        }

        .modal .close {
            float: right;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }

        .modal .close:hover {
            color: #f00;
        }
    </style>
</head>
<body>
<jsp:include page="donarnav.jsp" />
    <h1>Pickup Tracker</h1>
    <div class="tracker-container">
        

        <div class="pickup-details">
            <h2>Your Pickup Details</h2>
            <% 
                Donar donar = (Donar) session.getAttribute("user");
                if (donar == null) { 
                    out.println("<p>No donor information available.</p>");
                } else {
                    List<ItemsDonated> pickups = (List<ItemsDonated>) request.getAttribute("pickups");
                    if (pickups == null || pickups.isEmpty()) {
            %>
                        <p>No pickups available.</p>
            <% 
                    } else {
                        for (ItemsDonated pickup : pickups) { 
            %>
            <div class="pickup-item">
                <div class="pickup-info">
                    <h3>Pickup for Drive: <%= pickup.getDrive().getEventName() %></h3>
                    <p><strong>Location:</strong> <%= pickup.getStreet() %>, <%= pickup.getCity() %>, <%= pickup.getState() %> - <%= pickup.getPin() %></p>
                    <p><strong>Contact:</strong> <%= pickup.getPhoneNumber() %> | <%= pickup.getEmail() %></p>
                    <p><strong>Food Items:</strong> <%= pickup.getFoodItems() %></p>
                    <p><strong>Educational Supplies:</strong> <%= pickup.getEducationalSupplies() %></p>
                    <p><strong>Clothes:</strong> <%= pickup.getClothes() %></p>
                </div>
                <div class="pickup-actions">
                   <%--  <button onclick="openModal('<%= pickup.getId() %>')">Track Pickup</button> --%>
                   <div class="pickup-actions">
                    <%-- Disable the button if the status is 'Cancelled' --%>
                    <button <% if ("Cancelled".equals(pickup.getStatus())||"Completed".equals(pickup.getStatus())) { %> disabled <% } %> onclick="cancelPickup('<%= pickup.getId() %>')">
                        <% if ("Cancelled".equals(pickup.getStatus())) { %>Cancelled<% } else if ("Completed".equals(pickup.getStatus())) { %>PickUp Done<% }else { %>Cancel Pickup<% } %>
                    </button>
                </div>
                </div>
            </div>
            
            <div class="progress-bar">
    <div class="progress-line"></div>
    <div class="progress-line-active" style="width: <% 
        if ("Pending".equals(pickup.getStatus())) { %>0%;<% } 
        else if ("Scheduled".equals(pickup.getStatus())) { %>33%;<% } 
        else if ("In Progress".equals(pickup.getStatus())) { %>66%;<% } 
        else if ("Completed".equals(pickup.getStatus())) { %>100%;<% } %>">
    </div>

    <div class="progress-step">
        <div class="progress-circle <%= "Pending".equals(pickup.getStatus()) || 
                                       "Scheduled".equals(pickup.getStatus()) || 
                                       "In Progress".equals(pickup.getStatus()) || 
                                       "Completed".equals(pickup.getStatus()) ? "active" : "" %>">
            <img src="https://cdn-icons-png.flaticon.com/512/1462/1462468.png" alt="Scheduled">
        </div>
        <span>Scheduled</span>
    </div>

    <div class="progress-step">
        <div class="progress-circle <%= "In Progress".equals(pickup.getStatus()) || 
                                       "Completed".equals(pickup.getStatus()) ? "active" : "" %>">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-W8wFSQgyJBotvVwl61gHSZYwErYrRJbjOA&s" alt="In Progress">
        </div>
        <span>In Progress</span>
    </div>

    <div class="progress-step">
        <div class="progress-circle <%= "Completed".equals(pickup.getStatus()) ? "active" : "" %>">
            <img src="https://cdn-icons-png.freepik.com/256/16150/16150733.png?semt=ais_hybrid" alt="Completed"  height="100" width="150">
        </div>
        <span>Completed</span>
    </div>
</div>
            
            <% 
                        }
                    }
                }
            %>
        </div>
    </div>
   <div id="cancelModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeCancelModal()">&times;</span>
        <h2>Confirm Cancellation</h2>
        <p>Are you sure you want to cancel this order?</p>
        <div style="text-align: center;">
            <button id="confirmCancelBtn" style="background-color: red; color: white; padding: 10px 20px; margin-right: 10px;">Yes</button>
            <button onclick="closeCancelModal()" style="background-color: gray; color: white; padding: 10px 20px;">No</button>
        </div>
    </div>
</div>
   
   <script>
    function cancelPickup(pickupId) {
        fetch('/items/cancelPickup', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ pickupId: pickupId })
        })
        .then(response => {
            if (response.ok) {
                alert('Pickup status updated to "Cancelled".');
                window.location.reload();
            } else {
                alert('Failed to update pickup status.');
            }
        });
    }
</script>
</body>
</html>
