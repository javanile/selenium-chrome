
FROM selenium/standalone-chrome:120.0

ENV VNC_NO_PASSWORD=1
ENV SCREEN_WIDTH=1200
ENV SCREEN_HEIGHT=675
ENV LOCALHOST_PORTS=8080,8443

USER root
RUN apt-get update && apt-get install -y \
	socat \
    traceroute \
	&& rm -rf /var/lib/apt/lists/*

RUN echo '<script>setTimeout(()=>{window.location="vnc.html?autoconnect=true"},5000)</script>' >> /opt/bin/noVNC/index.html

COPY socat.sh /opt/bin/socat.sh
COPY socat.conf /etc/supervisor/conf.d/socat.conf

USER seluser
