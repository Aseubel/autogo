package com.aseubel.autogo.service.impl;

import com.aseubel.autogo.dao.MemberMapper;
import com.aseubel.autogo.pojo.entity.Member;
import com.aseubel.autogo.service.IMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author aseubel
 * @date 2024/12/17
 */
@Service
public class MemberService extends ServiceImpl<MemberMapper, Member> implements IMemberService {
}
