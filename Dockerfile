FROM thomasweise/texlive
MAINTAINER Driftcrow <driftcrow@gmail.com>

# Emacs
RUN apt-get update && apt-get install -y software-properties-common \
    && apt-add-repository ppa:kelleyk/emacs \
    && apt-get update && apt-get install -y emacs26 \
    graphviz \
    plantuml

# ENV LANG C.UTF-8
# RUN emacs --batch \
# --eval "(require 'package)" \
# --eval "(add-to-list 'package-archives '(\"melpa\" . \"http://melpa.org/packages/\") t)" \
# --eval "(package-initialize)" \
# --eval "(package-refresh-contents)" \
# --eval "(package-install 'flycheck)"

ADD .emacs /root/.emacs
ADD fonts /root/.fonts
ADD latex /root/texmf/tex/latex

RUN fc-cache -f

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip &&\
    unzip rclone-current-linux-amd64.zip &&\
    cd rclone-*-linux-amd64 &&\
    cp rclone /usr/bin/ &&\
    chown root:root /usr/bin/rclone &&\
    chmod 755 /usr/bin/rclone &&\
    cd ..

COPY setup.el .
RUN emacs -batch -l setup.el

# clean up all temporary files
RUN apt-get purge software-properties-common -y &&\
    apt-get clean &&\
    apt-get autoclean -y &&\
    apt-get autoremove -y &&\
    apt-get clean &&\
    rm -rf /tmp/* /var/tmp/* &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -f /etc/ssh/ssh_host_*
