package com.atguigu.staservice.client.impl;

import com.atguigu.commonutils.result.R;
import com.atguigu.commonutils.result.ResultCode;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.atguigu.staservice.client.StaClient;
import org.springframework.stereotype.Component;

@Component
public class StaFeignClient implements StaClient {
    @Override
    public R countRegister(String day) {
        throw new GuliException(ResultCode.ERROR,"系统繁忙请稍后重试。。。");
    }
}
