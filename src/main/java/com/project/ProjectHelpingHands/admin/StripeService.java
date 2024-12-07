package com.project.ProjectHelpingHands.admin;



import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

@Service
public class StripeService {

    @Value("${stripe.secretKey}")
    private String secretKey;

    public StripeResponse checkoutDonation(DonationRequest donationRequest) {
        Stripe.apiKey = secretKey;

        // Create product data
        SessionCreateParams.LineItem.PriceData.ProductData productData = 
            SessionCreateParams.LineItem.PriceData.ProductData.builder()
                .setName(donationRequest.getName())
                .build();

        // Create price data
        SessionCreateParams.LineItem.PriceData priceData = 
            SessionCreateParams.LineItem.PriceData.builder()
                .setCurrency(donationRequest.getCurrency() == null ? "USD" : donationRequest.getCurrency())
                .setUnitAmount(donationRequest.getAmount())
                .setProductData(productData)
                .build();

     // Create line item
        SessionCreateParams.LineItem lineItem = 
            SessionCreateParams.LineItem.builder()
                .setPriceData(priceData)
                .setQuantity(1L) // Set the required quantity field
                .build();


        // Set up the session parameters
        SessionCreateParams params = 
            SessionCreateParams.builder()
                .setMode(SessionCreateParams.Mode.PAYMENT)
                .setSuccessUrl("https://helpinghandsproject.up.railway.app/paymentSuccess")
                .setCancelUrl("https://helpinghandsproject.up.railway.app/cancel")
                .addLineItem(lineItem)
                .build();

        Session session;

        try {
            // Create the session
            session = Session.create(params);
        } catch (StripeException ex) {
            return new StripeResponse.Builder()
                    .status("Failure")
                    .message(ex.getMessage())
                    .build();
        }

        return new StripeResponse.Builder()
                .status("Success")
                .message("Donation session created")
                .sessionId(session.getId())
                .sessionUrl(session.getUrl())
                .build();
    }
}
