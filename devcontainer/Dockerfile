
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    USER=ubuntu \
    PASSWORD=vncpassword \
    DISPLAY=:1 \
    VNC_PORT=5901 \
    NOVNC_PORT=6080

# Instalar paquetes necesarios
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    wget \
    curl \
    ca-certificates \
    xfce4 \
    xfce4-goodies \
    xfonts-base \
    x11vnc \
    xvfb \
    supervisor \
    novnc \
    websockify \
    dbus-x11 \
    x11-utils \
    x11-xserver-utils \
    firefox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Crear usuario sin privilegios
RUN useradd -m -s /bin/bash -G sudo $USER && \
    echo "$USER:$PASSWORD" | chpasswd && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Configurar supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Cambiar a usuario
USER $USER
WORKDIR /home/$USER

# Crear directorio para noVNC (ya viene instalado en /usr/share/novnc)
# pero podemos enlazarlo
RUN sudo ln -s /usr/share/novnc /home/$USER/novnc

EXPOSE $NOVNC_PORT

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
