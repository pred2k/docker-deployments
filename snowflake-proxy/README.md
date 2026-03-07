Project Page https://community.torproject.org/relay/setup/snowflake/standalone/

docker-snowflake-proxy source: https://gitlab.torproject.org/tpo/anti-censorship/docker-snowflake-proxy

Code Repo of Snowflake Proxy: https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/tree/main/proxy

---

# Setup

(Optional) Open UDP Ports with ufw. (check port range from -ephemeral-ports-range in docker-compose.yml)
```
# install ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow proto udp from any to any port 30000:60000 comment 'snowflake-proxy'
echo "y" | ufw enable
```

