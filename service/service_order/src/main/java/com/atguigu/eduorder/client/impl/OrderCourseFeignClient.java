package com.atguigu.eduorder.client.impl;

import com.atguigu.commonutils.vo.CourseWebVo;
import com.atguigu.eduorder.client.OrderCourseClient;
import org.springframework.stereotype.Component;

@Component
public class OrderCourseFeignClient implements OrderCourseClient {
    @Override
    public CourseWebVo getCourseInfo(String id) {
        return null;
    }
}
