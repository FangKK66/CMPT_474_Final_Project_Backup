package com.atguigu.eduservice.controller.front;

import com.atguigu.commonutils.result.R;
import com.atguigu.commonutils.result.ResultCode;
import com.atguigu.commonutils.utils.JwtUtil;
import com.atguigu.eduservice.client.EduOrderClient;
import com.atguigu.eduservice.entity.EduCourse;
import com.atguigu.eduservice.entity.chapter.ChapterVo;
import com.atguigu.eduservice.entity.frontvo.CourseFrontVo;
import com.atguigu.commonutils.vo.CourseWebVo;
import com.atguigu.eduservice.service.EduChapterService;
import com.atguigu.eduservice.service.EduCourseService;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2020-03-02
 */
@Api(tags = "前台课程显示接口")
@RestController
@RequestMapping("/eduservice/coursefront")
public class CourseFrontController {

    @Autowired
    private EduCourseService courseService;
    @Autowired
    private EduChapterService chapterService;
    @Autowired
    private EduOrderClient orderClient;

    //1 条件查询带分页查询课程
    @GetMapping("getFrontCourseList/{current}/{limit}")
    public R getCourseList(@PathVariable long current, @PathVariable long limit,
                           CourseFrontVo courseFrontVo) {
        Page<EduCourse> page = new Page<>(current, limit);
        Map<String, Object> map = courseService.getCourseFrontList(page,courseFrontVo);
        return R.ok().data(map);
    }

    //2 课程详情的方法
    @GetMapping("getFrontCourseInfo/{id}")
    public R getFrontCourseInfo(@PathVariable String id, HttpServletRequest request) {
        //根据课程id，编写sql语句查询课程信息
        CourseWebVo courseWebVo = courseService.getBaseCourseInfo(id);
        //根据课程id查询章节和小节
        List<ChapterVo> chapterVideoList = chapterService.getChapterVideoByCourseId(id);
        //根据课程id和用户id查询课程是否已被购买过
        String memberId = JwtUtil.getMemberIdByJwtToken(request);
        if (StringUtils.isEmpty(memberId)) throw new GuliException(28004, "用户未登录！");
        boolean flag = orderClient.isBuyCourse(id, memberId);
        return R.ok().data("courseWebVo",courseWebVo).data("chapterVideoList",chapterVideoList).data("isBuy",flag);
    }

    //创建订单查询课程详情的方法
    @GetMapping("getCourseInfo/{id}")
    public CourseWebVo getCourseInfo(@PathVariable String id) {
        //根据课程id，编写sql语句查询课程信息
        return courseService.getBaseCourseInfo(id);
    }

}

