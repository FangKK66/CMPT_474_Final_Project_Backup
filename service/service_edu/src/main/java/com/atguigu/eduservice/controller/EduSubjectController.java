package com.atguigu.eduservice.controller;


import com.atguigu.commonutils.result.R;
import com.atguigu.eduservice.entity.subject.OneSubject;
import com.atguigu.eduservice.entity.subject.SubjectVO;
import com.atguigu.eduservice.service.EduSubjectService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 课程科目 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2020-02-29
 */
@Api(tags = "课程分类管理")
@RestController
@RequestMapping("/eduservice/subject")
public class EduSubjectController {

    @Autowired
    private EduSubjectService subjectService;

    //添加课程分类
    //获取上传过来文件，把文件内容读取出来
    @PostMapping("addSubject")
    public R addSubject(MultipartFile file) {
        //上传过来excel文件
       subjectService.saveSubject(file, subjectService);
        return R.ok();
    }

    //课程分类列表（树形 循环）
    @GetMapping("getAllSubject")
    public R getAllSubject() {
        //list集合泛型是一级分类
        List<OneSubject> list = subjectService.getAllOneTwoSubject();
        return R.ok().data("list",list);
    }

    //课程分类列表（树形  递归）
    @GetMapping("getAllSubject2")
    public R getAllSubject2() {
        //list集合泛型是一级分类
        List<SubjectVO> list = subjectService.getAllOneTwoSubject2();
        return R.ok().data("list",list);
    }

}

