package com.atguigu.eduservice.controller.front;

import com.atguigu.commonutils.result.R;
import com.atguigu.eduservice.entity.EduCourse;
import com.atguigu.eduservice.entity.EduTeacher;
import com.atguigu.eduservice.service.EduCourseService;
import com.atguigu.eduservice.service.EduTeacherService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "前台教师显示接口")
@RestController
@RequestMapping("/eduservice/teacherfront")
public class TeacherFrontController {

    @Autowired
    private EduTeacherService teacherService;
    @Autowired
    private EduCourseService courseService;

    //1 分页查询讲师的方法
    @GetMapping("getTeacherFrontList/{page}/{limit}")
    public R getTeacherFrontList(@PathVariable long page, @PathVariable long limit) {
        // 这里一定要用page对象，不能用接口Ipage，否则没有hasNext和hasPrevious属性
        Page<EduTeacher> iPage = new Page<>(page, limit);
        QueryWrapper<EduTeacher> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("gmt_create");
        IPage<EduTeacher> result = teacherService.page(iPage, wrapper);
        boolean hasNext = iPage.hasNext();//下一页
        boolean hasPrevious = iPage.hasPrevious();//上一页
        return R.ok().data("result", result).data("hasNext",hasNext).data("hasPrevious",hasPrevious);
    }

    //2 讲师详情的功能
    @GetMapping("getTeacherFrontInfo/{id}")
    public R getTeacherFrontInfo(@PathVariable String id) {
        //1 根据讲师id查询讲师基本信息
        EduTeacher teacher = teacherService.getById(id);
        //2 根据讲师id查询所讲课程
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        wrapper.eq("teacher_id", id);
        List<EduCourse> courseList = courseService.list(wrapper);
        return R.ok().data("teacher", teacher).data("courseList", courseList);
    }

}
