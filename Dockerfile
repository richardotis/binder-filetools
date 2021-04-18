FROM python:3.8
RUN pip3 install \
    jupyterhub \
    jhsingle-native-proxy>=0.0.9
RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
# create a user, since we don't want to run as root
RUN useradd -m jovyan
ENV HOME=/home/jovyan
WORKDIR $HOME
USER jovyan

COPY --chown=jovyan:jovyan entrypoint.sh /tmp
RUN chmod 744 /tmp/entrypoint.sh
EXPOSE 8888

ENTRYPOINT ["/tmp/entrypoint.sh"]
