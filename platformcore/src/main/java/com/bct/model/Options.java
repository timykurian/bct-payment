package com.bct.model;

import java.math.BigDecimal;

/**
 * Created by timy on 6/9/17.
 */
public class Options {
    private String optName;
    private String optValue;
    private BigDecimal optSurcharge;

    public String getOptName() {
        return optName;
    }

    public void setOptName(String optName) {
        this.optName = optName;
    }

    public String getOptValue() {
        return optValue;
    }

    public void setOptValue(String optValue) {
        this.optValue = optValue;
    }

    public BigDecimal getOptSurcharge() {
        return optSurcharge;
    }

    public void setOptSurcharge(BigDecimal optSurcharge) {
        this.optSurcharge = optSurcharge;
    }

}
