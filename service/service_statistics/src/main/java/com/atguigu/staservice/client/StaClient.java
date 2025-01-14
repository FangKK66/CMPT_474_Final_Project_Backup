package com.atguigu.staservice.client;

import com.atguigu.commonutils.result.R;
import com.atguigu.staservice.client.impl.StaFeignClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "service-ucenter",fallback = StaFeignClient.class) //调用的服务名称
public interface StaClient {
    //查询某一天注册人数
    @GetMapping("/educenter/member/countRegister/{day}")
    public R countRegister(@PathVariable String day);
}
