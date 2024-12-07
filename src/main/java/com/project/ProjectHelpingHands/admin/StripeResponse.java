package com.project.ProjectHelpingHands.admin;


public class StripeResponse {
	 private String status;
	    private String message;
	    private String sessionId;
	    private String sessionUrl;

	    // Constructor
	    public StripeResponse(String status, String message, String sessionId, String sessionUrl) {
	        this.status = status;
	        this.message = message;
	        this.sessionId = sessionId;
	        this.sessionUrl = sessionUrl;
	    }

	    // Getters and Setters
	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }

	    public String getMessage() {
	        return message;
	    }

	    public void setMessage(String message) {
	        this.message = message;
	    }

	    public String getSessionId() {
	        return sessionId;
	    }

	    public void setSessionId(String sessionId) {
	        this.sessionId = sessionId;
	    }

	    public String getSessionUrl() {
	        return sessionUrl;
	    }

	    public void setSessionUrl(String sessionUrl) {
	        this.sessionUrl = sessionUrl;
	    }

	    // Static Builder class to manually create StripeResponse
	    public static class Builder {
	        private String status;
	        private String message;
	        private String sessionId;
	        private String sessionUrl;

	        // Builder methods for each field
	        public Builder status(String status) {
	            this.status = status;
	            return this;
	        }

	        public Builder message(String message) {
	            this.message = message;
	            return this;
	        }

	        public Builder sessionId(String sessionId) {
	            this.sessionId = sessionId;
	            return this;
	        }

	        public Builder sessionUrl(String sessionUrl) {
	            this.sessionUrl = sessionUrl;
	            return this;
	        }

	        // Build method to return the constructed object
	        public StripeResponse build() {
	            return new StripeResponse(status, message, sessionId, sessionUrl);
	        }
	    }

	    // You can now use the builder like this:
	    // StripeResponse response = new StripeResponse.Builder()
	    //     .status("Success")
	    //     .message("Payment session created")
	    //     .sessionId("session123")
	    //     .sessionUrl("http://localhost:9999")
	    //     .build();

}
