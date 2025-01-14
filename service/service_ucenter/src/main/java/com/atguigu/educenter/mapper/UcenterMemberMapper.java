package com.atguigu.educenter.mapper;

import com.atguigu.commonutils.vo.UcenterMember;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 会员表 Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2022-12-12
 */
public interface UcenterMemberMapper extends BaseMapper<UcenterMember> {

    int countRegisterDay(String day);
}
