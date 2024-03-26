
FROM selenium/standalone-chrome:120.0

ENV VNC_NO_PASSWORD=1
ENV SCREEN_WIDTH=1200
ENV SCREEN_HEIGHT=675

USER root
RUN apt-get update && apt-get install -y \
	socat \
	&& rm -rf /var/lib/apt/lists/* \

COPY socat.sh /opt/bin/
COPY socat.conf /etc/supervisor/conf.d/

USER seluser
