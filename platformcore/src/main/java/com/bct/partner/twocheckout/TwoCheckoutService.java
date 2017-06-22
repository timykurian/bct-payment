package com.bct.partner.twocheckout;

import com.bct.utils.PaymentConfigurationHelper;
import com.bct.core.exception.TwoCheckOutException;
import com.bct.model.Lineitems;
import com.bct.model.PaymentTransaction;
import com.google.gson.Gson;
import com.twocheckout.*;
import com.twocheckout.model.Authorization;
import com.twocheckout.model.Sale;
import org.springframework.context.ApplicationContext;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Timy on 5/23/17.
 */
public class TwoCheckoutService {

    private PaymentConfigurationHelper configHelper;

    public TwoCheckoutService() {
    }

    public TwoCheckoutService(ApplicationContext applicationContext) {
        configHelper = applicationContext.getBean(PaymentConfigurationHelper.class);
    }

    public TwoCheckoutService(PaymentConfigurationHelper configurationHelper) {
        configHelper = configurationHelper;
    }

    public PaymentTransaction authorize(PaymentTransaction paymentTransaction) throws TwoCheckOutException {

        String message = null;
        Twocheckout.privatekey = configHelper.getStringValue("PARTNER", "PRIVATE_KEY");
        Twocheckout.mode = configHelper.getStringValue("PARTNER", "ENVIRONMENT");
        Twocheckout.apiusername = configHelper.getStringValue("PARTNER", "API_USERNAME");
        Twocheckout.apipassword = configHelper.getStringValue("PARTNER", "API_PASSWORD");

        try {
            HashMap request = new HashMap();
            request.put("sellerId", configHelper.getStringValue("PARTNER", "SELLER_ID"));
            request.put("merchantOrderId", "test123");
            request.put("token", paymentTransaction.getToken());
            request.put("currency", configHelper.getStringValue("SYSTEM", "DEFAULT_CURRENCY_CODE"));
            request.put("total", paymentTransaction.getAuthAmout());
            request.put("billingAddr", paymentTransaction.getBillingAddress());

            Authorization response = TwocheckoutCharge.authorize(request);
            message =  response.getResponseMsg() + "TransactionId is:" + response.getTransactionId();
            System.out.println(response.getOrderNumber()+"-" + "-Msg-" + message);
            paymentTransaction.setResponseCode(response.getResponseCode());
            paymentTransaction.setResponseMsg(response.getResponseMsg());
            paymentTransaction.setTransactionId(response.getTransactionId());
            paymentTransaction.setOrderNumber(response.getOrderNumber());
        } catch (Exception e) {
            message = e.toString();
            System.out.println("Error-" + message);
            e.printStackTrace();
            throw  new TwoCheckOutException(message);
        }
        return paymentTransaction ;
    }

    public PaymentTransaction recurringBilling(PaymentTransaction paymentTransaction )  throws TwoCheckOutException {

        String message = null;
        Twocheckout.privatekey = configHelper.getStringValue("PARTNER", "PRIVATE_KEY");
        Twocheckout.mode = configHelper.getStringValue("PARTNER", "ENVIRONMENT");

        try {
            HashMap billing = paymentTransaction.getBillingAddress();
            HashMap shipping = paymentTransaction.getBillingAddress();

            Lineitems lineitem = new Lineitems();
            lineitem.setName("Demo Item 1");
            lineitem.setPrice(paymentTransaction.getAuthAmout());
            lineitem.setType("product");
            lineitem.setQuantity(1);
            lineitem.setProductId("123");
            lineitem.setRecurrence("1 Month");
            lineitem.setDuration("1 Year");

            Calendar now = Calendar.getInstance();
            now.add(1, 1);
            Date endDate = now.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String currentTime = sdf.format(endDate);

            paymentTransaction.setBillingFrequency("MM");
            paymentTransaction.setBillingEndDate(currentTime);

            List arrays = new ArrayList();
            arrays.add(lineitem);

            HashMap request = new HashMap();
            request.put("sellerId", configHelper.getStringValue("PARTNER", "SELLER_ID"));
            request.put("merchantOrderId", "test123");
            request.put("token", paymentTransaction.getToken());
            request.put("currency", configHelper.getStringValue("SYSTEM", "DEFAULT_CURRENCY_CODE"));
            request.put("total", paymentTransaction.getAuthAmout());
            request.put("lineItems", arrays.toArray());
            request.put("billingAddr", billing);
            request.put("shippingAddr", shipping);

            Authorization response = TwocheckoutCharge.authorize(request);
            message = response.getResponseMsg() + "TransactionId is:" + response.getOrderNumber();
            System.out.println(response.getOrderNumber()+"-" + "-Msg-" + message);
            paymentTransaction.setResponseCode(response.getResponseCode());
            paymentTransaction.setResponseMsg(response.getResponseMsg());
            paymentTransaction.setTransactionId(response.getTransactionId());
            paymentTransaction.setOrderNumber(response.getOrderNumber());
        } catch (Exception e) {
            message = e.toString();
            System.out.println("Error-" + message);
            e.printStackTrace();
            throw  new TwoCheckOutException(message);
        }
        return paymentTransaction ;
    }

    public TwocheckoutResponse refundTransaction( String saleId ) throws TwocheckoutException {
        
        TwocheckoutResponse twocheckoutResponse = null;
        HashMap params_refund = new HashMap();
        params_refund.put("comment", "test");
        params_refund.put("category", "1");
        try {
            Gson gson = new Gson();
            Sale sale2 = TwocheckoutSale.retrieve(saleId);
            twocheckoutResponse = sale2.refund(params_refund);
            System.out.println(gson.toJson(twocheckoutResponse));
        } catch (TwocheckoutException e) {
            String message = e.toString();
            e.printStackTrace();
            throw new TwocheckoutException(message);
        }

        return twocheckoutResponse;
    }

    public Sale findTransactionDetails(String saleId) throws TwocheckoutException {
        
        Sale sale = null;
        try {
            Gson gson = new Gson();
            sale = TwocheckoutSale.retrieve(saleId);
            System.out.println(gson.toJson(sale));
        } catch (TwocheckoutException e) {
            String message = e.toString();
            e.printStackTrace();
            throw new TwocheckoutException(e.getMessage());
        }
        return sale;
    }
}
