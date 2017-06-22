package com.bct.service;

import com.bct.core.exception.PaymentPlatformDAOException;
import com.bct.dao.PaymentPlatformDAOImpl;
import com.bct.model.DashboardContent;
import com.bct.model.MerchantConfig;
import com.bct.model.PaymentTransaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by timy on 5/26/17.
 */
@Service
public class PaymentServiceImpl {

    Logger logger = LoggerFactory.getLogger(PaymentServiceImpl.class);
    private PaymentPlatformDAOImpl paymentPlatformDAO;

    public void setPaymentPlatformDAO(PaymentPlatformDAOImpl paymentPlatformDAO) {
        this.paymentPlatformDAO = paymentPlatformDAO;
    }

    /**
     * @param paymentTransaction
     * @throws PaymentPlatformDAOException
     */
    public void savePaymentTransaction(PaymentTransaction paymentTransaction) throws PaymentPlatformDAOException {
        try {
            paymentPlatformDAO.savePaymentTransaction(paymentTransaction);
        } catch (Exception e) {
            throw new PaymentPlatformDAOException(e.getMessage());
        }

    }


    /**
     * @param paymentTransaction
     * @return
     */
    public List<PaymentTransaction> searchMerchantPaymentDetailedReport(PaymentTransaction paymentTransaction) {
        List<PaymentTransaction> paymentTransactions = null;
        try {
            paymentTransactions = paymentPlatformDAO.searchPaymentTransactionDetail(paymentTransaction);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return paymentTransactions;
    }

    /**
     * @param id
     * @return
     */
    public List<PaymentTransaction> searchMerchantPaymentSummaryReport(int id) {
        List<PaymentTransaction> paymentTransactions = null;
        try {
            PaymentTransaction paymentTransaction = new PaymentTransaction();
            paymentTransaction.setMerchantId(id);
            paymentTransactions = paymentPlatformDAO.searchPaymentTransactionSummery(paymentTransaction);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return paymentTransactions;
    }

    /**
     * @param merchantId
     * @return
     */
    public List<MerchantConfig> searchMerchantConfiguration(int merchantId) {
        List<MerchantConfig> merchantConfigs = null;
        try {
            merchantConfigs = paymentPlatformDAO.searchMerchantConfiguration(merchantId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return merchantConfigs;
    }

    /**
     * @param id
     * @return
     */
    public DashboardContent getDashboardContent(int id) {
        DashboardContent content = new DashboardContent();
        try {
            content = paymentPlatformDAO.getDashboardContent(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return content;
    }

    public boolean updateRefund(String saleId) {

        boolean updated = false;

        try {
            updated = paymentPlatformDAO.updateRefund(saleId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }

    /**
     * @param merchantId
     * @return
     */
    public DashboardContent searchRefundOrders(int merchantId) {
        DashboardContent content = new DashboardContent();
        try {
            content = paymentPlatformDAO.getDashboardContent(merchantId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return content;
    }
}
