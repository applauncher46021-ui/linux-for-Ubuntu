FROM dorowu/ubuntu-desktop-lxde-vnc:latest
ENV USER=ubuntu
RUN useradd -m -s /bin/bash -G sudo $USER && \
    echo "$USER:vncpassword" | chpasswd && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USER
