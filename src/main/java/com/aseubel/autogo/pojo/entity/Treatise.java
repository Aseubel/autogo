package com.aseubel.autogo.pojo.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author aseubel
 * @description 论著实体类
 * @date 2024/12/16
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Treatise {

    @TableId
    private String treatiseId;
    private String typeId;
    private String title;
    private String author;
    private String publish;
    private String link;

}
