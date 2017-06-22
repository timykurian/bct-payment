package com.bct.core;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.TimeZone;

/**
 * Created by timy on 5/29/17.
 */
public class ActivityInterceptor implements MethodInterceptor {

    Logger logger = LoggerFactory.getLogger(ActivityInterceptor.class);

    public Object invoke(MethodInvocation invocation) throws Throwable {
        System.out.println("Before: invocation=[" + invocation + "]");

        DateFormat dateFormat;
        dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setTimeZone(TimeZone.getTimeZone("UTC")); //get utc time

        Calendar cal = Calendar.getInstance();
        StopWatch sw = new StopWatch();
        String responseCode = "SUC";
        //start clock
        sw.start();

        Object rval = null;
        try {
            rval = invocation.proceed();
            sw.stop();
        } catch (Exception e) {
            sw.stop();
            responseCode = "ERR";
            throw e;
        } finally {
            String dateString = dateFormat.format(cal.getTime());
            String type = invocation.getMethod().getName();
            String request = "null";
            String elapsedTime = Long.toString(sw.getTotalTimeMillis());
            logger.info(dateString + "|" +
                    type + "|" +
                    elapsedTime + "|" +
                    Arrays.toString(invocation.getArguments()));

            System.out.println("Invocation returned");

        }
        return rval;
    }

}
