FROM python:3.7
RUN pip3 install \
    jupyterhub \
    jhsingle-native-proxy

# create a user, since we don't want to run as root
RUN useradd -m jovyan
ENV HOME=/home/jovyan
WORKDIR $HOME
USER jovyan

EXPOSE 8888

WORKDIR /app
RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

CMD ["jhsingle-native-proxy", "--destport", "8505", "/app/filebrowser", "{--}port", "{port}", "{--}noauth", "{--}root", "/projects"]
