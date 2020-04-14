FROM vimagick/openrefine:latest

WORKDIR /app

ADD https://repo1.maven.org/maven2/org/python/jython-installer/2.7.2/jython-installer-2.7.2.jar jython-installer-2.7.2.jar jython-installer-2.7.2.jar
ADD requirements.txt requirements.txt

RUN mkdir jython && java -jar jython-installer-2.7.2.jar -s -d jython
RUN ./jython/bin/jython -m pip install --upgrade pip
RUN ./jython/bin/jython -m pip install -r requirements.txt

VOLUME /app

ADD https://repo1.maven.org/maven2/org/apache/commons/commons-text/1.8/commons-text-1.8.jar ./webapp/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/info/knigoed/isbn/isbn-check/2.1.3/isbn-check-2.1.3.jar ./webapp/WEB-INF/lib/

VOLUME /app/webapp/WEB-INF/lib/
