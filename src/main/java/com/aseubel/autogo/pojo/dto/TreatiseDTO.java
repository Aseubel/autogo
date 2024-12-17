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
public class TreatiseDTO {

    private String typeId;
    private String title;
    private String author;
    private String publish;
    private String link;
}
