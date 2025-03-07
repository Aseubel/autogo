package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.Member;
import com.aseubel.autogo.pojo.entity.Type;
import com.aseubel.autogo.service.IMemberService;
import com.aseubel.autogo.service.ITypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * 团队成员相关接口
 * @author aseubel
 * @date 2024/12/17
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/member")
public class MemberController {

    @Autowired
    private IMemberService memberService;

    @Autowired
    private ITypeService typeService;

    /**
     * 查询团队成员列表
     */
    @GetMapping("/")
    public Response<List<Member>> listMemberByType(String typeId) {
        return Response.success(memberService.listMemberByTypeId(typeId));
    }

    /**
     * 查询团队成员信息
     */
    @GetMapping("/detail")
    public Response<Member> queryMember(String memberId) {
        return Response.success(memberService.getById(memberId));
    }

    /**
     * 更新团队成员信息
     */
    @PutMapping("/update")
    public Response updateMember(Member member) {
        return memberService.updateById(member) ? Response.success() : Response.fail("更新团队成员信息失败");
    }

    /**
     * 添加团队成员
     */
    @PostMapping("/")
    public Response addMember(Member member) {
        member.setMemberId(UUID.randomUUID().toString());
        return memberService.save(member) ? Response.success() : Response.fail("添加团队成员失败");
    }

    /**
     * 删除团队成员
     */
    @DeleteMapping("/")
    public Response deleteMember(String memberId) {
        return memberService.removeById(memberId) ? Response.success() : Response.fail("删除团队成员失败");
    }

    /**
     * 获取成员所有类型
     */
    @GetMapping("/type")
    public Response<List<Type>> getAllTypes(String pageId) {
        return Response.success(typeService.listTypeByPageId(pageId));
    }
}
