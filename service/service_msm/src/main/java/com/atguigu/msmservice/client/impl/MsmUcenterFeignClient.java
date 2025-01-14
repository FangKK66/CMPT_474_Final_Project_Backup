package com.atguigu.msmservice.client.impl;

import com.atguigu.commonutils.result.ResultCode;
import com.atguigu.msmservice.client.MsmUcenterClient;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import org.springframework.stereotype.Component;

@Component
public class MsmUcenterFeignClient implements MsmUcenterClient {
    @Override
    public boolean checkMobile(String mobile) {
        throw new GuliException(ResultCode.ERROR,"服务器维护中请稍后重试。。。");
    }
}
