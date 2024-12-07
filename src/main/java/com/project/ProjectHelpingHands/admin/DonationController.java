package com.project.ProjectHelpingHands.admin;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DonationController {

    @Autowired
    private StripeService stripeService;

    @GetMapping("/donate")
    public String showDonationForm(Model model) {
        model.addAttribute("donationRequest", new DonationRequest());
        return "donate";
    }

    @PostMapping("/processDonation")
    public String processDonation(@ModelAttribute DonationRequest donationRequest, Model model) {
        StripeResponse response = stripeService.checkoutDonation(donationRequest);

        if ("Success".equals(response.getStatus())) {
            return "redirect:" + response.getSessionUrl(); // Redirect to Stripe's checkout session
        } else {
            model.addAttribute("error", response.getMessage());
            return "error";
        }
    }

    @GetMapping("/paymentSuccess")
    public String paymentSuccess() {
        return "paymentSuccess";
    }

    @GetMapping("/cancel")
    public String cancelPage() {
        return "cancel";
    }
}
