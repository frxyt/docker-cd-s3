# Copyright (c) 2022 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
# Copyright (c) 2022 Jérémy WALTHER <jeremy.walther@golflima.net>
# See <https://github.com/frxyt/docker-cd-s3> for details.

FROM alpine:latest
LABEL maintainer="Jérémy WALTHER <jeremy@ferox.yt>"

RUN set -ex; \
    apk add --no-cache \
        bash \
        ca-certificates \
        curl \
        git \
        rclone \
        tar \ 
        unzip;

RUN set -ex; \
    apk add --no-cache \
        python3 \
        py3-pip; \
    pip install \
        s3cmd;

RUN set -ex; \
    cat /etc/alpine-release; \
    bash --version; \
    curl --version; \
    git --version; \
    python --version; \
    s3cmd --version; \
    rclone --version;
WORKDIR /work

ENTRYPOINT [ "/bin/bash", "-lc" ]
CMD [ "bash" ]