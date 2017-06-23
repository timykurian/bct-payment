package com.bct.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;

/**
 * Created by timy on 5/26/17.
 */
public class PaymentTransaction {

    private String transactionId;
    private int merchantId;
    private int serviceProviderId;
    private BigDecimal authAmout;
    private String cardType;
    private String token;
    private String ccexp;
    private String customerName;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String postalCode;
    private String currencyCode;
    private String countryCode;
    private String phoneno;
    private String paymentMethod;
    private String ccNo;
    private String expC;
    private String cvv;
    private String responseCode;
    private String responseMsg;
    private String orderNumber;

    private Integer isRecurring;
    private String email;
    private String billingFrequency;
    private String billingEndDate;
    private String productId;
    private String productDesc;
    private Date transactionDate;
    private int paymentId;
    private Integer isRefund;

    public PaymentTransaction(String transactionId, int merchantId, int serviceProviderId, BigDecimal authAmout, String cardType, String token, String ccexp, String customerName, String address1, String address2, String city, String state, String postalCode, String currencyCode, String countryCode, String phoneno, String paymentMethod, String ccNo, String expC, String cvv, String responseCode, String responseMsg, int paymentId) {
        this.transactionId = transactionId;
        this.merchantId = merchantId;
        this.serviceProviderId = serviceProviderId;
        this.authAmout = authAmout;
        this.cardType = cardType;
        this.token = token;
        this.ccexp = ccexp;
        this.customerName = customerName;
        this.address1 = address1;
        this.address2 = address2;
        this.city = city;
        this.state = state;
        this.postalCode = postalCode;
        this.currencyCode = currencyCode;
        this.countryCode = countryCode;
        this.phoneno = phoneno;
        this.paymentMethod = paymentMethod;
        this.ccNo = ccNo;
        this.expC = expC;
        this.cvv = cvv;
        this.responseCode = responseCode;
        this.responseMsg = responseMsg;
        this.paymentId = paymentId;
    }

    public PaymentTransaction(int merchantId, int serviceProviderId, BigDecimal authAmout) {
        this.merchantId = merchantId;
        this.serviceProviderId = serviceProviderId;
        this.authAmout = authAmout;

    }


    public PaymentTransaction(int merchantId, Date transactionDate, BigDecimal authAmout) {
        this.merchantId = merchantId;
        this.transactionDate = transactionDate;
        this.authAmout = authAmout;

    }

    public PaymentTransaction(int paymentId) {
        this.paymentId = paymentId;
    }

    public PaymentTransaction() {
    }

    public Integer getIsRefund() {
        return isRefund;
    }

    public void setIsRefund(Integer isRefund) {
        this.isRefund = isRefund;
    }

    public HashMap getBillingAddress() {

        HashMap billing = new HashMap();
        billing.put("name", customerName);
        billing.put("addrLine1", address1);
        billing.put("city", city);
        billing.put("state", state);
        billing.put("country", countryCode);
        billing.put("zipCode", postalCode);
        billing.put("email", email);
        billing.put("phoneNumber", phoneno);

        return billing;
    }

    public String getBillingFrequency() {
        return billingFrequency;
    }

    public void setBillingFrequency(String billingFrequency) {
        this.billingFrequency = billingFrequency;
    }

    public String getBillingEndDate() {
        return billingEndDate;
    }

    public void setBillingEndDate(String billingEndDate) {
        this.billingEndDate = billingEndDate;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getIsRecurring() {
        return isRecurring;
    }

    public void setIsRecurring(Integer isRecurring) {
        this.isRecurring = isRecurring;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getResponseMsg() {
        return responseMsg;
    }

    public void setResponseMsg(String responseMsg) {
        this.responseMsg = responseMsg;
    }

    public String getResponseCode() {
        return responseCode;
    }

    public void setResponseCode(String responseCode) {
        this.responseCode = responseCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getCcNo() {
        return ccNo;
    }

    public void setCcNo(String ccNo) {
        this.ccNo = ccNo;
    }

    public String getExpC() {
        return expC;
    }

    public void setExpC(String expC) {
        this.expC = expC;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public int getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(int merchantId) {
        this.merchantId = merchantId;
    }

    public int getServiceProviderId() {
        return serviceProviderId;
    }

    public void setServiceProviderId(int serviceProviderId) {
        this.serviceProviderId = serviceProviderId;
    }

    public BigDecimal getAuthAmout() {
        return authAmout;
    }

    public void setAuthAmout(BigDecimal authAmout) {
        this.authAmout = authAmout;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getCcexp() {
        return ccexp;
    }

    public void setCcexp(String ccexp) {
        this.ccexp = ccexp;
    }

    @Override
    public String toString() {
        return "PaymentTransaction(" +
                (transactionId != null ? "transactionId=" + transactionId + ", " : "") +
                (merchantId != 0 ? "merchantId=" + merchantId + ", " : "") +
                (serviceProviderId != 0 ? "serviceProviderId=" + serviceProviderId + ", " : "") +
                (authAmout != null ? "authAmout=" + authAmout + ", " : "") +
                (cardType != null ? "cardType=" + cardType + ", " : "") +
                (token != null ? "token=" + token + ", " : ")")
                ;
    }
}
