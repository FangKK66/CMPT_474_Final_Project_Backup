package com.atguigu.eduorder.client.impl;

import com.atguigu.commonutils.vo.UcenterMember;
import com.atguigu.eduorder.client.OrderUcenterClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class OrderUcenterFeignClient implements OrderUcenterClient {

    @Override
    public UcenterMember getById(String id) {
        log.error("用户不存在！");
        return null;
    }
}
