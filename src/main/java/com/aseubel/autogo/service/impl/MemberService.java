package com.aseubel.autogo.service.impl;

import com.aseubel.autogo.dao.MemberMapper;
import com.aseubel.autogo.pojo.entity.Member;
import com.aseubel.autogo.service.IMemberService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author aseubel
 * @date 2024/12/17
 */
@Service
public class MemberService extends ServiceImpl<MemberMapper, Member> implements IMemberService {

    @Autowired
    private MemberMapper memberMapper;

//    @Override
//    public Member getMemberByMemberId(String memberId) {
//        QueryWrapper<Member> queryWrapper = new QueryWrapper<>();
//        queryWrapper.eq("member_id", memberId);
//        return memberMapper.selectOne(queryWrapper);
//    }

    @Override
    public List<Member> listMemberByTypeId(String typeId) {
        QueryWrapper<Member> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type_id", typeId);
        return memberMapper.selectList(queryWrapper);
    }
}
