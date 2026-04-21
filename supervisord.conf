[supervisord]
nodaemon=true
user=root

[program:xvfb]
command=/usr/bin/Xvfb :1 -screen 0 1280x800x24
autorestart=true
user=ubuntu
environment=DISPLAY=:1

[program:x11vnc]
command=/usr/bin/x11vnc -display :1 -forever -shared -passwd vncpassword
autorestart=true
user=ubuntu
environment=DISPLAY=:1

[program:novnc]
command=/usr/bin/websockify --web /usr/share/novnc 6080 localhost:5901
autorestart=true
user=ubuntu
