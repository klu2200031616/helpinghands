package com.project.ProjectHelpingHands;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FeedbackController {
    
    @Autowired
    private Feedbackrepository feedbackRepository;
    
    @RequestMapping("/feedback")
    public String showFeedbackForm() {
        return "feedback"; // name of the HTML template (feedback.html)
    }

    @PostMapping("/submit-feedback")
    public String submitFeedback(@RequestParam("name") String name, 
                                 @RequestParam("email") String email,
                                 @RequestParam("feedback") String feedback) {
        
        Feedback newFeedback = new Feedback();
        newFeedback.setName(name);
        newFeedback.setEmail(email);
        newFeedback.setFeedback(feedback);
        
        feedbackRepository.save(newFeedback);
        
        return "redirect:/feedback"; // or redirect to a success page
    }
}