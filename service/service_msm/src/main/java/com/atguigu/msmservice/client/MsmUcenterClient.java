package com.atguigu.msmservice.client;

import com.atguigu.msmservice.client.impl.MsmUcenterFeignClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "service-ucenter",fallback = MsmUcenterFeignClient.class)
public interface MsmUcenterClient {
    @GetMapping("/educenter/member/getMemberByMobile/{mobile}")
    public boolean checkMobile(@PathVariable("mobile") String mobile);
}
