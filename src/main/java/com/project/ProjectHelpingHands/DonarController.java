package com.project.ProjectHelpingHands;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class DonarController {
	
	 @Autowired
	private DonarDAOImpl dd;
	
//	@GetMapping("/")
//	public String home() {
//		return "home";
//	}
	
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	
	@GetMapping("/tips")
	public String tipstips() {
		return "tips";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/profile")
	public String profile() {
		return "profile";
	}
	
	 @PostMapping("/loginPage")
	    public String login(@RequestParam("email") String email, 
	                        @RequestParam("password") String password, 
	                        Model model, HttpSession session) {

	        Donar donar = dd.authenticateUser(email, password);

	        if (donar != null) {
	        	 session.setAttribute("user", donar);
		            model.addAttribute("message", "Login successful!");
		            System.out.println(donar.isAdmin());
	        	  if (donar.isAdmin().equalsIgnoreCase("true")) {
	                  return "adminhome"; // Redirect to admin home page if the user is an admin
	              } else {
	                  return "donarhome"; // Redirect to donor home page if the user is not an admin
	              }
	           
	           
	        } else {
	            model.addAttribute("error", "Invalid email or password");
	            return "login"; // Redirect back to login page with error message
	        }
	    }
		@GetMapping("/donarhome")
		public String donarhome() {
			return "donarhome";
		}
	 @GetMapping("/donarnav")
		public String sample() {
			return "donarnav";
		}
	 @GetMapping("/adminhome")
		public String adminhome() {
			return "adminhome";
		}
	 
	 
	 @GetMapping("/angelpoints")
		public String angelpoints() {
			return "angelpoints";
		}
	 
	 
	 @GetMapping("/logout")
	    public String logout(HttpSession session) {
	        // Invalidate the session
	        session.invalidate();
	        
	        // Redirect to the home page (adjust path as necessary)
	        return "redirect:/"; // Redirect to the home page after logout
	    }
	 
	 
	@GetMapping("/aboutus")
	public String aboutus() {
		return "aboutus";
	}
	@GetMapping("/registration")
	public String registration() {
		return "registration";
	}
	
	
	 private static final String UPLOAD_DIR = "src/main/webapp/uploads/";
	
	 @PostMapping("/addDonar")
	    public String addDonar(
	            @ModelAttribute Donar d, 
	            @RequestParam("profileImage") MultipartFile imageFile, 
	            Model model, 
	            RedirectAttributes redirectAttributes) {

	        try {
	            // Save the image if uploaded
	            if (!imageFile.isEmpty()) {
	                String imageFilename = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
	                Path path = Paths.get(UPLOAD_DIR + imageFilename);
	                Files.copy(imageFile.getInputStream(), path);
	                d.setProfileImagePath(imageFilename);
	            }

	            // Save donor to the database
	            model.addAttribute("Donar", d);
	            System.out.println(dd.insertDonar(d)); // Ensure `dd` is correctly injected
	            return "login";
	        } catch (IOException e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("errorMessage", "Error uploading profile image. Please try again.");
	            return "redirect:/registration";
	        } catch (DataIntegrityViolationException e) {
	            if (e.getMessage().contains("Duplicate entry")) {
	                redirectAttributes.addFlashAttribute("errorMessage", "Email is already registered. Please use a different email.");
	            } else {
	                redirectAttributes.addFlashAttribute("errorMessage", "An unexpected error occurred. Please try again.");
	            }
	            return "redirect:/registration";
	        }
	    }
	 
	  @GetMapping("/viewUsers")
	    public String viewUsers(Model model) {
		  List<Donar> users = dd.getAllNonAdminUsers();
		 
		    model.addAttribute("users", users);
	        return "viewUsers";
	    }
//	  
	  @GetMapping("/success")
	    public String showSuccessPage(HttpSession session) {
	        Donar donar = (Donar) session.getAttribute("user");
	        if (donar != null) {
	            // Update the donor's streak and save to the database
	            dd.updateDonorStreak(donar);
	            session.setAttribute("user", donar); // Update session with new streak value
	        }
	        return "success"; // Redirect to success page
	    }
	  
	  @GetMapping("/editUserProfile")
	    public String editUserProfile(HttpSession session, Model model) {
	        Donar donar = (Donar) session.getAttribute("user");
	        if (donar != null) {
	            model.addAttribute("donar", donar); // Pre-fill data
	            return "editUserProfile"; // Display the edit form
	        }
	        return "redirect:/login"; // Redirect to login if no user in session
	    }
	  
	
}
