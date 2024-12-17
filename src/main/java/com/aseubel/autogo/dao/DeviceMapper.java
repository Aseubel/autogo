package com.aseubel.autogo.dao;

import com.aseubel.autogo.pojo.entity.Device;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author aseubel
 * @description 机器人平台设备数据访问接口
 * @date 2024/12/16
 */
@Mapper
public interface DeviceMapper extends BaseMapper<Device> {
}
