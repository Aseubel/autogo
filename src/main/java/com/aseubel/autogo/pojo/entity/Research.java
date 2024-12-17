package com.aseubel.autogo.pojo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author aseubel
 * @description 研究实体类
 * @date 2024/12/16
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Research {

    private String researchId;
    private String typeId;
    private String title;
    private String link;
    private String image;

}
