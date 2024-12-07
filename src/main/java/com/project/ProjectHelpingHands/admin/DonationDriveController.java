package com.project.ProjectHelpingHands.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.ProjectHelpingHands.Donar;

import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/donation")
public class DonationDriveController {

    @Autowired
    private DonationDriveDAOImpl service;

    

    @GetMapping("/add")
    public String showAddDonationForm(Model model) {
        model.addAttribute("donationDrive", new DonationDrive());
        return "addDonation";
    }

    @PostMapping("/add")
    public String addDonationDrive(@ModelAttribute DonationDrive donationDrive, 
                                   @RequestParam("imageFile") MultipartFile imageFile)  {
        service.saveDonationDrive(donationDrive, imageFile);
        return "redirect:/donation/viewDrives";
    }

//    @GetMapping("/list")
//    public String listDonationDrives(Model model) {
//        List<DonationDrive> donationDrives = service.getAllDrives();
//        
//        // Debug: Print out the list of drives to ensure data is fetched
//        for (DonationDrive drive : donationDrives) {
//            System.out.println(drive.getEventName());  // Debugging output
//        }
//
//        model.addAttribute("donationDrives", donationDrives);
//        return "listDonations";
//    }
    
    @GetMapping("/viewDrives")
    public String viewdrives(Model model) {
List<DonationDrive> donationDrives = service.getAllDrives();
        
       
        model.addAttribute("donationDrives", donationDrives);
        return "viewDonationDrive";
    }
  
    
    
    @GetMapping("/listDonations")
    public String listDonations(
            @RequestParam(value = "type", required = false) String type, 
            Model model) {
        List<DonationDrive> donationDrives;
        if (type != null && !type.isEmpty()) {
            donationDrives = service.getDrivesByType(type); // Fetch filtered drives
        } else {
            donationDrives = service.getAllDrives(); // Fetch all drives
        }
        model.addAttribute("donationDrives", donationDrives);
        return "listDonations"; // View name
    }

    

   

    @GetMapping("/volunteer")
    public String showVolunteerDrives(Model model,HttpSession session) {
        List<DonationDrive> volunteerDrives = service.getDrivesByType("volunteer");
        model.addAttribute("volunteerDrives", volunteerDrives);
        return "volunteer"; // Refers to the volunteer.jsp page
    }
    
    
//    
//    @PostMapping("/register")
//    public ResponseEntity<String> registerForDrive(
//            @RequestParam("driveId") Long driveId,
//            HttpSession session) {
//        // Retrieve the logged-in Donar from session
//        Donar user = (Donar) session.getAttribute("user");
//
//        // If user is not logged in
//        if (user == null) {
//            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("User is not authenticated");
//        }
//
//        // Fetch the donation drive by ID
//        DonationDrive drive = service.getDriveById(driveId);
//
//        // Create a new volunteer object and associate it with the drive and the user
//        Volunteer volunteer = new Volunteer();
//        volunteer.setUser(user);  // Set the logged-in user as the volunteer
//        volunteer.setDonationDrive(drive);
//
//        // Save the volunteer registration
//        volunteerRepository.save(volunteer);
//
//        // Respond with success message
//        return ResponseEntity.ok("Registered successfully!");
//    }
//
//    
//    
//    
    
    
    
    
    
    
    
    // Edit Donation Drive
    @GetMapping("/edit/{id}")
    public String showEditDonationForm(@PathVariable("id") Long id, Model model) {
        DonationDrive donationDrive = service.getDriveById(id);
        model.addAttribute("donationDrive", donationDrive);
        return "editDonation";  // This is the page where you will edit the donation drive
    }

    @PostMapping("/edit/{id}")
    public String editDonationDrive(@PathVariable("id") Long id, 
                                    @ModelAttribute DonationDrive donationDrive,
                                    @RequestParam("imageFile") MultipartFile imageFile) {
        service.updateDonationDrive(id, donationDrive, imageFile);
        return "redirect:/donation/viewDrives";
    }

    // Delete Donation Drive
    @GetMapping("/delete/{id}")
    public String deleteDonationDrive(@PathVariable("id") Long id) {
        service.deleteDonationDrive(id);
        return "redirect:/donation/viewDrives";
    }
    

 // Redirect to donation payment page
    @GetMapping("/donateMoney/{driveId}")
    public String showDonationPage(@PathVariable Long driveId, Model model) {
        // Add drive details to the model
        DonationDrive drive = service.getDriveById(driveId); // Fetch the drive
        model.addAttribute("drive", drive);
        return "donateMoneyForm"; // Return the form to input donation amount
    }

  
}
