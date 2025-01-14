package com.atguigu.eduservice.service.impl;

import com.alibaba.excel.EasyExcel;
import com.atguigu.eduservice.entity.EduSubject;
import com.atguigu.eduservice.entity.excel.SubjectData;
import com.atguigu.eduservice.entity.subject.OneSubject;
import com.atguigu.eduservice.entity.subject.SubjectVO;
import com.atguigu.eduservice.entity.subject.TwoSubject;
import com.atguigu.eduservice.listener.SubjectExcelListener;
import com.atguigu.eduservice.mapper.EduSubjectMapper;
import com.atguigu.eduservice.service.EduSubjectService;
import com.atguigu.eduservice.utils.SubjectHelper;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 课程科目 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2022-11-26
 */
@Service
public class EduSubjectServiceImpl extends ServiceImpl<EduSubjectMapper, EduSubject> implements EduSubjectService {

    //添加课程分类
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveSubject(MultipartFile file, EduSubjectService subjectService) {
        try {
            //文件输入流
            InputStream in = file.getInputStream();
            //调用方法进行读取
            EasyExcel.read(in, SubjectData.class, new SubjectExcelListener(subjectService)).sheet().doRead();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GuliException(20001, "数据导入失败");
        }
    }

    @Override
    public List<SubjectVO> getAllOneTwoSubject2() {
        List<EduSubject> list = baseMapper.selectList(null);

        return SubjectHelper.buildTree(list);
    }

    @Override
    public List<OneSubject> getAllOneTwoSubject() {
        List<OneSubject> list = new ArrayList<>();
        //查出一级分类
        List<EduSubject> oneList =
                baseMapper.selectList(new QueryWrapper<EduSubject>().eq("parent_id", 0));
        //查出二级分类
        List<EduSubject> twoList =
                baseMapper.selectList(new QueryWrapper<EduSubject>().ge("parent_id", 1));
        for (EduSubject one : oneList) {
            OneSubject oneSubject = new OneSubject();
            BeanUtils.copyProperties(one,oneSubject);
            for (EduSubject two : twoList) {
                if (two.getParentId().equals(one.getId())){
                    TwoSubject twoSubject = new TwoSubject();
                    BeanUtils.copyProperties(two,twoSubject);
                    oneSubject.getChildren().add(twoSubject);
                }
            }
            list.add(oneSubject);
        }
        return list;
    }

}
