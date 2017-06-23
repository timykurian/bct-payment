package com.bct.utils;

import java.math.BigDecimal;

/**
 * Created by timy on 5/26/17.
 */
public class NumberUtil {
    /**
     *
     * @param number
     * @return
     */
    public static Integer returnZeroIfNull(Integer number) {
        if (number != null) {
            return number;
        } else {
            return 0;
        }
    }

    /**
     *
     * @param numberStr
     * @return
     */
    public static BigDecimal returnZeroIfNull(String numberStr) {
        BigDecimal bigDecimal = new BigDecimal(0);
        if (numberStr != null) {
            return new BigDecimal(numberStr);
        } else {
            return bigDecimal;
        }
    }

    /**
     *
     * @param numberStr
     * @return
     */
    public static int returnZeroIntIfNull(String numberStr) {
        if (numberStr != null) {
            return Integer.parseInt(numberStr);
        } else {
            return 0;
        }
    }
}
