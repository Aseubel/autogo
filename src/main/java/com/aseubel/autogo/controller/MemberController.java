package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.Member;
import com.aseubel.autogo.service.IMemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

/**
 * @author aseubel
 * @description 团队成员接口
 * @date 2024/12/17
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/member")
public class MemberController {

    @Autowired
    private IMemberService memberService;

    @GetMapping("/")
    public Response<List<Member>> listMemberByType(String typeId) {
        return Response.success(memberService.listMemberByTypeId(typeId));
    }

    @GetMapping("/detail")
    public Response<Member> queryMember(String memberId) {
        return Response.success(memberService.getById(memberId));
    }

    @PutMapping("/update")
    public Response updateMember(Member member) {
        return memberService.updateById(member) ? Response.success() : Response.fail("更新团队成员信息失败");
    }

    @PostMapping("/")
    public Response addMember(Member member) {
        member.setMemberId(UUID.randomUUID().toString());
        return memberService.save(member) ? Response.success() : Response.fail("添加团队成员失败");
    }

    @DeleteMapping("/")
    public Response deleteMember(String memberId) {
        return memberService.removeById(memberId) ? Response.success() : Response.fail("删除团队成员失败");
    }
}
