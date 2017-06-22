package com.bct.dao;

import com.bct.model.MerchantConfig;
import com.bct.model.PaymentTransaction;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;

/**
 * Created by timy on 6/8/17.
 */
public class SpringJdbcMapper {
    public static class MerchantConfigRowMapper implements RowMapper<MerchantConfig> {

        public MerchantConfig mapRow(ResultSet rs, int rowNum) throws SQLException {
            MerchantConfig merchantConfig = new MerchantConfig();
            merchantConfig.setId(rs.getInt("ID"));
            merchantConfig.setMerchantId(rs.getInt("MERCHANT_ID"));
            merchantConfig.setConfigKey(rs.getString("CONFIG_KEY"));
            merchantConfig.setConfigValue(rs.getString("CONFIG_VALUE"));
            return merchantConfig;
        }
    }

    /**
     *
     */
    public static class PaymentTransactionRowMapper implements  RowMapper<PaymentTransaction> {
        public PaymentTransaction mapRow(ResultSet rs, int rowNum) throws SQLException {
            PaymentTransaction paymentTransaction = new PaymentTransaction();
            paymentTransaction.setMerchantId(rs.getInt("MERCHANT_ID"));
            paymentTransaction.setAuthAmout(rs.getBigDecimal("AUTH_AMOUNT"));
            paymentTransaction.setTransactionId(rs.getString("TRANSACTIONID"));
            paymentTransaction.setResponseCode(rs.getString("RESPONSE_CODE"));
            paymentTransaction.setToken(rs.getString("TOKEN"));
            paymentTransaction.setAddress1(rs.getString("ADDRESS1"));
            paymentTransaction.setAddress2(rs.getString("ADDRESS2"));
            paymentTransaction.setCustomerName(rs.getString("CUSTOMER_NAME"));
            paymentTransaction.setServiceProviderId(rs.getInt("PAYMENT_FACILITATOR_ID"));
            paymentTransaction.setOrderNumber(rs.getString("ORDER_ID"));
            return paymentTransaction;
        }
    }

    public static class PaymentTransactionSummaryReportRowMapper implements  RowMapper<PaymentTransaction> {
        public PaymentTransaction mapRow(ResultSet rs, int rowNum) throws SQLException {
            PaymentTransaction paymentTransaction = new PaymentTransaction();
            paymentTransaction.setMerchantId(rs.getInt("MERCHANT_ID"));
            paymentTransaction.setTransactionDate(rs.getDate("TRANSACTION_DATE"));
            paymentTransaction.setAuthAmout(rs.getBigDecimal("AUTH_AMOUNT"));
            return paymentTransaction;
        }
    }

    public static class PaymentTransactionPreparedStatementSetter implements PreparedStatementSetter {
        private PaymentTransaction paymentTransaction;

        public PaymentTransactionPreparedStatementSetter(PaymentTransaction transaction) {
            paymentTransaction = transaction;
        }

        public void setValues(PreparedStatement ps) throws SQLException {
            PaymentTransaction record = (PaymentTransaction) paymentTransaction;
            ps.setBigDecimal(1, paymentTransaction.getAuthAmout());
            ps.setString(2, paymentTransaction.getToken());
            ps.setString(3, paymentTransaction.getCcexp());
            ps.setString(4, paymentTransaction.getCurrencyCode());
            ps.setString(5, paymentTransaction.getCountryCode());
            ps.setString(6, paymentTransaction.getResponseCode());
            ps.setString(7, paymentTransaction.getCustomerName());
            ps.setString(8, paymentTransaction.getAddress1());
            ps.setString(9, paymentTransaction.getAddress2());
            ps.setString(10, paymentTransaction.getCity());
            ps.setString(11, paymentTransaction.getState());
            ps.setString(12, paymentTransaction.getPostalCode());
            ps.setString(13, paymentTransaction.getTransactionId());
            ps.setInt(14,paymentTransaction.getMerchantId());
            ps.setString(15,paymentTransaction.getOrderNumber());
            ps.setInt(16, paymentTransaction.getIsRecurring());
        }
    }

    public static class SubscriptionValuesSetter implements PreparedStatementSetter {

        private PaymentTransaction paymentTransaction;

        public SubscriptionValuesSetter(PaymentTransaction transaction) {
            paymentTransaction = transaction;
        }

        public void setValues(PreparedStatement ps) throws SQLException {

            ps.setInt(1, paymentTransaction.getPaymentId());
            ps.setBigDecimal(2, paymentTransaction.getAuthAmout());
            ps.setString(3, paymentTransaction.getBillingFrequency());
            ps.setString(4, paymentTransaction.getBillingEndDate());
            ps.setString(5, paymentTransaction.getProductId());
            ps.setString(6, paymentTransaction.getProductDesc());
        }
    }

    public static class RefundStatusSetter implements PreparedStatementSetter {

        String saleId;

        public RefundStatusSetter(String saleId) {
            this.saleId = saleId;
        }

        public void setValues(PreparedStatement ps) throws SQLException {

            ps.setString(1, this.saleId);
        }
    }

}
