package com.atguigu.eduservice.mapper;

import com.atguigu.eduservice.entity.EduSubject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 课程科目 Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2022-11-26
 */
public interface EduSubjectMapper extends BaseMapper<EduSubject> {

    String selectParentIdById(String subjectId);
}
