package com.atguigu.eduservice.client;

import com.atguigu.eduservice.client.impl.EduUcenterFeignClient;
import com.atguigu.eduservice.entity.UcenterMember;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "service-ucenter",fallback = EduUcenterFeignClient.class) //调用的服务名称
public interface EduUcenterClient {

    //根据用户id查询用户信息
    @GetMapping("/educenter/member/getById/{id}")
    public UcenterMember getById(@PathVariable String id);
}
