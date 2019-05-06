FROM thomasweise/docker-texlive
MAINTAINER Driftcrow <driftcrow@gmail.com>

# Emacs
RUN apt-get update && apt-get install -y software-properties-common \
    && apt-add-repository ppa:kelleyk/emacs \
    && apt-get update && apt-get install -y emacs26 \
    org-mode \
    graphviz \
    plantuml

# ENV LANG C.UTF-8
# RUN emacs --batch \
# --eval "(require 'package)" \
# --eval "(add-to-list 'package-archives '(\"melpa\" . \"http://melpa.org/packages/\") t)" \
# --eval "(package-initialize)" \
# --eval "(package-refresh-contents)" \
# --eval "(package-install 'flycheck)"

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
