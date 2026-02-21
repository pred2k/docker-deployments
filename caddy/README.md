# validate Caddyfile with env vars

   docker run -it --rm -v /root/caddy/Caddyfile:/etc/caddy/Caddyfile --env-file .env --env-file /etc/environment caddy:latest caddy validate --config /etc/caddy/Caddyfile


# prepare CAA accounturi parameter

Look for 'location' value in file caddy_data/caddy/acme/acme-v02.api.letsencrypt.org-directory/users/<email>/<username>.json

And insert the WHOLE uri into CAA record like: `example.com. IN CAA 0 issue "letsencrypt.org; accounturi=ACCOUNT_URI_HERE"`

https://letsencrypt.org/docs/caa/
