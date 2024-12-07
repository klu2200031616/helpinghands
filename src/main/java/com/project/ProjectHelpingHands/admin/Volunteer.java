package com.project.ProjectHelpingHands.admin;



import com.project.ProjectHelpingHands.Donar;

import jakarta.persistence.*;

@Entity
public class Volunteer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Donar user;

    @ManyToOne
    @JoinColumn(name = "drive_id", nullable = false)
    private DonationDrive donationDrive;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Donar getUser() {
        return user;
    }

    public void setUser(Donar user) {
        this.user = user;
    }

    public DonationDrive getDonationDrive() {
        return donationDrive;
    }

    public void setDonationDrive(DonationDrive donationDrive) {
        this.donationDrive = donationDrive;
    }
}
