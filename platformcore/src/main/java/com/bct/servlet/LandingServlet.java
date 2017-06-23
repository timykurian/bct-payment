package com.bct.servlet;

import com.bct.core.exception.NotSupportedException;
import com.bct.transport.vo.PaymentRequest;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LandingServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
    }

    /**
     * @param request HttpServletRequest
     * @param response HttpServletResponse
     * @exception IOException if an input or output error is detected when the
     *              servlet handles the GET request
     * @exception ServletException if the request could not be handled
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PaymentRequest payload = new PaymentRequest();
        String remarks = request.getParameter("remarks");

        payload.setMerchantId(request.getParameter("merchantId"));
        payload.setAmount(request.getParameter("amount"));
        payload.setProductName(request.getParameter("productName"));
        payload.setProductDesc(request.getParameter("productDesc"));
        payload.setRemarks(request.getParameter("remarks"));
        payload.setCustomerName(request.getParameter("customerName"));
        payload.setAddressLine1(request.getParameter("addressLine1"));
        payload.setAddressLine2(request.getParameter("addressLine2"));
        payload.setCity(request.getParameter("city"));
        payload.setState(request.getParameter("state"));
        payload.setCountry(request.getParameter("country"));
        payload.setPostalCode(request.getParameter("postalCode"));
        payload.setMobile(request.getParameter("mobile"));

        System.out.println("Payment Request received: " + payload.toString());

        request.setAttribute("merchantId", request.getParameter("merchantId"));
        request.setAttribute("productName", request.getParameter("productName"));
        request.setAttribute("amount", request.getParameter("amount"));
        request.setAttribute("productUrl", request.getParameter("productUrl"));

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        throw new NotSupportedException("Method Not supported");
    }
}
