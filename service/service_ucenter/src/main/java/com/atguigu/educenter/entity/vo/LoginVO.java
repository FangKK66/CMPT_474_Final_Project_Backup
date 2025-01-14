package com.atguigu.educenter.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.Pattern;

@Data
public class LoginVO {
    @ApiModelProperty(value = "手机号")
    @Pattern(regexp = "^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\\d{8}$"
            , message = "请输入正确的手机号！")
    private String mobile;

    @ApiModelProperty(value = "密码")
    @Pattern(regexp = "^(?![a-zA-Z]+$)(?!\\d+$)(?![^\\da-zA-Z\\s]+$).{6,20}$"
            , message = "密码必须为6~20位的字母、数字、下划线！")
    private String password;
}
