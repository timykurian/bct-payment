package com.bct.dao;

import com.bct.core.exception.BaseException;
import com.bct.core.exception.PaymentPlatformDAOException;
import com.bct.model.DashboardContent;
import com.bct.model.MerchantConfig;
import com.bct.model.PaymentTransaction;
import com.bct.utils.PaymentDAOQuery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by timy on 5/25/17.
 */
@Component
public class PaymentPlatformDAOImpl {

    private DriverManagerDataSource dataSource;
    private JdbcTemplate jdbcTemplate;

    public DriverManagerDataSource getDataSource() {
        return dataSource;
    }

    public void setDataSource(DriverManagerDataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    /**
     * @param paymentTransaction
     * @throws PaymentPlatformDAOException
     */
    public void savePaymentTransaction(PaymentTransaction paymentTransaction) throws PaymentPlatformDAOException {
        try {
            jdbcTemplate.update(PaymentDAOQuery.savePaymentTransactionQry,
                    new SpringJdbcMapper.PaymentTransactionPreparedStatementSetter(paymentTransaction));
            if (paymentTransaction.getIsRecurring() == 1) {
                String query = PaymentDAOQuery.getPaymentId.replace("?", paymentTransaction.getOrderNumber());
                List<Map<String, Object>> rows = jdbcTemplate.queryForList(query);
                Integer paymentId = null;
                for (Map row : rows) {
                    paymentId = (Integer) row.get("PaymentId");
                    paymentTransaction.setPaymentId(paymentId);
                }
                jdbcTemplate.update(PaymentDAOQuery.saveSubscription,
                        new SpringJdbcMapper.SubscriptionValuesSetter(paymentTransaction));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new PaymentPlatformDAOException(e);
        }
    }

    /**
     *
     * @param paymentTransaction
     * @return
     * @throws PaymentPlatformDAOException
     */
    public List<PaymentTransaction> searchPaymentTransactionDetail(PaymentTransaction paymentTransaction) throws PaymentPlatformDAOException {
        List<PaymentTransaction> paymentTransactions = null;
        try {
            StringBuilder query = new StringBuilder(PaymentDAOQuery.searchPaymentTransactionQry_detail);
            if (paymentTransaction.getIsRecurring() != null && paymentTransaction.getIsRecurring() > 0) {
                query.append(" and is_recurring = 1 and  order_id in (select order_id from subscriptions where billing_enddate is  null) \n");
            }
            if (paymentTransaction.getIsRefund() != null && paymentTransaction.getIsRefund() > 0) {
                query.append(" and is_refunded = 1");
            }
            query.append(" order by transaction_date desc");

            paymentTransactions = jdbcTemplate.query(query.toString(),
                    new Object[]{paymentTransaction.getMerchantId()},
                    new SpringJdbcMapper.PaymentTransactionRowMapper());
        } catch (Exception exception) {
            throw new RuntimeException(exception);
        }
        return paymentTransactions;
    }

    /**
     *
     * @param paymentTransaction
     * @return
     * @throws PaymentPlatformDAOException
     */
    public List<PaymentTransaction> searchPaymentTransactionSummery(PaymentTransaction paymentTransaction) throws PaymentPlatformDAOException {
        List<PaymentTransaction> paymentTransactions = null;
        try {
            StringBuilder query = new StringBuilder(PaymentDAOQuery.searchPaymentTransactionQry_summary);
            query.append(PaymentDAOQuery.searchPaymentTransactionQry_summary_grpBy);
            paymentTransactions = jdbcTemplate.query(query.toString(), new Object[]{paymentTransaction.getMerchantId()},
                    new SpringJdbcMapper.PaymentTransactionSummaryReportRowMapper());

        } catch (Exception exception) {
            throw new RuntimeException(exception);
        }
        return paymentTransactions;
    }

    /**
     *
     * @param merchantId
     * @return
     * @throws PaymentPlatformDAOException
     */
    public List<MerchantConfig> searchMerchantConfiguration(int merchantId) throws PaymentPlatformDAOException {
        List<MerchantConfig> merchantConfigs = null;
        try {
            if (merchantId > 0) {
                merchantConfigs = jdbcTemplate.query(PaymentDAOQuery.searchMerchantConfig, new Object[]{merchantId},
                        new SpringJdbcMapper.MerchantConfigRowMapper());
            } else {
                throw new PaymentPlatformDAOException(BaseException.MERCHANT_ID_MISSING);
            }
        } catch (Exception e) {
            throw new PaymentPlatformDAOException(e.getMessage());
        }
        return merchantConfigs;
    }

    public DashboardContent getDashboardContent(int merchantId) throws PaymentPlatformDAOException {

        DashboardContent content = new DashboardContent();
        try {
            List<Map<String, Object>> rows = jdbcTemplate.queryForList(PaymentDAOQuery.totalOrders, new Object[]{merchantId});
            for (Map row : rows) {
                content.setTotalTransactions(Integer.parseInt(row.get("totalOrders").toString()));
            }
            rows = jdbcTemplate.queryForList(PaymentDAOQuery.totalSubscriptions, new Object[]{merchantId});
            for (Map row : rows) {
                content.setTotalSubscriptions((Integer.parseInt(row.get("totalSubscriptions").toString())));
            }
            rows = jdbcTemplate.queryForList(PaymentDAOQuery.totalRefunds, new Object[]{merchantId});
            for (Map row : rows) {
                content.setTotalRefunds((Integer.parseInt(row.get("totalRefunds").toString())));
            }
            rows = jdbcTemplate.queryForList(PaymentDAOQuery.totalStoppedRecurring, new Object[]{merchantId});
            for (Map row : rows) {
                content.setTotalStoppedRecurring((Integer.parseInt(row.get("totalStoppedRecurring").toString())));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new PaymentPlatformDAOException(e);
        }

        return content;
    }

    public boolean updateRefund(String saleId) throws PaymentPlatformDAOException {

        int rowsAffected = 0;
        try {
            rowsAffected = jdbcTemplate.update(PaymentDAOQuery.updateRefundStatus,
                    new SpringJdbcMapper.RefundStatusSetter(saleId));
        } catch (Exception e) {
            throw new PaymentPlatformDAOException(e);
        }

        return (rowsAffected > 0) ? true : false;
    }

    public boolean updateRecurringStatus(String saleId) throws PaymentPlatformDAOException {

        int rowsAffected = 0;
        try {
            rowsAffected = jdbcTemplate.update(PaymentDAOQuery.updateRecurringEndStatus,
                    new SpringJdbcMapper.RefundStatusSetter(saleId));
        } catch (Exception e) {
            throw new PaymentPlatformDAOException(e);
        }

        return (rowsAffected > 0) ? true : false;
    }

    /**
     * @param paymentTransaction
     * @return
     * @throws PaymentPlatformDAOException
     */
    public List<PaymentTransaction> searchStoppedRecurringTransactions(PaymentTransaction paymentTransaction) throws PaymentPlatformDAOException {
        List<PaymentTransaction> paymentTransactions = null;
        try {
            //if (paymentTransaction.getMerchantId() > 0) {
            paymentTransactions = jdbcTemplate.query(PaymentDAOQuery.searchStoppedRecurringTransactions, new Object[]{paymentTransaction.getMerchantId()},
                    new SpringJdbcMapper.StoppedRecurringTransactionRowMapper());
           /* } else {
                throw new PaymentPlatformDAOException(BaseException.MERCHANT_ID_MISSING);
            }*/
        } catch (Exception e) {
            throw new PaymentPlatformDAOException(e.getMessage());
        }
        return paymentTransactions;
    }
}
