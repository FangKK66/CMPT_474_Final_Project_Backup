package com.atguigu.eduservice.client.impl;

import com.atguigu.eduservice.client.EduUcenterClient;
import com.atguigu.eduservice.entity.UcenterMember;
import org.springframework.stereotype.Component;

@Component
public class EduUcenterFeignClient implements EduUcenterClient {
    @Override
    public UcenterMember getById(String id) {
        return null;
    }
}
