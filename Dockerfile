FROM thomasweise/docker-texlive
MAINTAINER Driftcrow <driftcrow@gmail.com>

# Emacs
RUN apt-get update && apt-get install -y software-properties-common \
    && apt-add-repository ppa:kelleyk/emacs \
    && apt-get update && apt-get install -y emacs26 \
    org-mode \
    graphviz \
    plantuml

COPY setup.el .
RUN emacs -batch -l setup.el

ADD .emacs .emacs

# clean up all temporary files
    apt-get purge software-properties-common &&\
    apt-get clean &&\
    apt-get autoclean -y &&\
    apt-get autoremove -y &&\
    apt-get clean &&\
    rm -rf /tmp/* /var/tmp/* &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -f /etc/ssh/ssh_host_*
