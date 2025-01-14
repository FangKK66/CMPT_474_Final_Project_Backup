package com.atguigu.msmservice.controller;

import com.atguigu.commonutils.result.R;
import com.atguigu.commonutils.result.ResultCode;
import com.atguigu.msmservice.client.MsmUcenterClient;
import com.atguigu.msmservice.utils.RandomUtil;
import com.atguigu.msmservice.utils.RegexValidateUtil;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.TimeUnit;

@Api(tags = "发送短信接口")
@RestController
@RequestMapping("/edumsm/msm")
public class MsmController {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;
    @Autowired
    private MsmUcenterClient ucenterClient;

    //发送短信的方法
    @GetMapping("send/{phone}")
    public R sendMsm(@PathVariable String phone) {
        //判断用户名是否存在
        if (!RegexValidateUtil.checkMobile(phone)) throw new  GuliException(ResultCode.ERROR,"手机号格式错误！");
        if (ucenterClient.checkMobile(phone)) throw new  GuliException(ResultCode.ERROR,"手机号已被注册！");

        //1 从redis获取验证码，如果获取到直接返回
        String key = "send:code:" + phone;
        String code = redisTemplate.opsForValue().get(key);
        if (!StringUtils.isEmpty(code)) {
            return R.ok().data("code",code);
        }
        //2 如果redis获取不到 生成随机值
        code = RandomUtil.getSixBitRandom();
        //发送成功，把发送成功验证码放到redis里面并设置有效时间
        redisTemplate.opsForValue().set(key, code, 5, TimeUnit.MINUTES);
        return R.ok().data("code",code);
    }

}
