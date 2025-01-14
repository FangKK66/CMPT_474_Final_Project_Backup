package com.atguigu.eduservice.client;

import com.atguigu.eduservice.client.impl.EduOrderFeignClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "service-order",fallback = EduOrderFeignClient.class) //调用的服务名称
public interface EduOrderClient {
    //根据课程id和用户id查询订单表中订单状态
    @GetMapping("/eduorder/order/isBuyCourse/{courseId}/{memberId}")
    public boolean isBuyCourse(@PathVariable String courseId, @PathVariable String memberId);
}
