FROM amazonlinux:latest

USER root

COPY . /script

RUN yum -y install pip zip gzip make tar wget gcc openssl-devel bzip2-devel libffi-devel && \
    cd /opt && \
    wget https://www.python.org/ftp/python/3.8.7/Python-3.8.7.tgz && \
    tar xzf Python-3.8.7.tgz && \
    cd Python-3.8.7 && \
    ./configure --enable-optimizations && \
    make altinstall && \
    rm -f /opt/Python-3.8.7.tgz && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3.8 get-pip.py --user && \
    cd /tmp && \
    mkdir -p python/lib/python3.8/site-packages && \
    python3.8 -m pip install PyNaCl -t python/lib/python3.8/site-packages/ && \
    zip -r pynacl_layer.zip *

WORKDIR /script

ENTRYPOINT ["/bin/sh"]
CMD ["staying-alive.sh"]
