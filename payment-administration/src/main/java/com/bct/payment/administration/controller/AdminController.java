package com.bct.payment.administration.controller;

import com.bct.model.DashboardContent;
import com.bct.model.MerchantConfig;
import com.bct.model.PaymentTransaction;
import com.bct.partner.twocheckout.TwoCheckoutService;
import com.bct.service.PaymentServiceImpl;
import com.bct.utils.PaymentConfigurationHelper;
import com.google.gson.Gson;
import com.twocheckout.Twocheckout;
import com.twocheckout.TwocheckoutException;
import com.twocheckout.TwocheckoutResponse;
import com.twocheckout.model.Sale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @Autowired
    PaymentServiceImpl paymentCoreService;
    @Autowired
    PaymentConfigurationHelper configurationHelper;

    public static void setAccessMode() {
        Twocheckout.privatekey = "C1E28A9D-8F4C-4ABB-AF7C-AB9C8BA25D0E";
        Twocheckout.mode = "sandbox";
        Twocheckout.apiusername = "timy47";
        Twocheckout.apipassword = "Pmklissy@88";
    }

    @RequestMapping(value = "/checkStatus", method = RequestMethod.GET)
    @ResponseBody
    public HttpEntity<ResponseEntity> checkStatus(ModelMap modelMap) {
        modelMap.addAttribute("merchantDetails", "Success");
        return new ResponseEntity(modelMap, org.springframework.http.HttpStatus.OK);
    }

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

    @RequestMapping(value = "/merchant/{merchantId}", method = RequestMethod.GET)
    public HttpEntity<ResponseEntity> getMerchantPaymentDetails(@PathVariable int merchantId, ModelMap model) {
        PaymentTransaction paymentTransaction = new PaymentTransaction();
        paymentTransaction.setMerchantId(merchantId);
        List<PaymentTransaction> list = paymentCoreService.searchMerchantPaymentDetailedReport(paymentTransaction);
        System.out.println("getMerchantPaymentDetails list:" + list);
        Gson gson = new Gson();
        model.addAttribute("merchantDetails", gson.toJson(list));
        return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
    }

    @RequestMapping(value = "/merchant/summary/{merchantId}", method = RequestMethod.GET)
    public HttpEntity<ResponseEntity> getMerchantPaymentSummary(@PathVariable int merchantId, ModelMap model) {
        List<PaymentTransaction> list = paymentCoreService.searchMerchantPaymentSummaryReport(merchantId);
        Gson gson = new Gson();
        model.addAttribute("merchantDetails", gson.toJson(list));
        return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);

    }

    /**
     * @param merchantId
     * @param saleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/merchant/{merchantId}/refund/{saleId}", method = RequestMethod.GET)
    public HttpEntity<ResponseEntity> refundTransaction(@PathVariable int merchantId, @PathVariable String saleId, ModelMap model) {
        Gson gson = new Gson();
        setAccessMode();
        try {
            TwoCheckoutService checkoutService = new TwoCheckoutService(configurationHelper);
            TwocheckoutResponse twocheckoutResponse = checkoutService.refundTransaction(saleId);
            model.addAttribute("merchantDetails", gson.toJson(twocheckoutResponse));
            model.addAttribute("errorMsg", "");
            try {
                boolean statusUpdated = paymentCoreService.updateRefund(saleId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        } catch (TwocheckoutException e) {
            e.printStackTrace();
            if (e.getMessage().contains("Invoice was already refunded")) {
                model.addAttribute("errorMsg", "Invoice was already refunded");
            } else {
                model.addAttribute("errorMsg", "Refund could not be processesd");
            }
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        }

    }

    /**
     * @param merchantId
     * @param saleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/merchant/{merchantId}/paymentDetails/{saleId}", method = RequestMethod.GET)
    public HttpEntity<ResponseEntity> findTransactionDetails(@PathVariable int merchantId, @PathVariable String saleId, ModelMap model) {
        Gson gson = new Gson();
        setAccessMode();
        try {
            TwoCheckoutService checkoutService = new TwoCheckoutService(configurationHelper);
            Sale sale = checkoutService.findTransactionDetails(saleId);
            model.addAttribute("merchantDetails", gson.toJson(sale));
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        } catch (TwocheckoutException e) {
            String message = e.toString();
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/merchant/{merchantId}/dashboard/summary", method = RequestMethod.GET)
    public HttpEntity<ResponseEntity> getDashboardData(@PathVariable int merchantId, ModelMap model) {

        Gson gson = new Gson();
        try {
            DashboardContent content = paymentCoreService.getDashboardContent(merchantId);
            model.addAttribute("totalOrderCount", gson.toJson(content.getTotalTransactions()));
            model.addAttribute("totalRecurringOrderCount", gson.toJson(content.getTotalSubscriptions()));
            model.addAttribute("totalRefunds", gson.toJson(content.getTotalRefunds()));
            model.addAttribute("totalStoppedRecurring", gson.toJson(content.getTotalStoppedRecurring()));
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        } catch (Exception e) {
            String message = e.toString();
            e.printStackTrace();
            model.addAttribute("errorMsg", e.getMessage());
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/merchant/{merchantId}/dashboard/subscriptions", method = RequestMethod.GET)
    public HttpEntity<ResponseEntity> searchSubscriptions(@PathVariable int merchantId, ModelMap model) {

        Gson gson = new Gson();
        try {
            PaymentTransaction paymentTransaction = new PaymentTransaction();
            paymentTransaction.setMerchantId(merchantId);
            paymentTransaction.setIsRecurring(1);
            List<PaymentTransaction> list = paymentCoreService.searchMerchantPaymentDetailedReport(paymentTransaction);
            model.addAttribute("subscriptions", gson.toJson(list));
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        } catch (Exception e) {
            String message = e.toString();
            e.printStackTrace();
            model.addAttribute("errorMsg", e.getMessage());
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        }
	}

    @RequestMapping(value = "/merchant/{merchantId}/dashboard/refunds", method = RequestMethod.GET)
    public HttpEntity<ResponseEntity> searchRefunds(@PathVariable int merchantId, ModelMap model) {

        Gson gson = new Gson();
        try {
            PaymentTransaction paymentTransaction = new PaymentTransaction();
            paymentTransaction.setMerchantId(merchantId);
            paymentTransaction.setIsRefund(1);
            List<PaymentTransaction> list = paymentCoreService.searchMerchantPaymentDetailedReport(paymentTransaction);
            model.addAttribute("subscriptions", gson.toJson(list));
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        } catch (Exception e) {
            String message = e.toString();
            e.printStackTrace();
            model.addAttribute("errorMsg", e.getMessage());
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        }
    }


    /**
     * @param merchantId
     * @param saleId
     * @param model
     * @return
     */
    @RequestMapping(value = "/merchant/{merchantId}/stopRecurring/{saleId}", method = RequestMethod.GET)
    public HttpEntity<ResponseEntity> stopRecurring(@PathVariable int merchantId, @PathVariable String saleId, ModelMap model) {
        Gson gson = new Gson();
        setAccessMode();
        try {
            TwoCheckoutService checkoutService = new TwoCheckoutService(configurationHelper);
            TwocheckoutResponse twocheckoutResponse = checkoutService.stopRecurring(saleId);
            model.addAttribute("orderDetails", gson.toJson(twocheckoutResponse));
            model.addAttribute("errorMsg", "");
            try {
                boolean statusUpdated = paymentCoreService.updateRecurringStatus(saleId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        } catch (TwocheckoutException e) {
            e.printStackTrace();
            if (e.getMessage().contains("NO ACTIVE RECURRING LINEITEMS")) {
                model.addAttribute("errorMsg", "No active recurring lineitems");
            } else {
                model.addAttribute("errorMsg", "Recurring billing stop could not be processesd");
            }
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        }

    }


    @RequestMapping(value = "/merchant/{merchantId}/dashboard/recurringStoppedTransactions", method = RequestMethod.GET)
    public HttpEntity<ResponseEntity> searchRecurringStoppedTransactions(@PathVariable int merchantId, ModelMap model) {

        Gson gson = new Gson();
        try {
            PaymentTransaction paymentTransaction = new PaymentTransaction();
            paymentTransaction.setMerchantId(merchantId);
            List<PaymentTransaction> list = paymentCoreService.searchStoppedRecurringTransactions(paymentTransaction);
            model.addAttribute("recurringStoppedTransactions", gson.toJson(list));
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        } catch (Exception e) {
            String message = e.toString();
            e.printStackTrace();
            model.addAttribute("errorMsg", e.getMessage());
            return new ResponseEntity(model, org.springframework.http.HttpStatus.OK);
        }
    }




}