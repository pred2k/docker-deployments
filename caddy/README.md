# validate Caddyfile with env vars

   docker run -it --rm -v /root/caddy/Caddyfile:/etc/caddy/Caddyfile --env-file .env --env-file /etc/environment caddy:latest caddy validate --config /etc/caddy/Caddyfile
