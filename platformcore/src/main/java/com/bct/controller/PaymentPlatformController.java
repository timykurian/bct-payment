package com.bct.controller;

import com.bct.model.MerchantConfig;
import com.bct.partner.twocheckout.TwoCheckoutService;
import com.bct.service.PaymentServiceImpl;
import com.bct.utils.PaymentConfigurationHelper;
import com.google.gson.Gson;
import com.twocheckout.TwocheckoutException;
import com.twocheckout.TwocheckoutResponse;
import com.twocheckout.model.Sale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by timy on 6/8/17.
 */

@Controller
@RequestMapping("/admin/paymentplatform")
public class PaymentPlatformController {

    @Autowired
    PaymentServiceImpl paymentCoreService;

    @Autowired
    PaymentConfigurationHelper configurationHelper;

    /**
     * Get the merchant specific configuration
     *
     * @param merchantId
     * @return
     */
    @RequestMapping(value = "/merchant/{merchantId}/config", method = RequestMethod.GET)
    public String findMerchantConfiguration(@PathVariable int merchantId, ModelMap model) {
        List<MerchantConfig> merchantConfigs = null;
        try {
            merchantConfigs = paymentCoreService.searchMerchantConfiguration(merchantId);
            Gson gson = new Gson();
            model.addAttribute("merchantDetails", gson.toJson(merchantConfigs));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin";
    }

    /**
     * @param merchantId
     * @param saleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/merchant/{merchantId}/refund/{saleId}", method = RequestMethod.GET)
    public String refundTransaction(@PathVariable int merchantId, @PathVariable String saleId, ModelMap model) {
        Gson gson = new Gson();
        TwoCheckoutService checkoutService = new TwoCheckoutService(configurationHelper);
        try {
            TwocheckoutResponse twocheckoutResponse = checkoutService.refundTransaction(saleId);
            model.addAttribute("merchantDetails", gson.toJson(twocheckoutResponse));
        } catch (TwocheckoutException e) {
            String message = e.toString();
            e.printStackTrace();
        }
        return "admin";
    }

    /**
     * @param merchantId
     * @param saleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/merchant/{merchantId}/paymentDetails/{saleId}", method = RequestMethod.GET)
    public String findTransactionDetails(@PathVariable int merchantId, @PathVariable String saleId, ModelMap model) {
        Gson gson = new Gson();
        TwoCheckoutService checkoutService = new TwoCheckoutService(configurationHelper);
        try {
            Sale sale = checkoutService.findTransactionDetails(saleId);
            model.addAttribute("merchantDetails", gson.toJson(sale));
        } catch (TwocheckoutException e) {
            String message = e.toString();
            e.printStackTrace();
        }
        return "admin";
    }


}
