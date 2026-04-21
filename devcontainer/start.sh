#!/bin/bash
set -e

# Iniciar X virtual
Xvfb :1 -screen 0 1280x800x24 &
export DISPLAY=:1

# Esperar un poco
sleep 2

# Iniciar escritorio Xfce
xfce4-session &

# Iniciar x11vnc
x11vnc -display :1 -forever -shared -passwd vncpassword &

# Iniciar websockify para noVNC
websockify --web /usr/share/novnc 6080 localhost:5901
