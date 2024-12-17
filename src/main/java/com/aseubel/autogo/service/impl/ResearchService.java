package com.aseubel.autogo.service.impl;

import com.aseubel.autogo.dao.ResearchMapper;
import com.aseubel.autogo.pojo.entity.Research;
import com.aseubel.autogo.service.IResearchService;
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
public class ResearchService extends ServiceImpl<ResearchMapper, Research> implements IResearchService {

    @Autowired
    private ResearchMapper researchMapper;

    @Override
    public List<Research> listResearchByTypeId(String typeId) {
        QueryWrapper<Research> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type_id", typeId);
        return researchMapper.selectList(queryWrapper);
    }
}
