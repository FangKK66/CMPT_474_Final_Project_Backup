package com.atguigu.vod.utils;

import lombok.Data;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "aliyun.vod.file")
public class ConstantVodUtil implements InitializingBean {

    private String keyid;
    private String keysecret;
    private String keyurl;

    public static String ACCESS_KEY_SECRET;
    public static String ACCESS_KEY_ID;
    public static String ACCESS_KEY_URL;

    @Override
    public void afterPropertiesSet() throws Exception {
        ACCESS_KEY_ID = keyid;
        ACCESS_KEY_SECRET = keysecret;
        ACCESS_KEY_URL = keyurl;
    }
}
