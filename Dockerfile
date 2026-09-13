FROM tomcat:9.0-jdk17-temurin

WORKDIR /app

# Copy the web application files
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

# Compile Java Servlets
RUN mkdir -p /tmp/classes && \
    javac -cp "/usr/local/tomcat/lib/servlet-api.jar:src/main/webapp/WEB-INF/lib/*" \
    -d /tmp/classes \
    $(find src/main/java -name "*.java")

# Copy compiled Java classes to Tomcat
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes && \
    cp -r /tmp/classes/* /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# Railway will provide PORT; use 8080 if running locally
CMD sed -i "s/port=\"8080\"/port=\"${PORT:-8080}\"/" /usr/local/tomcat/conf/server.xml && catalina.sh run