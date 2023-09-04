FROM debian:bullseye-slim
LABEL youtuber-version="1.0.0"
MAINTAINER quminzhi@gmail.com

# Install prerequisites
RUN apt-get update \
    && apt-get install python3 python3-pip -y \
    && apt-get install ffmpeg -y \
    && pip install -U openai-whisper \
    && pip install yt-dlp

# Cached models are mounted with docker run command

# Move shell scripts to process videoes into container
COPY ./bin/trans.en /usr/local/bin/trans.en
COPY ./bin/trans.cn /usr/local/bin/trans.cn
COPY ./bin/vproc /usr/local/bin/vproc
RUN chmod a+x /usr/local/bin/trans.en && chmod a+x /usr/local/bin/trans.cn && chmod a+x /usr/local/bin/vproc

WORKDIR /workspace

# Add a running foreground process
CMD ["/usr/bin/tail", "-f", "/etc/default/useradd"]
