package com.aseubel.autogo.service;

import com.aseubel.autogo.pojo.entity.Device;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author aseubel
 * @description 机器设备服务接口
 * @date 2024/12/17
 */
public interface IDeviceService extends IService<Device> {

    /**
     * 根据类型ID查询设备列表
     * @param typeId
     * @return
     */
    List<Device> listDeviceByTypeId(String typeId);
}
