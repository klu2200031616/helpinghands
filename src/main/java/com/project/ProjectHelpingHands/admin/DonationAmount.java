package com.project.ProjectHelpingHands.admin;



import java.math.BigDecimal;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

@Entity
public class DonationAmount {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "donation_drive_id", nullable = false)
    private DonationDrive donationDrive;

    private BigDecimal amountRaised = BigDecimal.ZERO;

    private LocalDateTime lastUpdated;

    @PrePersist
    @PreUpdate
    
    public void setTimestamp() {
        this.lastUpdated = LocalDateTime.now();
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public DonationDrive getDonationDrive() {
        return donationDrive;
    }

    public void setDonationDrive(DonationDrive donationDrive) {
        this.donationDrive = donationDrive;
    }

    public BigDecimal getAmountRaised() {
        return amountRaised;
    }

    public void setAmountRaised(BigDecimal amountRaised) {
        this.amountRaised = amountRaised;
    }

    public LocalDateTime getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(LocalDateTime lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    @Override
    public String toString() {
        return "DonationAmount [id=" + id + ", donationDrive=" + donationDrive.getEventName() + ", amountRaised="
                + amountRaised + ", lastUpdated=" + lastUpdated + "]";
    }
}
