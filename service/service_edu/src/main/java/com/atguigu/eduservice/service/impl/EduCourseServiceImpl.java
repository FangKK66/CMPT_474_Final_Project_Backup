package com.atguigu.eduservice.service.impl;

import com.atguigu.eduservice.client.EduVodClient;
import com.atguigu.eduservice.entity.EduChapter;
import com.atguigu.eduservice.entity.EduCourse;
import com.atguigu.eduservice.entity.EduCourseDescription;
import com.atguigu.eduservice.entity.EduVideo;
import com.atguigu.eduservice.entity.frontvo.CourseFrontVo;
import com.atguigu.commonutils.vo.CourseWebVo;
import com.atguigu.eduservice.entity.vo.CourseInfoVo;
import com.atguigu.eduservice.entity.vo.CoursePublishVo;
import com.atguigu.eduservice.mapper.EduChapterMapper;
import com.atguigu.eduservice.mapper.EduCourseDescriptionMapper;
import com.atguigu.eduservice.mapper.EduCourseMapper;
import com.atguigu.eduservice.mapper.EduVideoMapper;
import com.atguigu.eduservice.service.EduCourseService;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-03-02
 */
@Service
public class EduCourseServiceImpl extends ServiceImpl<EduCourseMapper, EduCourse> implements EduCourseService {

    //课程描述注入
    @Autowired
    private EduCourseDescriptionMapper eduCourseDescriptionMapper;
    @Autowired
    private EduChapterMapper eduChapterMapper;
    @Autowired
    private EduVideoMapper eduVideoMapper;
    @Autowired
    private EduVodClient vodClient;


    //根据课程id查询课程基本信息
    @Override
    public CourseInfoVo getCourseInfo(String courseId) {
        //1 查询课程表
        EduCourse eduCourse = baseMapper.selectById(courseId);
        CourseInfoVo courseInfoVo = new CourseInfoVo();
        BeanUtils.copyProperties(eduCourse, courseInfoVo);

        //2 查询描述表
        EduCourseDescription courseDescription = eduCourseDescriptionMapper.selectById(courseId);
        courseInfoVo.setDescription(courseDescription.getDescription());

        return courseInfoVo;
    }

    //修改课程信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateCourseInfo(CourseInfoVo courseInfoVo) {
        //1 修改课程表
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo, eduCourse);
        int update = baseMapper.updateById(eduCourse);
        if (update == 0) throw new GuliException(20001, "修改课程信息失败");

        //2 修改描述表
        EduCourseDescription description = new EduCourseDescription();
        description.setId(courseInfoVo.getId());
        description.setDescription(courseInfoVo.getDescription());
        eduCourseDescriptionMapper.updateById(description);
    }

    //根据课程id查询课程确认信息
    @Override
    public CoursePublishVo publishCourseInfo(String id) {
        //调用mapper
        return baseMapper.getPublishCourseInfo(id);
    }

    //删除课程信息的方法
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void removeCourse(String courseId) {
        //1、删除描述
        eduCourseDescriptionMapper.deleteById(courseId);

        //2、删除小节和视频
        QueryWrapper<EduVideo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("course_id", courseId);
        List<EduVideo> videoList = eduVideoMapper.selectList(queryWrapper);
        if (videoList.size() > 0) {
            List<String> videoIds = videoList.stream().map(EduVideo::getId).collect(Collectors.toList());
            List<String> videoSourceIds = videoList.stream().map(EduVideo::getVideoSourceId).collect(Collectors.toList());
            if (videoIds.size() > 0) {
                eduVideoMapper.deleteBatchIds(videoIds);
                if (videoSourceIds.size() > 0) {
                    vodClient.deleteBatch(videoSourceIds);
                }
            }
        }

        //3、删除章节
        QueryWrapper<EduChapter> wrapper = new QueryWrapper<EduChapter>().eq("course_id", courseId);
        List<String> chapterIds = eduChapterMapper.selectList(wrapper)
                .stream().map(EduChapter::getId).collect(Collectors.toList());
        if (chapterIds.size() > 0) {
            eduChapterMapper.deleteBatchIds(chapterIds);
        }

        //4、删除课程
        int result = baseMapper.deleteById(courseId);
        if (result == 0) throw new GuliException(20001, "删除失败！");
    }

    @Cacheable(value = "course", key = "'selectHostCourse'")
    @Override
    public List<EduCourse> selectHostCourse() {
        //查询前8条热门课程
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("id");
        wrapper.last("limit 8");
        return baseMapper.selectList(wrapper);
    }

    @Override
    public Map<String, Object> getCourseFrontList(Page<EduCourse> page, CourseFrontVo courseFrontVo) {
        IPage<EduCourse> result;
        if (courseFrontVo == null) {
            result = baseMapper.selectPage(page, null);
        } else {
            String title = courseFrontVo.getTitle();
            String teacherId = courseFrontVo.getTeacherId();
            String subjectId = courseFrontVo.getSubjectId();
            String subjectParentId = courseFrontVo.getSubjectParentId();
            String buyCountSort = courseFrontVo.getBuyCountSort();
            String gmtCreateSort = courseFrontVo.getGmtCreateSort();
            String priceSort = courseFrontVo.getPriceSort();
            QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
            wrapper.like(StringUtils.hasText(title), "title", title);
            wrapper.eq(StringUtils.hasText(teacherId), "teacher_id", teacherId);
            wrapper.eq(StringUtils.hasText(subjectId), "subject_id", subjectId);
            wrapper.eq(StringUtils.hasText(subjectParentId), "subject_parent_id", subjectParentId);
            wrapper.orderByDesc(StringUtils.hasText(buyCountSort), "buy_count");
            wrapper.orderByDesc(StringUtils.hasText(gmtCreateSort), "gmt_create");
            wrapper.orderByAsc(StringUtils.hasText(priceSort), "price");
            result = baseMapper.selectPage(page, wrapper);
        }
        List<EduCourse> records = result.getRecords();
        long current2 = result.getCurrent();
        long pages = result.getPages();
        long size = result.getSize();
        long total = result.getTotal();
        boolean hasNext = page.hasNext();//下一页
        boolean hasPrevious = page.hasPrevious();//上一页

        //把分页数据获取出来，放到map集合
        Map<String, Object> map = new HashMap<>();
        map.put("items", records);
        map.put("current", current2);
        map.put("pages", pages);
        map.put("size", size);
        map.put("total", total);
        map.put("hasNext", hasNext);
        map.put("hasPrevious", hasPrevious);
        //map返回
        return map;
    }

    //根据课程id，编写sql语句查询课程信息
    @Override
    public CourseWebVo getBaseCourseInfo(String courseId) {
        return baseMapper.getBaseCourseInfo(courseId);
    }

    //添加课程基本信息的方法
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String saveCourseInfo(CourseInfoVo courseInfoVo) {
        //1 向课程表添加课程基本信息
        //CourseInfoVo对象转换eduCourse对象
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo, eduCourse);
        int insert = baseMapper.insert(eduCourse);
        if (insert == 0) {
            //添加失败
            throw new GuliException(20001, "添加课程信息失败");
        }

        //获取添加之后课程id
        String cid = eduCourse.getId();

        //2 向课程简介表添加课程简介
        //edu_course_description
        EduCourseDescription courseDescription = new EduCourseDescription();
        courseDescription.setDescription(courseInfoVo.getDescription());
        //设置描述id就是课程id
        courseDescription.setId(cid);
        eduCourseDescriptionMapper.insert(courseDescription);

        return cid;
    }
}
