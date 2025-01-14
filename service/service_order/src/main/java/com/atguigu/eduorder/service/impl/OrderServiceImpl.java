package com.atguigu.eduorder.service.impl;

import com.atguigu.commonutils.result.ResultCode;
import com.atguigu.commonutils.vo.CourseWebVo;
import com.atguigu.commonutils.vo.UcenterMember;
import com.atguigu.eduorder.client.OrderCourseClient;
import com.atguigu.eduorder.client.OrderUcenterClient;
import com.atguigu.eduorder.entity.Order;
import com.atguigu.eduorder.mapper.OrderMapper;
import com.atguigu.eduorder.service.OrderService;
import com.atguigu.eduorder.utils.OrderNoUtil;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2022-12-14
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    @Autowired
    private OrderCourseClient courseClient;
    @Autowired
    private OrderUcenterClient ucenterClient;

    @Override
    public String createOrder(String courseId, String memberId) {
        CourseWebVo course = courseClient.getCourseInfo(courseId);
        if (course == null) throw new GuliException(ResultCode.ERROR, "课程信息不能为空！");
        UcenterMember member = ucenterClient.getById(memberId);
        if (member == null) throw new GuliException(ResultCode.ERROR, "用户信息不能为空！");

        String id = OrderNoUtil.getId();
        Order order = new Order();    //因为支付的是别人的二维码，所以这里就不设置价钱，数据库默认0.01
        order.setOrderNo(id);
        order.setCourseId(courseId);
        order.setCourseTitle(course.getTitle());
        order.setCourseCover(course.getCover());
        order.setMemberId(memberId);
        order.setMobile(member.getMobile());
        order.setNickname(member.getNickname());
        order.setTeacherName(course.getTeacherName());
        baseMapper.insert(order);
        //返回订单号
        return id;
    }

    @Override
    public boolean updateStatus(String orderNo) {
        return baseMapper.updateStatus(orderNo) > 0;
    }
}
