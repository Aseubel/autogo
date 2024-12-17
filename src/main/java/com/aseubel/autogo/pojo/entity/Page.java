package com.aseubel.autogo.pojo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author aseubel
 * @description 标题页实体类
 * @date 2024/12/16
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Page {

    private Long id;
    private String pageName;

}
