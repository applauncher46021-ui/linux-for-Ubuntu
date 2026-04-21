FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    USER=ubuntu \
    PASSWORD=vncpassword \
    DISPLAY=:1 \
    RESOLUTION=1280x800x24

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    wget \
    curl \
    ca-certificates \
    xfce4 \
    xfce4-goodies \
    xfonts-base \
    tigervnc-standalone-server \
    tigervnc-common \
    novnc \
    websockify \
    dbus-x11 \
    x11-utils \
    x11-xserver-utils \
    firefox \
    supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash -G sudo $USER && \
    echo "$USER:$PASSWORD" | chpasswd && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Configurar VNC password
RUN mkdir -p /home/$USER/.vnc && \
    echo $PASSWORD | vncpasswd -f > /home/$USER/.vnc/passwd && \
    chown -R $USER:$USER /home/$USER/.vnc && \
    chmod 600 /home/$USER/.vnc/passwd

# Configurar supervisor
COPY supervisord.conf /etc/supervisor/conf.d/vnc.conf

EXPOSE 6080

USER $USER
WORKDIR /home/$USER

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
