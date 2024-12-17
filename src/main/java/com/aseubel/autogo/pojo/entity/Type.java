package com.aseubel.autogo.pojo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author aseubel
 * @description 具体分类实体类
 * @date 2024/12/16
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Type {

    private String typeId;
    private String pageId;
    private String typeName;

}
