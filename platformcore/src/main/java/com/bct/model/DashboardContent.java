package com.bct.model;

import java.math.BigDecimal;

/**
 * Created by timy on 5/26/17.
 */
public class DashboardContent {

    private Integer totalSubscriptions;
    private Integer totalTransactions;
    private Integer cancellationsThisMonth;
    private BigDecimal transactionTotal;
    private Integer totalRefunds;

    public Integer getTotalRefunds() {
        return totalRefunds;
    }

    public void setTotalRefunds(Integer totalRefunds) {
        this.totalRefunds = totalRefunds;
    }

    public Integer getTotalSubscriptions() {
        return totalSubscriptions;
    }

    public void setTotalSubscriptions(Integer totalSubscriptions) {
        this.totalSubscriptions = totalSubscriptions;
    }

    public Integer getTotalTransactions() {
        return totalTransactions;
    }

    public void setTotalTransactions(Integer totalTransactions) {
        this.totalTransactions = totalTransactions;
    }

    public Integer getCancellationsThisMonth() {
        return cancellationsThisMonth;
    }

    public void setCancellationsThisMonth(Integer cancellationsThisMonth) {
        this.cancellationsThisMonth = cancellationsThisMonth;
    }

    public BigDecimal getTransactionTotal() {
        return transactionTotal;
    }

    public void setTransactionTotal(BigDecimal transactionTotal) {
        this.transactionTotal = transactionTotal;
    }
}
