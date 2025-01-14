FROM registry.cn-hangzhou.aliyuncs.com/tcrise_public/tcrise_jdk8

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8007
ENV JAVA_OPTS="-server -Xms512m -Xmx512m"
ENTRYPOINT [ "sh", "-c", "java ${JAVA_OPTS} -jar -Duser.timezone=Asia/Shanghai -Dfile.encoding=UTF-8 /app.jar " ]