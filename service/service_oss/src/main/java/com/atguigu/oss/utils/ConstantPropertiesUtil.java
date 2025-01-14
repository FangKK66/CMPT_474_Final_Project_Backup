package com.atguigu.oss.utils;

import lombok.Data;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

//当项目已启动，spring接口，spring加载之后，执行接口一个方法
@Data
@Component
@ConfigurationProperties(prefix = "aliyun.oss")
public class ConstantPropertiesUtil implements InitializingBean {

    //读取配置文件内容
    private String endpoint;
    private String keyId;
    private String keySecret;
    private String bucketName;

    //定义公开静态常量
    public static String END_POIND;
    public static String ACCESS_KEY_ID;
    public static String ACCESS_KEY_SECRET;
    public static String BUCKET_NAME;

    @Override
    public void afterPropertiesSet() throws Exception {
        END_POIND = endpoint;
        ACCESS_KEY_ID = keyId;
        ACCESS_KEY_SECRET = keySecret;
        BUCKET_NAME = bucketName;
    }
}
