package com.bct.utils;

/**
 * Created by timy on 5/26/17.
 */
public class PaymentDAOQuery {

    public static String searchPaymentTransactionQry_summary = "select MERCHANT_ID,TRANSACTION_DATE,sum(AUTH_AMOUNT) as AUTH_AMOUNT " +
            " from PAYMENT_TRANSACTIONS where  merchant_id =?";
    public static String searchPaymentTransactionQry_summary_grpBy = " group by MERCHANT_ID,TRANSACTION_DATE";
    public static String searchPaymentTransactionQry_detail = "select " +
            "AUTH_AMOUNT," + //1
            "TOKEN," + //2
            "CCEXP," +//3
            "PAYMENT_FACILITATOR_ID," +//4
            "TRANSACTION_TYPE," +//5
            "CURRENCY_CODE," +//6
            "COUNTRY_CODE," +//7
            "RESPONSE_CODE," +//8
            "CUSTOMER_NAME," +//9
            "ADDRESS1," +//10
            "ADDRESS2," +//11
            "CITY," +//12
            "STATE," +//13
            "ZIP_CODE," +//14
            "TRANSACTIONID," +//15
            "MERCHANT_ID,ORDER_ID" +//16
            " from PAYMENT_TRANSACTIONS where  merchant_id =? ";
    public static String savePaymentTransactionQry = "INSERT INTO PAYMENT_TRANSACTIONS " +
            "(" +
            "AUTH_AMOUNT," + //1
            "TOKEN," + //2
            "CCEXP," +//3
            "PAYMENT_FACILITATOR_ID," +//4
            "TRANSACTION_TYPE," +//5
            "CURRENCY_CODE," +//6
            "COUNTRY_CODE," +//7
            "RESPONSE_CODE," +//8
            "CUSTOMER_NAME," +//9
            "ADDRESS1," +//10
            "ADDRESS2," +//11
            "CITY," +//12
            "STATE," +//13
            "ZIP_CODE," +//14
            "TRANSACTIONID," +//15
            "MERCHANT_ID," + //16
            "ORDER_ID, " +//17
            "IS_RECURRING, " +//18
            "TRANSACTION_DATE " +//19
            ") VALUES (?,?,?,1,'CC',?,?,?,?,?,?,?,?,?,?,?,?,?,now())";

    public static String saveSubscription = "Insert Into Subscriptions (" +
            "subscription_id, " +//1
            "subscription_amount, " + //2
            "subscription_date, " +
            "billing_frequency, " +//3
            "billing_endDate, " +//4
            "product_id, " +//5
            "product_desc" +//6
            ") Values (?, ?, now(), ?, ?, ?, ?)";

    public static String updateRefundStatus = "Update Payment_Transactions " +
            " Set Is_Refunded = 1 Where Order_Id = ?";


    public static String searchMerchantConfig = "select id , CONFIG_KEY,CONFIG_VALUE,MERCHANT_ID from merchant_config wheRE merchant_id = ?";


    public static String totalOrders = "select count(*) totalOrders from payment_transactions where MERCHANT_ID = ?";
    public static String totalSubscriptions = "select count(*) totalSubscriptions from payment_transactions where MERCHANT_ID = ? and is_recurring = 1";
    public static String totalCancellations = "select count(*) from payment_transactions where MERCHANT_ID = ?";
    public static String totalRefunds = "select count(*) from payment_transactions where MERCHANT_ID = ?";
    public static String totalAmount = "select sum(auth_amount) from payment_transactions where MERCHANT_ID = ?";
    public static String getSysConfigs = "select config_app, config_name, config_value from configurations";
    public static String getPaymentId = "Select PaymentId From Payment_Transactions Where Order_Id = ?";


}
