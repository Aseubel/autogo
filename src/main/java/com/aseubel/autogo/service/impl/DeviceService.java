package com.aseubel.autogo.service.impl;

import com.aseubel.autogo.dao.DeviceMapper;
import com.aseubel.autogo.pojo.entity.Device;
import com.aseubel.autogo.service.IDeviceService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * @author aseubel
 * @date 2024/12/17
 */
@Service
public class DeviceService extends ServiceImpl<DeviceMapper, Device> implements IDeviceService {

    @Autowired
    private DeviceMapper deviceMapper;

    @Override
    public List<Device> listDeviceByTypeId(String typeId) {
        QueryWrapper<Device> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type_id", typeId);
        return deviceMapper.selectList(queryWrapper);
    }
}
