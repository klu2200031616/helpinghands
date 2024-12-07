package com.project.ProjectHelpingHands.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ProjectHelpingHands.Donar;
import com.project.ProjectHelpingHands.DonarRepository;

import jakarta.persistence.Tuple;

@Service
public class VolunteerService {

    @Autowired
    private VolunteerRepository volunteerRepository;

    @Autowired
    private DonationDriveRepository donationDriveRepository;

    @Autowired
    
    private DonarRepository donarRepository;

    // Get all donation drives
    public List<DonationDrive> getAllDrives() {
        return donationDriveRepository.findAll();
    }

    // Get a specific drive by ID
    public DonationDrive getDriveById(Long driveId) {
        return donationDriveRepository.findById(driveId).orElse(null);
    }

    // Register the user for a donation drive
    public void registerVolunteerForDrive(Donar user, DonationDrive drive) {
        Volunteer volunteer = new Volunteer();
        volunteer.setUser(user);
        volunteer.setDonationDrive(drive);
        volunteerRepository.save(volunteer);
    }

    public List<Volunteer> getRegisteredDrivesByUser(Donar currentUser) {
        return volunteerRepository.findByUser(currentUser);
    }
}