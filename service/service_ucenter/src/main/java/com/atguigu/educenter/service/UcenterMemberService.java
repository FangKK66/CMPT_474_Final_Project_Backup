package com.atguigu.educenter.service;

import com.atguigu.commonutils.vo.UcenterMember;
import com.atguigu.educenter.entity.vo.LoginVO;
import com.atguigu.educenter.entity.vo.RegisterVo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 会员表 服务类
 * </p>
 *
 * @author testjava
 * @since 2022-12-12
 */
public interface UcenterMemberService extends IService<UcenterMember> {

    String login(LoginVO loginVO);

    void register(RegisterVo registerVo);

    UcenterMember getOpenIdMember(String openid);

    Integer countRegisterDay(String day);
}
