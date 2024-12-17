package com.aseubel.autogo.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @author aseubel
 * @date 2024/12/17
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {

    private String typeId;
    private String memberName;
    private String grade;
    private String major;
    private String experience;
    private LocalDateTime entryTime;
    private String image;
    private String github;
    private String blog;
    private String bilibili;
    private String csdn;
}
