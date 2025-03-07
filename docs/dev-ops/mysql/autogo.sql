SET character_set_client = utf8;
SET character_set_results = utf8;
SET character_set_connection = utf8;
CREATE database if NOT EXISTS `autogo` default character set utf8mb4;
use autogo;



DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
                        `id` bigint PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
                        `page_name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
                        `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                        `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                        `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0-未删除;1-已删除'
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '标题页';

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
                        `id` bigint PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
                        `type_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '类型ID',
                        `page_id` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属标题页id',
                        `type_name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
                        `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                        `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                        `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0-未删除;1-已删除'
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '类型';

DROP TABLE IF EXISTS `index_image`;
CREATE TABLE `index_image` (
                               `id` bigint PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
                               `image_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '图片ID',
                               `path` varchar(128) not null default '' comment '路径',
                               `image_order` tinyint unsigned not null default 0 comment '顺序',
                               `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                               `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0-未删除;1-已删除'
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '主页轮播图';

DROP TABLE IF EXISTS `index_info`;
CREATE TABLE `index_info` (
                              `id` bigint PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
                              `about` text comment '关于我们',
                              `contact` text comment '联系我们',
                              `address` varchar(128) not null default '' comment '地址',
                              `phone` varchar(13) not null default '' comment '联系电话',
                              `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                              `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0-未删除;1-已删除'
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '主页';

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
                          `id` BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
                          `member_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '成员ID',
                          `type_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '类型ID',
                          `member_name` VARCHAR ( 32 ) NOT NULL DEFAULT '' COMMENT '成员姓名',
                          `grade` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '年级',
                          `major` VARCHAR ( 64 ) NOT NULL DEFAULT '' COMMENT '专业方向',
                          `experience` TEXT COMMENT '个人经历',
                          `image` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '图片地址',
                          `github` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'github',
                          `blog` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '博客',
                          `bilibili` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '哔哩哔哩',
                          `csdn` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'CSDN',
                          `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                          `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                          `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0-未删除;1-已删除'
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '团队成员';

DROP TABLE IF EXISTS `research`;
CREATE TABLE `research` (
                            `id` BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
                            `research_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '研究ID',
                            `type_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '类型ID',
                            `title` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '标题',
                            `link` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '跳转地址',
                            `image` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '图片地址',
                            `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                            `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0-未删除;1-已删除'
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '研究';

DROP TABLE IF EXISTS `treatise`;
CREATE TABLE `treatise` (
                            `id` BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
                            `treatise_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '论著ID',
                            `type_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '类型ID',
                            `title` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '标题',
                            `author` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '作者',
                            `publish` VARCHAR(46) NOT NULL DEFAULT '' COMMENT '发表处',
                            `link` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '跳转地址',
                            `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                            `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0-未删除;1-已删除'
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '论著';

DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
                          `id` BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
                          `device_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '设备ID',
                          `type_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '类型ID',
                          `device_name` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '设备名称',
                          `image` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '图片地址',
                          `introduction` TEXT COMMENT '介绍',
                          `link` VARCHAR(128) NOT NULL DEFAULT '' COMMENT '跳转地址',
                          `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                          `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                          `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0-未删除;1-已删除'
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '设备';

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
                         `id` BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
                         `account` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '账号',
                         `password` VARCHAR(64) NOt NULL DEFAULT '' COMMENT '密码',
                         `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                         `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0-未删除;1-已删除'
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '管理员账号';


-- 管理员账号
insert into `admin` (account,password) values ('admin','123456');

-- 标题页
insert into `page` (page_name) values ('主页');
insert into `page` (page_name) values ('团队');
insert into `page` (page_name) values ('研究');
insert into `page` (page_name) values ('论著');
insert into `page` (page_name) values ('机器人平台');

-- 主页
insert into `index_info` (about,contact,address,phone) values ('成立时间：2014年\n宗旨：以科技创新,促进大学生创新创业\n理念：培养研究生的模式来培养本科生\n为同学提供一个融合了课外学术研究、科技创新、思政道德培养的学习平台，让同学们在本科拥有实操的机会，获得丰富的学术研究机会，拓宽知识面，提高科研能力。','希望能联系我们','dgut机械楼xxx','13266002451');
insert into `index_image` (image_id,path,image_order) values ('01','',1);
insert into `index_image` (image_id,path,image_order) values ('02','',2);
insert into `index_image` (image_id,path,image_order) values ('03','',3);
insert into `index_image` (image_id,path,image_order) values ('04','',4);
insert into `index_image` (image_id,path,image_order) values ('05','',5);

-- 团队-成员类型
insert into `type` (type_id,page_id,type_name) values ('01','2','教职人员');
insert into `type` (type_id,page_id,type_name) values ('02','2','现有成员');
insert into `type` (type_id,page_id,type_name) values ('03','2','已毕业成员');
insert into `member` (member_id,type_id,member_name,major) values ('01','01','郭建文','机械学院教授');
insert into `member` (member_id,type_id,member_name,major,github,blog,bilibili,csdn,experience) values ('02','02','杨之耀','后端','https://github.com/Aseubel','https://github.com/Aseubel','https://github.com/Aseubel','https://github.com/Aseubel',"大一摆烂大二摆烂大三摆烂大四烂完了");
insert into `member` (member_id,type_id,member_name,major) values ('03','02','杨博熙','机器学习');
insert into `member` (member_id,type_id,member_name,major) values ('04','02','李八卦','算法工程师');
insert into `member` (member_id,type_id,member_name,major) values ('05','03','毕业生1','人工智能');
insert into `member` (member_id,type_id,member_name,major) values ('06','03','毕业生2','嵌入式');
insert into `member` (member_id,type_id,member_name,major) values ('07','03','毕业生3','前后端');
update `member` set image='https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/0adbb9f6-cae5-44af-836a-996169b5fc6b.jpg';
-- 研究-类型
insert into `type` (type_id,page_id,type_name) values ('04','3','建模');
insert into `type` (type_id,page_id,type_name) values ('05','3','图像识别');
insert into `type` (type_id,page_id,type_name) values ('06','3','运动算法');
insert into `research` (research_id,type_id,title,link,image) values ('01','04','建模研究1','','');
insert into `research` (research_id,type_id,title,link,image) values ('02','04','建模研究2','','');
insert into `research` (research_id,type_id,title,link,image) values ('03','04','建模研究3','','');
insert into `research` (research_id,type_id,title,link,image) values ('04','05','图像识别1','','');
insert into `research` (research_id,type_id,title,link,image) values ('05','05','图像识别2','','');
insert into `research` (research_id,type_id,title,link,image) values ('06','05','图像识别3','','');
insert into `research` (research_id,type_id,title,link,image) values ('07','06','运动算法1','','');
insert into `research` (research_id,type_id,title,link,image) values ('08','06','运动算法2','','');
insert into `research` (research_id,type_id,title,link,image) values ('09','06','运动算法3','','');
update `research` set image='https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png';

-- 论著-年份
insert into `type` (type_id,page_id,type_name) values ('07','4','2024');
insert into `type` (type_id,page_id,type_name) values ('08','4','2023');
insert into `type` (type_id,page_id,type_name) values ('09','4','2022');
insert into `treatise` (treatise_id,type_id,title,author,publish,link) values ('01','07','2024年第一篇论文','机械神','science','');
insert into `treatise` (treatise_id,type_id,title,author,publish,link) values ('02','07','2024年第二篇论文','机械神','science','');
insert into `treatise` (treatise_id,type_id,title,author,publish,link) values ('03','07','2024年第三篇论文','机械神','science','');
insert into `treatise` (treatise_id,type_id,title,author,publish,link) values ('04','08','2023年第一篇论文','机械神','science','');
insert into `treatise` (treatise_id,type_id,title,author,publish,link) values ('05','08','2023年第二篇论文','机械神','science','');
insert into `treatise` (treatise_id,type_id,title,author,publish,link) values ('06','08','2023年第三篇论文','机械神','science','');
insert into `treatise` (treatise_id,type_id,title,author,publish,link) values ('07','09','2022年第一篇论文','机械神','science','');
insert into `treatise` (treatise_id,type_id,title,author,publish,link) values ('08','09','2022年第二篇论文','机械神','science','');
insert into `treatise` (treatise_id,type_id,title,author,publish,link) values ('09','09','2022年第三篇论文','机械神','science','');

-- 机器人平台-类型
insert into `type` (type_id,page_id,type_name) values ('10','5','机械臂');
insert into `type` (type_id,page_id,type_name) values ('11','5','地面无人机');
insert into `type` (type_id,page_id,type_name) values ('12','5','空中无人机');
insert into `type` (type_id,page_id,type_name) values ('13','5','后台服务器');
insert into `type` (type_id,page_id,type_name) values ('14','5','传感器');
insert into `device` (device_id,type_id,device_name,image,introduction,link) values ('01','10','小机械臂','','超级小巧的机械臂','');
insert into `device` (device_id,type_id,device_name,image,introduction,link) values ('02','10','大机械臂','','一个大型机械臂','');
insert into `device` (device_id,type_id,device_name,image,introduction,link) values ('03','11','地面侦查无人机','','隐身的地面侦查无人机','');
insert into `device` (device_id,type_id,device_name,image,introduction,link) values ('04','11','地面战斗无人机','','超强的地面战斗无人机','');
insert into `device` (device_id,type_id,device_name,image,introduction,link) values ('05','12','空中侦查无人机','','隐身的空中侦查无人机','');
insert into `device` (device_id,type_id,device_name,image,introduction,link) values ('06','12','空中战斗无人机','','超强的空中战斗无人机','');
insert into `device` (device_id,type_id,device_name,image,introduction,link) values ('07','13','神威','','后台服务器1','');
insert into `device` (device_id,type_id,device_name,image,introduction,link) values ('08','13','幻影','','后台服务器2','');
insert into `device` (device_id,type_id,device_name,image,introduction,link) values ('09','14','湿度传感器','','传感器1','');
insert into `device` (device_id,type_id,device_name,image,introduction,link) values ('10','14','温度传感器','','传感器2','');
update `device` set image='https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png';








