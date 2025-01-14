package com.atguigu.eduservice.utils;

import com.atguigu.eduservice.entity.EduSubject;
import com.atguigu.eduservice.entity.subject.SubjectVO;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

public class SubjectHelper {
    //创建树形结构
    public static List<SubjectVO> buildTree(List<EduSubject> eduSubjectList) {
        //创建封装集合最终数据
        List<SubjectVO> trees = new ArrayList<>();
        //遍历所有菜单集合
        for (EduSubject eduSubject : eduSubjectList) {
            //找到递归入口 parentId=0
            if (eduSubject.getParentId().equals("0"))
                trees.add(findChildren(eduSubject, eduSubjectList));
        }
        return trees;
    }

    //从根节点进行递归查询，查询子节点
    //判断id、parentId是否相同，如果相同是子节点，进行数据封装
    private static SubjectVO findChildren(EduSubject eduSubject, List<EduSubject> eduSubjectList) {
        SubjectVO vo = new SubjectVO();
        BeanUtils.copyProperties(eduSubject, vo);
        for (EduSubject subject : eduSubjectList) {
            //获取当前课程分类id
            //获取所有课程分类parentId
            //比对
            if (eduSubject.getId().equals(subject.getParentId())) {
                SubjectVO vo2 = new SubjectVO();
                BeanUtils.copyProperties(subject, vo2);
                vo.getChildren().add(findChildren(subject,eduSubjectList));
            }
        }
        //递归查找
        return vo;
    }
}
