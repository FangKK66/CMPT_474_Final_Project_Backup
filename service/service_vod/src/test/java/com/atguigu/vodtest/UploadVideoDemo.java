package com.atguigu.vodtest;

import com.alibaba.fastjson.JSONObject;
import com.aliyun.vod.upload.impl.UploadAttachedMediaImpl;
import com.aliyun.vod.upload.impl.UploadImageImpl;
import com.aliyun.vod.upload.impl.UploadM3u8FileImpl;
import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.*;
import com.aliyun.vod.upload.resp.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class UploadVideoDemo {
    //账号AK信息请填写(必选)
    private static final String accessKeyId = "LTAI5tBTyKujFy45ZSDoh6Rd";
    //账号AK信息请填写(必选)
    private static final String accessKeySecret = "HR7NAcFFJ5Jla1oqDKaAkw7VqgA2t3";

    public static void main(String[] args) {
        String title = "测试标题";
        String fileName = "C:\\Users\\12965\\Desktop\\谷粒学院\\资料\\1-阿里云上传测试视频\\6 - What If I Want to Move Faster.mp4";
        InputStream inputStream = null;
        try {
            inputStream = new FileInputStream(fileName);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        testUploadStream(accessKeyId, accessKeySecret, title, fileName, inputStream);
    }

    // 流式上传接口
    private static void testUploadStream(String accessKeyId, String accessKeySecret, String title, String fileName, InputStream inputStream) {
        UploadStreamRequest request = new UploadStreamRequest(accessKeyId, accessKeySecret, title, fileName, inputStream);
        request.setStorageLocation("outin-b43d9e186f0511edab9200163e041a73.oss-cn-shenzhen.aliyuncs.com");
        request.setApiRegionId("cn-shenzhen");
        UploadVideoImpl uploader = new UploadVideoImpl();
        UploadStreamResponse response = uploader.uploadStream(request);
        System.out.print("RequestId=" + response.getRequestId() + "\n");  //请求视频点播服务的请求ID
        if (response.isSuccess()) {
            System.out.print("VideoId=" + response.getVideoId() + "\n");
        } else { //如果设置回调URL无效，不影响视频上传，可以返回VideoId同时会返回错误码。其他情况上传失败时，VideoId为空，此时需要根据返回错误码分析具体错误原因
            System.out.print("VideoId=" + response.getVideoId() + "\n");
            System.out.print("ErrorCode=" + response.getCode() + "\n");
            System.out.print("ErrorMessage=" + response.getMessage() + "\n");
        }
    }

}
