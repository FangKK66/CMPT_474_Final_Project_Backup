package com.atguigu.educenter.service.impl;

import com.atguigu.commonutils.result.ResultCode;
import com.atguigu.commonutils.utils.JwtUtil;
import com.atguigu.commonutils.utils.MD5Util;
import com.atguigu.commonutils.vo.UcenterMember;
import com.atguigu.educenter.entity.vo.LoginVO;
import com.atguigu.educenter.entity.vo.RegisterVo;
import com.atguigu.educenter.mapper.UcenterMemberMapper;
import com.atguigu.educenter.service.UcenterMemberService;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 会员表 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2022-12-12
 */
@Service
public class UcenterMemberServiceImpl extends ServiceImpl<UcenterMemberMapper, UcenterMember> implements UcenterMemberService {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Override
    public String login(LoginVO loginVO) {
        String mobile = loginVO.getMobile();
        String password = MD5Util.encrypt(loginVO.getPassword());
        QueryWrapper<UcenterMember> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile", mobile);
        UcenterMember member = baseMapper.selectOne(wrapper);
        if (member == null) throw new GuliException(ResultCode.ERROR, "用户不存在！");
        wrapper.eq("password", password);
        member = baseMapper.selectOne(wrapper);
        if (member == null) throw new GuliException(ResultCode.ERROR, "密码错误！");
        wrapper.eq("is_disabled", 0);
        member = baseMapper.selectOne(wrapper);
        if (member == null) throw new GuliException(ResultCode.ERROR, "用户已被禁用！");
        return JwtUtil.getJwtToken(member.getId(), member.getNickname());
    }

    @Override
    public void register(RegisterVo registerVo) {
        //校验验证码
        String mobile = registerVo.getMobile();
        String key = "send:code:" + mobile;
        String code = redisTemplate.opsForValue().get(key);
        if (!registerVo.getCode().equals(code)) throw new GuliException(ResultCode.ERROR, "验证码错误！");
        //加密之后重新放进去
        String password = MD5Util.encrypt(registerVo.getPassword());
        registerVo.setPassword(password);
        UcenterMember member = new UcenterMember();
        BeanUtils.copyProperties(registerVo, member);
        baseMapper.insert(member);
    }

    @Override
    public UcenterMember getOpenIdMember(String openid) {
        QueryWrapper<UcenterMember> wrapper = new QueryWrapper<>();
        wrapper.eq("openid",openid);
        return baseMapper.selectOne(wrapper);
    }

    @Override
    public Integer countRegisterDay(String day) {
        return baseMapper.countRegisterDay(day);
    }
}
