# 基础镜像
FROM openjdk:8

# 作者
MAINTAINER aseubel

# 配置
ENV PARAMS=""

# 时区
ENV TZ=PRC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 添加应用
ADD target/autogo-app.jar /autogo-app.jar

ENTRYPOINT ["sh","-c","java -jar $JAVA_OPTS /autogo-app.jar $PARAMS"]