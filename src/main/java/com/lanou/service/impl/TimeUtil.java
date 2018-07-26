package com.lanou.service.impl;

import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Nero on 18/7/18.
 */
@Component
public class TimeUtil {
    public static String getCurrentTime() {
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = f.format(date);
        Timestamp d = Timestamp.valueOf(format);
        return d.toString();
    }
}
