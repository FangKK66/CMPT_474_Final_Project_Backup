package com.atguigu.eduorder.utils;

import lombok.Data;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

//当项目已启动，spring接口，spring加载之后，执行接口一个方法
@Data
@Component
@ConfigurationProperties(prefix = "weixin.pay")
public class ConstantPropertiesUtil implements InitializingBean {

    //读取配置文件内容
    private String appId;
    private String partner;
    private String partnerKey;
    private String notifyUrl;

    //定义公开静态常量
    public static String APP_ID;
    public static String PARTNER;
    public static String PARTNER_KEY;
    public static String NOTIFY_URL;

    @Override
    public void afterPropertiesSet() throws Exception {
        APP_ID = appId;
        PARTNER = partner;
        PARTNER_KEY = partnerKey;
        NOTIFY_URL = notifyUrl;
    }
}
