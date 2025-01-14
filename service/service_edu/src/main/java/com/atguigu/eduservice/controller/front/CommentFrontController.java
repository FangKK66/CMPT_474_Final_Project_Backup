package com.atguigu.eduservice.controller.front;


import com.atguigu.commonutils.result.R;
import com.atguigu.commonutils.result.ResultCode;
import com.atguigu.eduservice.client.EduUcenterClient;
import com.atguigu.eduservice.entity.EduComment;
import com.atguigu.eduservice.entity.UcenterMember;
import com.atguigu.eduservice.service.EduCommentService;
import com.atguigu.servicebase.exceptionhandler.GuliException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 评论 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2022-12-14
 */
@Api(tags = "评论功能接口")
@RestController
@RequestMapping("/eduservice/commentfront")
public class CommentFrontController {

    @Autowired
    private EduCommentService commentService;
    @Autowired
    private EduUcenterClient ucenterClient;

    @PostMapping("/addComment/{id}")
    public R addComment(@RequestBody EduComment eduComment) {
        UcenterMember member = ucenterClient.getById(eduComment.getMemberId());
        if (member == null) throw new GuliException(ResultCode.ERROR, "用户不存在！");
        eduComment.setNickname(member.getNickname());
        eduComment.setAvatar(member.getAvatar());
        commentService.save(eduComment);
        return R.ok();
    }

    //1 分页查询讲师的方法
    @GetMapping("getCommentFrontList/{page}/{limit}")
    public R getTeacherFrontList(@PathVariable long page, @PathVariable long limit) {
        // 这里一定要用page对象，不能用接口Ipage，否则没有hasNext和hasPrevious属性
        Page<EduComment> iPage = new Page<>(page, limit);
        QueryWrapper<EduComment> wrapper = new QueryWrapper<>();
        wrapper.orderByAsc("gmt_create");
        IPage<EduComment> result = commentService.page(iPage, wrapper);
        boolean hasNext = iPage.hasNext();//下一页
        boolean hasPrevious = iPage.hasPrevious();//上一页
        return R.ok().data("result", result).data("hasNext",hasNext).data("hasPrevious",hasPrevious);
    }

}

