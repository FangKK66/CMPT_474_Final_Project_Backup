package com.atguigu.eduorder.mapper;

import com.atguigu.eduorder.entity.Order;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 订单 Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2022-12-14
 */
public interface OrderMapper extends BaseMapper<Order> {

    int updateStatus(String orderNo);
}
