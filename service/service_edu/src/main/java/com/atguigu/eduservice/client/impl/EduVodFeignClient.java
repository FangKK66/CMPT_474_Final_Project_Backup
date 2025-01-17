package com.atguigu.eduservice.client.impl;

import com.atguigu.commonutils.result.R;
import com.atguigu.eduservice.client.EduVodClient;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class EduVodFeignClient implements EduVodClient {
   //出错之后会执行
    @Override
    public R removeAlyVideo(String id) {
        return R.error().message("删除视频出错了");
    }

    @Override
    public R deleteBatch(List<String> videoIdList) {
        return R.error().message("删除多个视频出错了");
    }
}
