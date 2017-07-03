package com.bct.utils;

/**
 * Created by timy on 5/26/17.
 */
public class PaymentDAOQuery {

    public static String searchPaymentTransactionQry_summary = "select merchant_id,transaction_date,sum(auth_amount) as auth_amount " +
            " from payment_transactions where  merchant_id =?";
    public static String searchPaymentTransactionQry_summary_grpBy = " group by merchant_id,transaction_date";
    public static String searchPaymentTransactionQry_detail = "select " +
            "auth_amount," + //1
            "token," + //2
            "ccexp," +//3
            "payment_facilitator_id," +//4
            "transaction_type," +//5
            "currency_code," +//6
            "country_code," +//7
            "response_code," +//8
            "customer_name," +//9
            "address1," +//10
            "address2," +//11
            "city," +//12
            "state," +//13
            "zip_code," +//14
            "transactionid," +//15
            "merchant_id,order_id" +//16
            " from payment_transactions where  merchant_id =? ";
    public static String savePaymentTransactionQry = "insert into payment_transactions " +
            "(" +
            "auth_amount," + //1
            "token," + //2
            "ccexp," +//3
            "payment_facilitator_id," +//4
            "transaction_type," +//5
            "currency_code," +//6
            "country_code," +//7
            "response_code," +//8
            "customer_name," +//9
            "address1," +//10
            "address2," +//11
            "city," +//12
            "state," +//13
            "zip_code," +//14
            "transactionid," +//15
            "merchant_id," + //16
            "order_id, " +//17
            "is_recurring, " +//18
            "transaction_date " +//19
            ") values (?,?,?,1,'cc',?,?,?,?,?,?,?,?,?,?,?,?,?,now())";

    public static String saveSubscription = "insert into subscriptions (" +
            "subscription_id, " +//1
            "subscription_amount, " + //2
            "subscription_date, " +
            "billing_frequency, " +//3
            "billing_enddate, " +//4
            "product_id, " +//5
            "product_desc," +//6
            "order_id" +
            ") values (?, ?, now(), ?, ?, ?, ?,?)";

    public static String updateRefundStatus = "update payment_transactions " +
            " set is_refunded = 1 where order_id = ?";


    public static String searchMerchantConfig = "select id , config_key,config_value,merchant_id from merchant_config where merchant_id = ?";


    public static String totalOrders = "select count(*) totalorders from payment_transactions where merchant_id = ?";
    public static String totalSubscriptions = "select count(*) totalsubscriptions from payment_transactions" +
            " where merchant_id = ? and is_recurring = 1 " +
            "and order_id in (select order_id from subscriptions where billing_enddate is null) order by transaction_date desc";
    public static String totalCancellations = "select count(*) from payment_transactions where merchant_id = ?";
    public static String totalRefunds = "select count(*) as totalrefunds from payment_transactions where merchant_id = ? and is_refunded = 1";
    public static String totalAmount = "select sum(auth_amount) from payment_transactions where merchant_id = ?";
    public static String getSysConfigs = "select config_app, config_name, config_value from configurations";
    public static String getPaymentId = "select paymentid from payment_transactions where order_id = ?";

    public static String updateRecurringEndStatus = " update subscriptions set billing_enddate=now() where order_id = ? ";

    public static String totalStoppedRecurring = " select count(*) as totalstoppedrecurring from subscriptions " +
            "where  billing_enddate is not null and order_id in (select order_id from payment_transactions where merchant_id = ? )";

    public static String searchStoppedRecurringTransactions = "select  transactionid , token , auth_amount , customer_name , " +
            " response_code , order_id  from payment_transactions where merchant_id = ?  " +
            " and order_id in (select order_id from subscriptions where billing_enddate is not null)";


}

