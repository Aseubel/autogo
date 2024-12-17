package com.aseubel.autogo.service;

import com.aseubel.autogo.pojo.entity.Research;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author aseuble
 * @description 研究服务接口
 * @date 2024/12/17
 */
public interface IResearchService extends IService<Research> {

    /**
     * 根据类型id查询研究列表
     * @param typeId
     * @return
     */
    List<Research> listResearchByTypeId(String typeId);

}
