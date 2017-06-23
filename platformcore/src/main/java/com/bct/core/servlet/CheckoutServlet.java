package com.bct.core.servlet;

import com.bct.core.exception.PaymentPlatformDAOException;
import com.bct.utils.NumberUtil;
import com.bct.core.exception.NotSupportedException;
import com.bct.model.PaymentTransaction;
import com.bct.partner.twocheckout.TwoCheckoutService;
import com.bct.service.PaymentServiceImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Timy on 5/22/17.
 */
public class CheckoutServlet extends HttpServlet {

    private PaymentServiceImpl paymentCoreService = null;

    private ApplicationContext applicationContext = null;

    @Override
    public void init() throws ServletException {

        super.init();
        applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
        paymentCoreService = applicationContext.getBean(PaymentServiceImpl.class);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PaymentTransaction paymentTransaction = new PaymentTransaction();
        TwoCheckoutService checkoutService = new TwoCheckoutService(applicationContext);
        try {
            paymentTransaction.setToken(request.getParameter("token"));
            paymentTransaction.setAuthAmout(NumberUtil.returnZeroIfNull(request.getParameter("auth_amount").toString()));
            paymentTransaction.setCustomerName(request.getParameter("customerName"));
            paymentTransaction.setAddress1(request.getParameter("addressLine1"));
            paymentTransaction.setAddress2(request.getParameter("line2"));
            paymentTransaction.setCity(request.getParameter("city"));
            paymentTransaction.setState(request.getParameter("state"));
            paymentTransaction.setPostalCode(request.getParameter("postalCode"));
            paymentTransaction.setCurrencyCode(request.getParameter("currencyCodeType"));
            paymentTransaction.setCountryCode(request.getParameter("country"));
            paymentTransaction.setPhoneno(request.getParameter("mobile"));
            paymentTransaction.setPaymentMethod(request.getParameter("payment_method"));
            paymentTransaction.setEmail(request.getParameter("email"));
            paymentTransaction.setCcNo(request.getParameter("ccNo"));
            paymentTransaction.setCcexp(request.getParameter("expMonth") + request.getParameter("expYear"));
            paymentTransaction.setCcNo(request.getParameter("cvv"));
            paymentTransaction.setMerchantId(NumberUtil.returnZeroIntIfNull(request.getParameter("merchant")));

            try {
                if (request.getParameter("type").equalsIgnoreCase("recurring")) {
                    paymentTransaction.setIsRecurring(1);
                    paymentTransaction = checkoutService.recurringBilling(paymentTransaction);
                } else {
                    paymentTransaction.setIsRecurring(0);
                    paymentTransaction = checkoutService.authorize(paymentTransaction);
                }
            } catch (Exception e) {
                paymentTransaction.setResponseMsg(e.getMessage().substring(0, 100));
                request.setAttribute("status", "failure");
                request.getRequestDispatcher("bookStore.jsp")
                        .forward(request, response);
            }
            request.setAttribute("response", paymentTransaction.getResponseMsg());
            try {
                paymentCoreService.savePaymentTransaction(paymentTransaction);
            } catch (PaymentPlatformDAOException e) {
                request.setAttribute("status", "failure");
                request.getRequestDispatcher("bookStore.jsp")
                        .forward(request, response);
            }

            request.setAttribute("status", "success");
            request.setAttribute("transactionId", paymentTransaction.getOrderNumber());
            request.setAttribute("amount", request.getParameter("auth_amount"));
            request.getRequestDispatcher("bookStore.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            request.setAttribute("status", "failure");
            request.getRequestDispatcher("bookStore.jsp")
                    .forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new NotSupportedException("Method Not supported");
    }
}
