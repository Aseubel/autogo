package com.aseubel.autogo.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author aseubel
 * @date 2024/12/17
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeviceDTO {

    private String typeId;
    private String deviceName;
    private String image;
    private String introduction;
    private String link;
}
