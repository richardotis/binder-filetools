FROM python:3.8
RUN pip3 install \
    jupyterhub \
    notebook \
    jhsingle-native-proxy
RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
# create a user, since we don't want to run as root
RUN useradd -m jovyan
ENV HOME=/home/jovyan
WORKDIR $HOME
USER jovyan

EXPOSE 8888

WORKDIR /app

CMD ["jhsingle-native-proxy", "--destport", "8505", "filebrowser", "{--}port", "{port}", "{--}noauth", "{--}root", "/projects"]
