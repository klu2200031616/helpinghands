package com.project.ProjectHelpingHands.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.ProjectHelpingHands.Donar;

import jakarta.servlet.http.HttpSession;



@Controller
@RequestMapping("/items")
public class ItemsController {

    @Autowired
    private DonationService donationService;

    @Autowired
    private DonationDriveRepository donationDriveRepository;
    
    
    @GetMapping("/donateItems/{driveId}")
    public String showDonateItems(@PathVariable
    		("driveId") Long driveId, Model model) {
        DonationDrive drive = donationDriveRepository.findById(driveId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Drive ID"));
        model.addAttribute("drive", drive);
        return "donateitems"; // The JSP page to display donation details
    }

//
//    @GetMapping("/donateItems")
//    public String showDonateItemsPage(@RequestParam("driveId") Long driveId, Model model) {
//        DonationDrive drive = donationDriveRepository.findById(driveId)
//                .orElseThrow(() -> new IllegalArgumentException("Invalid Drive ID"));
//        model.addAttribute("drive", drive);
//        return "itemsDonate";
//    }
//
    @GetMapping("/placePickup/{driveId}")
    public String placePickup(
            @ModelAttribute ItemsDonated item,@PathVariable
            ("driveId") Long driveId, Model model,
            HttpSession session) {
        
        Donar donar = (Donar) session.getAttribute("user");
        System.out.println(donar.getName());
        donationService.saveDonation(item, driveId, donar);
        // Add the donor's ID to the model
        model.addAttribute("donorId", donar.getId());
        
        // Redirect to the success page
        return "redirect:/success";
    }
    
    
    @GetMapping("/pickups")
    public String showPickupDetails(Model model) {
        List<ItemsDonated> pickups = donationService.getAllPickups();
        model.addAttribute("pickups", pickups);
        return "pickupDetails";  // Return the view name which corresponds to the JSP
    }
    
    @GetMapping("/pickuptracker")
    public String pickupTracker(HttpSession session, Model model) {
        // Retrieve the logged-in user's ID from the session
        Donar loggedInDonar = (Donar) session.getAttribute("user");

        if (loggedInDonar == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        Long donorId = loggedInDonar.getId();

        // Use the service method to get donations for the logged-in donor
        List<ItemsDonated> filteredPickups = donationService.getPickupDetailsByDonor(donorId);

        model.addAttribute("pickups", filteredPickups);
        
      

        System.out.println(loggedInDonar.getName());

        return "PickupsTracker"; // JSP file name
    }

    @GetMapping("/error")
    public String showErrorPage() {
        return "error"; // Error JSP page
    }
    
    
    @PostMapping("/updateStatus")
    public String updateStatus(@RequestParam("pickupId") Long pickupId, @RequestParam("status") String status) {
    	ItemsDonated pickup = donationService.findPickupById(pickupId);
        if (pickup != null) {
            pickup.setStatus(status);
            donationService.save(pickup); // Save the updated status to the database
        }
        return "redirect:/items/pickups"; // Redirect to the page with the updated table
    }


    @PostMapping("/cancelPickup")
    @ResponseBody
    public String cancelPickup(@RequestBody PickupCancelRequest request) {
        boolean success = donationService.cancelPickup(request.getPickupId());
        return success ? "Pickup status updated to 'Cancelled'" : "Failed to update pickup status";
    }
    
}
