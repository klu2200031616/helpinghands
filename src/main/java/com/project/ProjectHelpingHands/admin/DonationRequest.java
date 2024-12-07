package com.project.ProjectHelpingHands.admin;

public class DonationRequest {
	 private Long amount;
	    private String name;
	    private String currency;

	    public Long getAmount() {
	        return amount;
	    }

	    public void setAmount(Long amount) {
	        this.amount = amount;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getCurrency() {
	        return currency;
	    }

	    public void setCurrency(String currency) {
	        this.currency = currency;
	    }
}
