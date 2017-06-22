package com.bct.model;

import java.math.BigDecimal;

/**
 * Created by timy on 6/9/17.
 */
public class Lineitems {
    private String type;
    private String name;
    private String description;
    private String duration;
    private BigDecimal price;
    private int quantity;
    private String recurrence;
    private BigDecimal startupFee;
    private String tangible;
    private String productId;
    private Options[] options;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getRecurrence() {
        return recurrence;
    }

    public void setRecurrence(String recurrence) {
        this.recurrence = recurrence;
    }

    public BigDecimal getStartupFee() {
        return startupFee;
    }

    public void setStartupFee(BigDecimal startupFee) {
        this.startupFee = startupFee;
    }

    public String getTangible() {
        return tangible;
    }

    public void setTangible(String tangible) {
        this.tangible = tangible;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public Options[] getOptions() {
        return options;
    }

    public void setOptions(Options[] options) {
        this.options = options;
    }
}