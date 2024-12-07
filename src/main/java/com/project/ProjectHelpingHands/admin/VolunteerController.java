package com.project.ProjectHelpingHands.admin;

import com.project.ProjectHelpingHands.Donar;

import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class VolunteerController {

    @Autowired
    private VolunteerService volunteerService;

    // Show list of drives
    @GetMapping("/volunteer/drives")
    public String showVolunteerDrives(Model model) {
        model.addAttribute("volunteerDrives", volunteerService.getAllDrives());
        return "volunteer-drives";  // This is the JSP page showing the list of drives
    }

    // Register for a drive
    @PostMapping("/volunteer/register/{driveId}")
    public String registerForDrive(@PathVariable("driveId") Long driveId, HttpSession session, Model model) {
        Donar currentUser = (Donar) session.getAttribute("user");

        if (currentUser != null) {
            DonationDrive drive = volunteerService.getDriveById(driveId);

            // Register the user for the drive
            volunteerService.registerVolunteerForDrive(currentUser, drive);

            // Success message
            model.addAttribute("text",drive.getEventName());
            model.addAttribute("message", "Thank you for registering! Your participation will make a big difference.");
            return "registrationsuccess";  // Success page
        } else {
            model.addAttribute("message", "Please log in to register for a drive.");
            return "login";  // Redirect to login page if the user is not logged in
        }
    }

//    // Show registered drives for the user
//    @GetMapping("/volunteer/registered")
//    public String showRegisteredDrives(HttpSession session, Model model) {
//        Donar currentUser = (Donar) session.getAttribute("currentUser");
//
//        if (currentUser != null) {
//            model.addAttribute("registeredDrives", volunteerService.getDrivesByUser(currentUser));
//            return "registered-drives";  // This is the JSP page showing the user's registered drives
//        } else {
//            model.addAttribute("message", "Please log in to view your registered drives.");
//            return "login";
//        }
//    }
    // Show registered drives for the user
    @GetMapping("/volunteer/registered")
    public String showRegisteredDrives(HttpSession session, Model model) {
        Donar currentUser = (Donar) session.getAttribute("user");

        if (currentUser != null) {
            List<Volunteer> registeredDrives = volunteerService.getRegisteredDrivesByUser(currentUser);
            model.addAttribute("donationDrives", registeredDrives);
            return "registeredDrives";  // This is the JSP page showing the user's registered drives
        } else {
            model.addAttribute("message", "Please log in to view your registered drives.");
            return "login";  // Redirect to login page if the user is not logged in
        }
    }
    


}
