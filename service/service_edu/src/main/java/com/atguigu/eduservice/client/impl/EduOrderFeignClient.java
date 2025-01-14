package com.atguigu.eduservice.client.impl;

import com.atguigu.commonutils.result.ResultCode;
import com.atguigu.eduservice.client.EduOrderClient;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import org.springframework.stereotype.Component;

@Component
public class EduOrderFeignClient implements EduOrderClient {
    @Override
    public boolean isBuyCourse(String courseId, String memberId) {
        throw new GuliException(ResultCode.ERROR,"系统繁忙请稍后重试！");
    }
}
