package com.atguigu.educenter.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
public class RegisterVo {
    @ApiModelProperty(value = "昵称")
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,12}$)|(^[\\u2E80-\\u9FFF]{2,5}$)"
            , message = "昵称必须为：2-5个中文或6-12个英文和数字组合！")
    private String nickname;

    @ApiModelProperty(value = "手机号")
    @Pattern(regexp = "^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\\d{8}$"
            , message = "请输入正确的手机号！")
    private String mobile;

    @ApiModelProperty(value = "密码")
    @Pattern(regexp = "^(?![a-zA-Z]+$)(?!\\d+$)(?![^\\da-zA-Z\\s]+$).{6,20}$"
            , message = "密码必须由6~20位的字母、数字、下划线组成！")
    private String password;

    @ApiModelProperty(value = "验证码")
    @NotBlank(message = "验证码不能为空！")
    private String code;
}
