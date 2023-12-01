FROM dde-s6

COPY s6-rc.d/type /etc/s6-overlay/s6-rc.d/beer/type
COPY s6-rc.d/run /etc/s6-overlay/s6-rc.d/beer/run
COPY s6-rc.d/finish /etc/s6-overlay/s6-rc.d/beer/finish
COPY s6-rc.d/beer /etc/s6-overlay/s6-rc.d/user/contents.d/beer
COPY beer.sh /opt/beer/beer.sh

ENV BOTTLES=20

ENTRYPOINT ["/init"]
