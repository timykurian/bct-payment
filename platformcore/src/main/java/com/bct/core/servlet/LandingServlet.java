package com.bct.core.servlet;

import com.bct.core.exception.NotSupportedException;
import com.bct.transport.vo.PaymentRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LandingServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    /**
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     * @throws IOException      if an input or output error is detected when the
     *                          servlet handles the GET request
     * @throws ServletException if the request could not be handled
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PaymentRequest payload = new PaymentRequest();

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

        request.setAttribute("merchantId", request.getParameter("merchantId"));
        request.setAttribute("productName", request.getParameter("productName"));
        request.setAttribute("amount", request.getParameter("amount"));
        request.setAttribute("productUrl", request.getParameter("productUrl"));
        request.setAttribute("customerName", request.getParameter("customerName"));
        request.setAttribute("addressLine1", payload.getAddressLine1() + ", " + payload.getAddressLine2());
        request.setAttribute("city", request.getParameter("city"));
        request.setAttribute("state", request.getParameter("state"));
        request.setAttribute("country", request.getParameter("country"));
        request.setAttribute("postalCode", request.getParameter("postalCode"));
        request.setAttribute("mobile", request.getParameter("mobile"));
        request.setAttribute("email", request.getParameter("email"));

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        throw new NotSupportedException("Method Not supported");
    }
}
