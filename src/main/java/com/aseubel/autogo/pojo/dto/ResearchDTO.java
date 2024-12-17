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
public class ResearchDTO {

    private String typeId;
    private String title;
    private String link;
    private String image;
}
