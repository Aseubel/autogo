package com.aseubel.autogo.service.impl;

import com.aseubel.autogo.dao.TypeMapper;
import com.aseubel.autogo.pojo.entity.Type;
import com.aseubel.autogo.service.ITypeService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Aseubel
 * @date 2025-03-06 00:50
 */
@Service
public class TypeService extends ServiceImpl<TypeMapper, Type> implements ITypeService {

    @Autowired
    private TypeMapper typeMapper;

    @Override
    public List<Type> listTypeByPageId(String pageId) {
        QueryWrapper<Type> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("page_id", pageId);
        return typeMapper.selectList(queryWrapper);
    }
}
