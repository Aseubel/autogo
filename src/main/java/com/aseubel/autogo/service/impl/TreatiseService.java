package com.aseubel.autogo.service.impl;

import com.aseubel.autogo.dao.TreatiseMapper;
import com.aseubel.autogo.pojo.entity.Treatise;
import com.aseubel.autogo.service.ITreatiseService;
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
public class TreatiseService extends ServiceImpl<TreatiseMapper, Treatise> implements ITreatiseService {

    @Autowired
    private TreatiseMapper treatiseMapper;

    @Override
    public List<Treatise> listTreatiseByTypeId(String typeId) {
        QueryWrapper<Treatise> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type_id", typeId);
        return treatiseMapper.selectList(queryWrapper);
    }
}
