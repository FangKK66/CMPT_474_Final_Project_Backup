package com.atguigu.eduorder.client;

import com.atguigu.commonutils.vo.CourseWebVo;
import com.atguigu.eduorder.client.impl.OrderCourseFeignClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "service-edu",fallback = OrderCourseFeignClient.class) //调用的服务名称
public interface OrderCourseClient {
    //创建订单查询课程详情的方法
    @GetMapping("/eduservice/coursefront/getCourseInfo/{id}")
    public CourseWebVo getCourseInfo(@PathVariable String id);
}
