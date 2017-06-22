package com.bct.model;

/**
 * Created by timy on 6/8/17.
 */
public class MerchantConfig {

    private int id;
    private String configKey;
    private String configValue;
    private int merchantId;

    public MerchantConfig() {
    }

    public MerchantConfig(int id, String configKey, String configValue, int merchantId) {
        this.id = id;
        this.configKey = configKey;
        this.configValue = configValue;
        this.merchantId = merchantId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getConfigKey() {
        return configKey;
    }

    public void setConfigKey(String configKey) {
        this.configKey = configKey;
    }

    public String getConfigValue() {
        return configValue;
    }

    public void setConfigValue(String configValue) {
        this.configValue = configValue;
    }

    public int getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(int merchantId) {
        this.merchantId = merchantId;
    }
}
