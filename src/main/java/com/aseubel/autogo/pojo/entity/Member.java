package com.aseubel.autogo.pojo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @author aseubel
 * @description 团队成员实体类
 * @date 2024/12/16
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {

    private String memberId;
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
