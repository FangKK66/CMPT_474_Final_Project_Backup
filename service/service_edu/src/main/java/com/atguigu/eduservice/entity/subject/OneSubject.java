package com.atguigu.eduservice.entity.subject;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

//一级分类
@Data
@NoArgsConstructor
public class OneSubject {
    private String id;
    private String title;

    //一个一级分类有多个二级分类
    private List<TwoSubject> children = new ArrayList<>();
}
