package com.aseubel.autogo.service;

import com.aseubel.autogo.pojo.entity.Type;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author Aseubel
 * @date 2025-03-06 00:49
 */
public interface ITypeService extends IService<Type> {
    List<Type> listTypeByPageId(String pageId);
}
