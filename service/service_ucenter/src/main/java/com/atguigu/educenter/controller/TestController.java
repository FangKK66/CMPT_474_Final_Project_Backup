package com.atguigu.educenter.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

// 使用该注解的类，会在接到SpringCloud配置中心配置刷新的时候，自动将新的配置更新到该类对应的字段中。
@RefreshScope
@RestController
public class TestController {

    @Value("${test.text}")
    private String text;

    @GetMapping("/test")
    public String from() {
        return this.text;
    }

}
