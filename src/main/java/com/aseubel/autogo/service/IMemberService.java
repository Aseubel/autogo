package com.aseubel.autogo.service;

import com.aseubel.autogo.pojo.entity.Member;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author aseuble
 * @description 团队成员服务接口
 * @date 2024/12/17
 */
public interface IMemberService extends IService<Member> {

//    Member getMemberByMemberId(String memberId);

    /**
     * 根据类型id查询团队成员列表
     * @param typeId
     * @return
     */
    List<Member> listMemberByTypeId(String typeId);

}
