package com.aseubel.autogo.controller;

import com.aseubel.autogo.common.Response;
import com.aseubel.autogo.pojo.entity.Member;
import com.aseubel.autogo.service.impl.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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
    private MemberService memberService;

    @GetMapping("/")
    public Response<List<Member>> listMemberByType() {
        return Response.success(memberService.list());
    }

    @GetMapping("/detail")
    public Response<Member> queryMember(String memberId) {
        return Response.success(memberService.getById(memberId));
    }
}
