package com.atguigu.commonutils.utils;

import com.atguigu.commonutils.result.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class ValidateUtil {
    public static R valid(BindingResult bindingResult) {
        //定义一个map集合存放所有的错误信息
        Map<String, Object> map;
        StringBuffer msg;
        if (bindingResult.hasErrors()) {
            map = new HashMap<>();
            msg = new StringBuffer();
            //拿到所有的错误信息
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                log.error("错误字段：" + fieldError.getField());
                log.error("错误信息：" + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
                msg.append(fieldError.getDefaultMessage());
            }
            return R.error().data(map).message(msg.toString());
        }
        return null;
    }
}
