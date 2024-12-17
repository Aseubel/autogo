package com.aseubel.autogo.pojo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author aseubel
 * @description 机器人平台设备实体类
 * @date 2024/12/16
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Device {

    private String deviceId;
    private String typeId;
    private String deviceName;
    private String image;
    private String introduction;
    private String link;
}
