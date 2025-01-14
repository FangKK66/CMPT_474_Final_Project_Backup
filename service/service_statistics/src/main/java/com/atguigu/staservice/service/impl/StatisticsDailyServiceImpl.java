package com.atguigu.staservice.service.impl;

import com.atguigu.commonutils.result.ResultCode;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.atguigu.staservice.client.StaClient;
import com.atguigu.staservice.entity.StatisticsDaily;
import com.atguigu.staservice.mapper.StatisticsDailyMapper;
import com.atguigu.staservice.service.StatisticsDailyService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 网站统计日数据 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2022-12-15
 */
@Service
public class StatisticsDailyServiceImpl extends ServiceImpl<StatisticsDailyMapper, StatisticsDaily> implements StatisticsDailyService {

    @Autowired
    private StaClient staClient;

    @Override
    public void registerCount(String day) {
        //第一种方案：1.添加记录前查询是否有相同记录的数据，如果有则需改为最新数据，没有则直接添加
        //第二种方案 2.先删除后添加
        QueryWrapper<StatisticsDaily> wrapper = new QueryWrapper<>();
        wrapper.eq("date_calculated", day);
        baseMapper.delete(wrapper);

        Integer registerNum = (Integer) staClient.countRegister(day).getData().get("countRegister");

        StatisticsDaily statisticsDaily = new StatisticsDaily();
        statisticsDaily.setDateCalculated(day);
        statisticsDaily.setRegisterNum(registerNum);
        //登录人数、每日播放视频数、每日新增课程数全部用随机数模拟
        statisticsDaily.setLoginNum(RandomUtils.nextInt(100, 200));
        statisticsDaily.setVideoViewNum(RandomUtils.nextInt(100, 200));
        statisticsDaily.setCourseNum(RandomUtils.nextInt(100, 200));
        baseMapper.insert(statisticsDaily);
    }

    @Override
    public Map<String, Object> getShowData(String type, String begin, String end) {
        if (StringUtils.isEmpty(type)) throw new GuliException(ResultCode.ERROR, "查询类型不能为空！");
        if (StringUtils.isEmpty(begin)) throw new GuliException(ResultCode.ERROR, "查询开始日期不能为空！");
        if (StringUtils.isEmpty(end)) throw new GuliException(ResultCode.ERROR, "查询结束日期不能为空！");
        QueryWrapper<StatisticsDaily> wrapper = new QueryWrapper<>();
        wrapper.select("date_calculated", type);
        wrapper.between("date_calculated", begin, end);
        List<StatisticsDaily> list = baseMapper.selectList(wrapper);
        if (list == null || list.size() == 0) return null;
        //因为返回有两部分数据：日期 和 数量
        //前端要求数组json结构，对应后端java代码是list集合
        //创建两个list集合，一个日期list，一个数量list

        //实现方式一 两次流，一次判断 stream switch stream
       /* List<String> dayList = list.stream().map(StatisticsDaily::getDateCalculated).collect(Collectors.toList());
        List<Integer> numList = null;
        switch (type) {
            case "login_num":
                numList = list.stream().map(StatisticsDaily::getLoginNum).collect(Collectors.toList());
                break;
            case "register_num":
                numList = list.stream().map(StatisticsDaily::getRegisterNum).collect(Collectors.toList());
                break;
            case "video_view_num":
                numList = list.stream().map(StatisticsDaily::getVideoViewNum).collect(Collectors.toList());
                break;
            case "course_num":
                numList = list.stream().map(StatisticsDaily::getCourseNum).collect(Collectors.toList());
                break;
            default:
                break;
        }*/

        //实现方式二 一次循环多次判断 for switch
        /*List<String> date_calculatedList = new ArrayList<>();
        List<Integer> numDataList = new ArrayList<>();
        for (StatisticsDaily daily : list) {
            //封装日期list集合
            date_calculatedList.add(daily.getDateCalculated());
            //封装对应数量
            switch (type) {
                case "login_num":
                    numDataList.add(daily.getLoginNum());
                    break;
                case "register_num":
                    numDataList.add(daily.getRegisterNum());
                    break;
                case "video_view_num":
                    numDataList.add(daily.getVideoViewNum());
                    break;
                case "course_num":
                    numDataList.add(daily.getCourseNum());
                    break;
                default:
                    break;
            }
        }*/

        //实现方式三 一次循环，通过反射，有难度
        List<String> dayList = new ArrayList<>();
        // 根据参数类型取出相应的数值
        List<Integer> numList = new ArrayList<>();
        try {
            String methodName = getMethodName("_", type);
            for (StatisticsDaily daily : list) {
                dayList.add(daily.getDateCalculated());

                Method method = daily.getClass().getMethod(methodName, null);
                Integer num = (Integer) method.invoke(daily, null);
                numList.add(num == null ? 0 : num);
            }
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

        //把封装之后两个list集合放到map集合，进行返回
        Map<String, Object> map = new HashMap<>();
        map.put("date_calculatedList", dayList);
        map.put("numDataList", numList);
        return map;
    }

    private static String getMethodName(String split, String str) {
        //按 _ 分隔成新数组
        String[] arr = str.split(split);
        StringBuffer strBuffer = new StringBuffer();
        for (String value : arr) {
            // substring () 方法用于提取字符串中介于两个指定下标之间的字符
            //再加上首字母后面的字母 +split[i].substring(1);
            strBuffer.append(value.substring(0, 1).toUpperCase()).append(value.substring(1));
        }
        return "get"+strBuffer;

        /*int i = str.indexOf(split);
        str = "get" + str.substring(0, 1).toUpperCase() + str.substring(1, i) + str.substring(i + 1, i + 2).toUpperCase() + str.substring(i + 2);
        while (i != -1) {
            i = str.indexOf(split, i + 1);
            if (i != -1) str = str.substring(0, i) + str.substring(i + 1, i + 2).toUpperCase() + str.substring(i + 2);
        }
        return str;*/
    }

}
