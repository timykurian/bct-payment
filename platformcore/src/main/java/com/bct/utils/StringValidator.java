package com.bct.utils;

/**
 * Created by timy on 5/26/17.
 */
public class StringValidator {
    /**
     *
     * @param str
     * @return
     */
    public static boolean isNotNullOrEmpty(String str) {
        if (str != null && str.trim().equalsIgnoreCase("")) {
            return true;
        } else {
            return false;
        }
    }
}
