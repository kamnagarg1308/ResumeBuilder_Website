FROM tomcat:9.0-jdk17-temurin

WORKDIR /app

# Copy web application files
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

# Copy Java source files
COPY src/main/java/ /app/src/main/java/

# Compile Java Servlets
RUN mkdir -p /app/classes && \
    javac -cp "/usr/local/tomcat/lib/servlet-api.jar:src/main/webapp/WEB-INF/lib/*" \
    -d /app/classes \
    $(find /app/src/main/java -name "*.java")

# Copy compiled classes into Tomcat
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes && \
    cp -r /app/classes/* /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# Railway provides PORT; default to 8080 locally
CMD sed -i "s/port=\"8080\"/port=\"${PORT:-8080}\"/" /usr/local/tomcat/conf/server.xml && catalina.sh run