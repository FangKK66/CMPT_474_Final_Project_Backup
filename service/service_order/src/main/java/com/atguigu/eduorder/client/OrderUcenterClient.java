package com.atguigu.eduorder.client;

import com.atguigu.commonutils.vo.UcenterMember;
import com.atguigu.eduorder.client.impl.OrderUcenterFeignClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "service-ucenter",fallback = OrderUcenterFeignClient.class) //调用的服务名称
public interface OrderUcenterClient {

    //根据用户id查询用户信息
    @GetMapping("/educenter/member/getById/{id}")
    public UcenterMember getById(@PathVariable String id);
}
