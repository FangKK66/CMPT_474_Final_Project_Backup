package com.atguigu.educenter.controller;


import com.atguigu.commonutils.result.R;
import com.atguigu.commonutils.result.ResultCode;
import com.atguigu.commonutils.utils.JwtUtil;
import com.atguigu.commonutils.utils.ValidateUtil;
import com.atguigu.commonutils.vo.UcenterMember;
import com.atguigu.educenter.entity.vo.LoginVO;
import com.atguigu.educenter.entity.vo.RegisterVo;
import com.atguigu.educenter.service.UcenterMemberService;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * <p>
 * 会员表 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2022-12-12
 */
@Api(tags = "登录注册接口")
@RestController
@RequestMapping("/educenter/member")
public class UcenterMemberController {

    @Autowired
    private UcenterMemberService memberService;

    //登录
    @PostMapping("login")
    public R loginUser(@Valid @RequestBody LoginVO loginVO, BindingResult bindingResult) {
        //member对象封装手机号和密码
        //调用service方法实现登录
        //返回token值，使用jwt生成
        R result = ValidateUtil.valid(bindingResult);
        if (result != null) return result;
        String token = memberService.login(loginVO);
        return R.ok().data("token", token);
    }

    //注册
    @PostMapping("register")
    public R registerUser(@Valid @RequestBody RegisterVo registerVo, BindingResult bindingResult) {
        R result = ValidateUtil.valid(bindingResult);
        if (result != null) return result;
        memberService.register(registerVo);
        return R.ok();
    }

    //根据token获取用户信息
    @GetMapping("getMemberInfo")
    public R getMemberInfo(HttpServletRequest request) {
        //调用jwt工具类的方法。根据request对象获取头信息，返回用户id
        String memberId = JwtUtil.getMemberIdByJwtToken(request);
        if ("".equals(memberId)) throw new GuliException(ResultCode.ERROR,"无效的token！");
        UcenterMember member = memberService.getById(memberId);
        //查询数据库根据用户id获取用户信息
        if (member==null) throw new GuliException(ResultCode.ERROR,"用户不存在！");
        return R.ok().data("userInfo", member);
    }

    @GetMapping("getMemberByMobile/{mobile}")
    public boolean checkMobile(@PathVariable String mobile) {
        QueryWrapper<UcenterMember> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile", mobile);
        return memberService.count(wrapper) > 0;
    }

    //根据id查询用户信息
    @GetMapping("getById/{id}")
    public UcenterMember getById(@PathVariable String id){
        return memberService.getById(id);
    }

    //查询某一天注册人数
    @GetMapping("countRegister/{day}")
    public R countRegister(@PathVariable String day) {
        Integer count = memberService.countRegisterDay(day);
        return R.ok().data("countRegister",count);
    }

}

