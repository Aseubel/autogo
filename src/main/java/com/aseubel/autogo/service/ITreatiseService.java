package com.aseubel.autogo.service;

import com.aseubel.autogo.pojo.entity.Treatise;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author aseuble
 * @description 论著服务接口
 * @date 2024/12/17
 */
public interface ITreatiseService extends IService<Treatise> {

    /**
     * 根据类型id查询论著列表
     * @param typeId
     * @return
     */
    List<Treatise> listTreatiseByTypeId(String typeId);

}
