FROM maven:3.6-jdk-8

RUN curl -o- 'https://s3.amazonaws.com/bat-wrapper/install.sh' | bash

WORKDIR /usr/src/mymaven

ENTRYPOINT ["bash", "bat"]
