# autogo
AutoGo Lab网站管理系统

# 项目说明
1. 基于mysql，SSM框架开发的网站管理系统，使用的MyBatis-Plus作为ORM框架
2. 实现了主页信息，团队成员，研究、论著、设备管理
3. 采用阿里云oss存储图片，实现图片上传，下载，删除

# 项目部署
1. 导入数据库脚本autogo.sql
2. 修改配置文件 **application.yml** 为 **pro**

# 注意事项
1. 项目中使用的阿里云oss需要配置自己的accessKeyId，accessKeySecret，endpoint，bucket名称。
其中accessKeyId，accessKeySecret需要配置在环境变量中
2. 修改数据库连接信息，如数据库名称，用户名，密码等