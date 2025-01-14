package com.atguigu.eduservice.entity.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

@Data
public class SubjectData {
    /*指定当前字段对应excel中的那一列。可以根据名字或者Index去匹配。
    当然也可以不写，默认第一个字段就是index=0，以此类推。
    千万注意，要么全部不写，要么全部用index，要么全部用名字去匹配。
    千万别三个混着用，除非你非常了解源代码中三个混着用怎么去排序的。*/

    @ExcelProperty(index = 0)
    private String oneSubjectName;
    @ExcelProperty(index = 1)
    private String twoSubjectName;
}
