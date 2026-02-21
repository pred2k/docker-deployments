ARG CADDY_VERSION=2.11

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
      --with github.com/porech/caddy-maxmind-geolocation \
      --with github.com/caddy-dns/gandi \
      --with github.com/mholt/caddy-l4/layer4


FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy


