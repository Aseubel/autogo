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
CREATE UNIQUE INDEX uk_type_id ON `type` (type_id);

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
CREATE UNIQUE INDEX uk_member_id ON `member` (member_id);
CREATE INDEX ind_type_id ON `member` (type_id);

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
CREATE UNIQUE INDEX uk_research_id ON `research` (research_id);
CREATE INDEX ind_type_id ON `research` (type_id);

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
CREATE UNIQUE INDEX uk_treatise_id ON `treatise` (treatise_id);
CREATE INDEX ind_type_id ON `treatise` (type_id);

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
CREATE UNIQUE INDEX uk_device_id ON `device` (device_id);
CREATE INDEX ind_type_id ON `device` (type_id);

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
	  `id` BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    `account` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '账号',
    `password` VARCHAR(64) NOt NULL DEFAULT '' COMMENT '密码',
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0-未删除;1-已删除'
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '管理员账号';



INSERT INTO `admin` (`id`, `account`, `password`, `create_time`, `update_time`, `is_deleted`) VALUES (1, 'admin', '123456', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `device` (`id`, `device_id`, `type_id`, `device_name`, `image`, `introduction`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (1, '01', '10', '小机械臂', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '超级小巧的机械臂', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `device` (`id`, `device_id`, `type_id`, `device_name`, `image`, `introduction`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (2, '02', '10', '大机械臂', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '一个大型机械臂', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `device` (`id`, `device_id`, `type_id`, `device_name`, `image`, `introduction`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (3, '03', '11', '地面侦查无人机', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '隐身的地面侦查无人机', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `device` (`id`, `device_id`, `type_id`, `device_name`, `image`, `introduction`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (4, '04', '11', '地面战斗无人机', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '超强的地面战斗无人机', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `device` (`id`, `device_id`, `type_id`, `device_name`, `image`, `introduction`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (5, '05', '12', '空中侦查无人机', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '隐身的空中侦查无人机', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `device` (`id`, `device_id`, `type_id`, `device_name`, `image`, `introduction`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (6, '06', '12', '空中战斗无人机', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '超强的空中战斗无人机', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `device` (`id`, `device_id`, `type_id`, `device_name`, `image`, `introduction`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (7, '07', '13', '神威', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '后台服务器1', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `device` (`id`, `device_id`, `type_id`, `device_name`, `image`, `introduction`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (8, '08', '13', '幻影', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '后台服务器2', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `device` (`id`, `device_id`, `type_id`, `device_name`, `image`, `introduction`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (9, '09', '14', '湿度传感器', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '传感器1', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `device` (`id`, `device_id`, `type_id`, `device_name`, `image`, `introduction`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (10, '10', '14', '温度传感器', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '传感器2', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `index_image` (`id`, `image_id`, `path`, `image_order`, `create_time`, `update_time`, `is_deleted`) VALUES (1, '01', '', 1, '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `index_image` (`id`, `image_id`, `path`, `image_order`, `create_time`, `update_time`, `is_deleted`) VALUES (2, '02', '', 2, '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `index_image` (`id`, `image_id`, `path`, `image_order`, `create_time`, `update_time`, `is_deleted`) VALUES (3, '03', '', 3, '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `index_image` (`id`, `image_id`, `path`, `image_order`, `create_time`, `update_time`, `is_deleted`) VALUES (4, '04', '', 4, '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `index_image` (`id`, `image_id`, `path`, `image_order`, `create_time`, `update_time`, `is_deleted`) VALUES (5, '05', '', 5, '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `index_info` (`id`, `about`, `contact`, `address`, `phone`, `create_time`, `update_time`, `is_deleted`) VALUES (1, '成立时间：2014年\n\n宗旨：以科技创新,促进大学生创新创业\n\n理念：培养研究生的模式来培养本科生\n\n为同学提供一个融合了课外学术研究、科技创新、思政道德培养的学习平台，让同学们在本科拥有实操的机会，获得丰富的学术研究机会，拓宽知识面，提高科研能力。', '希望能联系我们', 'dgut机械楼xxx', '13266002451', '2025-03-21 19:14:25', '2025-03-21 19:17:22', 0);
INSERT INTO `member` (`id`, `member_id`, `type_id`, `member_name`, `grade`, `major`, `experience`, `image`, `github`, `blog`, `bilibili`, `csdn`, `create_time`, `update_time`, `is_deleted`) VALUES (1, '01', '01', '郭建文', 0, '机械学院教授', 'https://jxx.dgut.edu.cn/info/1016/14096.htm\n教育背景 Education：\n\n1999.09-2003.6 湖南大学 机械设计制造及其自动化 学士\n\n2003.09-2005.09 湖南大学 机械电子工程 硕士研究生\n\n2005.09-2010.12 湖南大学 机械工程 博士\n\n工作经历 Work Experience\n\n2011.07-2016.07 东莞理工学院 机械工程学院 教师\n\n2016.07-2018.12 东莞理工学院 机械工程学院 机电与设计工程系主任\n\n期间：2015.9-2017.12 东莞市横沥镇人民政府 镇长助理\n\n2019.01-2021.01 东莞理工学院 机械工程学院 副院长，分管科研、研究生工作\n\n2021.01-2022.01 东莞理工学院 机械工程学院 党委副书记、副院长，分管学生、科研、研究生工作\n\n2022.01-今 东莞理工学院 机械工程学院 党委书记兼副院长', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/51fa5f16-547b-4544-a436-ba83f1ff08d9.png', '', '', '', '', '2025-03-21 19:14:25', '2025-03-21 19:26:39', 0);
INSERT INTO `member` (`id`, `member_id`, `type_id`, `member_name`, `grade`, `major`, `experience`, `image`, `github`, `blog`, `bilibili`, `csdn`, `create_time`, `update_time`, `is_deleted`) VALUES (2, '02', '02', '杨之耀', 0, '后端', '大一摆烂大二摆烂大三摆烂大四烂完了', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/0adbb9f6-cae5-44af-836a-996169b5fc6b.jpg', 'https://github.com/Aseubel', 'https://github.com/Aseubel', 'https://github.com/Aseubel', 'https://github.com/Aseubel', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `member` (`id`, `member_id`, `type_id`, `member_name`, `grade`, `major`, `experience`, `image`, `github`, `blog`, `bilibili`, `csdn`, `create_time`, `update_time`, `is_deleted`) VALUES (3, '03', '02', '杨博熙', 0, '机器学习', NULL, 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/0adbb9f6-cae5-44af-836a-996169b5fc6b.jpg', '', '', '', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `member` (`id`, `member_id`, `type_id`, `member_name`, `grade`, `major`, `experience`, `image`, `github`, `blog`, `bilibili`, `csdn`, `create_time`, `update_time`, `is_deleted`) VALUES (4, '04', '02', '李八卦', 0, '算法工程师', NULL, 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/0adbb9f6-cae5-44af-836a-996169b5fc6b.jpg', '', '', '', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `member` (`id`, `member_id`, `type_id`, `member_name`, `grade`, `major`, `experience`, `image`, `github`, `blog`, `bilibili`, `csdn`, `create_time`, `update_time`, `is_deleted`) VALUES (5, '05', '03', '毕业生1', 0, '人工智能', NULL, 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/0adbb9f6-cae5-44af-836a-996169b5fc6b.jpg', '', '', '', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `member` (`id`, `member_id`, `type_id`, `member_name`, `grade`, `major`, `experience`, `image`, `github`, `blog`, `bilibili`, `csdn`, `create_time`, `update_time`, `is_deleted`) VALUES (6, '06', '03', '毕业生2', 0, '嵌入式', NULL, 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/0adbb9f6-cae5-44af-836a-996169b5fc6b.jpg', '', '', '', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `member` (`id`, `member_id`, `type_id`, `member_name`, `grade`, `major`, `experience`, `image`, `github`, `blog`, `bilibili`, `csdn`, `create_time`, `update_time`, `is_deleted`) VALUES (7, '07', '03', '毕业生3', 0, '前后端', NULL, 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/0adbb9f6-cae5-44af-836a-996169b5fc6b.jpg', '', '', '', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `page` (`id`, `page_name`, `create_time`, `update_time`, `is_deleted`) VALUES (1, '主页', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `page` (`id`, `page_name`, `create_time`, `update_time`, `is_deleted`) VALUES (2, '团队', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `page` (`id`, `page_name`, `create_time`, `update_time`, `is_deleted`) VALUES (3, '研究', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `page` (`id`, `page_name`, `create_time`, `update_time`, `is_deleted`) VALUES (4, '论著', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `page` (`id`, `page_name`, `create_time`, `update_time`, `is_deleted`) VALUES (5, '机器人平台', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `research` (`id`, `research_id`, `type_id`, `title`, `link`, `image`, `create_time`, `update_time`, `is_deleted`) VALUES (1, '01', '04', '建模研究1', '', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `research` (`id`, `research_id`, `type_id`, `title`, `link`, `image`, `create_time`, `update_time`, `is_deleted`) VALUES (2, '02', '04', '建模研究2', '', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `research` (`id`, `research_id`, `type_id`, `title`, `link`, `image`, `create_time`, `update_time`, `is_deleted`) VALUES (3, '03', '04', '建模研究3', '', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `research` (`id`, `research_id`, `type_id`, `title`, `link`, `image`, `create_time`, `update_time`, `is_deleted`) VALUES (4, '04', '05', '图像识别1', '', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `research` (`id`, `research_id`, `type_id`, `title`, `link`, `image`, `create_time`, `update_time`, `is_deleted`) VALUES (5, '05', '05', '图像识别2', '', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `research` (`id`, `research_id`, `type_id`, `title`, `link`, `image`, `create_time`, `update_time`, `is_deleted`) VALUES (6, '06', '05', '图像识别3', '', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `research` (`id`, `research_id`, `type_id`, `title`, `link`, `image`, `create_time`, `update_time`, `is_deleted`) VALUES (7, '07', '06', '运动算法1', '', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `research` (`id`, `research_id`, `type_id`, `title`, `link`, `image`, `create_time`, `update_time`, `is_deleted`) VALUES (8, '08', '06', '运动算法2', '', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `research` (`id`, `research_id`, `type_id`, `title`, `link`, `image`, `create_time`, `update_time`, `is_deleted`) VALUES (9, '09', '06', '运动算法3', '', 'https://yangaseubel.oss-cn-guangzhou.aliyuncs.com/autogo/d52db095-f95b-4c69-ae60-f26c9c6d786e.png', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `treatise` (`id`, `treatise_id`, `type_id`, `title`, `author`, `publish`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (1, '01', '07', '2024年第一篇论文', '机械神', 'science', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `treatise` (`id`, `treatise_id`, `type_id`, `title`, `author`, `publish`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (2, '02', '07', '2024年第二篇论文', '机械神', 'science', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `treatise` (`id`, `treatise_id`, `type_id`, `title`, `author`, `publish`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (3, '03', '07', '2024年第三篇论文', '机械神', 'science', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `treatise` (`id`, `treatise_id`, `type_id`, `title`, `author`, `publish`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (4, '04', '08', '2023年第一篇论文', '机械神', 'science', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `treatise` (`id`, `treatise_id`, `type_id`, `title`, `author`, `publish`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (5, '05', '08', '2023年第二篇论文', '机械神', 'science', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `treatise` (`id`, `treatise_id`, `type_id`, `title`, `author`, `publish`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (6, '06', '08', '2023年第三篇论文', '机械神', 'science', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `treatise` (`id`, `treatise_id`, `type_id`, `title`, `author`, `publish`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (7, '07', '09', '2022年第一篇论文', '机械神', 'science', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `treatise` (`id`, `treatise_id`, `type_id`, `title`, `author`, `publish`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (8, '08', '09', '2022年第二篇论文', '机械神', 'science', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `treatise` (`id`, `treatise_id`, `type_id`, `title`, `author`, `publish`, `link`, `create_time`, `update_time`, `is_deleted`) VALUES (9, '09', '09', '2022年第三篇论文', '机械神', 'science', '', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (1, '01', 2, '教职人员', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (2, '02', 2, '现有成员', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (3, '03', 2, '已毕业成员', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (4, '04', 3, '建模', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (5, '05', 3, '图像识别', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (6, '06', 3, '运动算法', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (7, '07', 4, '2024', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (8, '08', 4, '2023', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (9, '09', 4, '2022', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (10, '10', 5, '机械臂', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (11, '11', 5, '地面无人机', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (12, '12', 5, '空中无人机', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (13, '13', 5, '后台服务器', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
INSERT INTO `type` (`id`, `type_id`, `page_id`, `type_name`, `create_time`, `update_time`, `is_deleted`) VALUES (14, '14', 5, '传感器', '2025-03-21 19:14:25', '2025-03-21 19:14:25', 0);
