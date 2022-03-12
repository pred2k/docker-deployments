
# Docker deployments for alternative services

Deploys privacy friendly services that don't have any persistent data.

### Bibliogram

> An alternative front-end for Instagram.

[Sourcehut](https://sr.ht/~cadence/bibliogram/) [![Docker Pulls](https://img.shields.io/docker/pulls/cloudrac3r/bibliogram?style=plastic)](https://hub.docker.com/r/cloudrac3r/bibliogram) [![License](https://img.shields.io/badge/license-AGPL--3.0-important)](https://sr.ht/~cadence/bibliogram)

## Libreddit

> An alternative private front-end to Reddit

[![GitHub Repo stars](https://img.shields.io/github/stars/spikecodes/libreddit?style=social)](https://github.com/spikecodes/libreddit) ![GitHub last commit](https://img.shields.io/github/last-commit/spikecodes/libreddit) ![GitHub contributors](https://img.shields.io/github/contributors/spikecodes/libreddit) [![Docker Pulls](https://img.shields.io/docker/pulls/spikecodes/libreddit?style=plastic)](https://hub.docker.com/r/spikecodes/libreddit) ![GitHub](https://img.shields.io/github/license/spikecodes/libreddit)

## Jitsi Meet

> Jitsi Meet is an open-source (Apache) WebRTC JavaScript application that uses Jitsi Videobridge to provide high quality, secure and scalable video conferences.

[![GitHub Repo stars](https://img.shields.io/github/stars/jitsi/jitsi-meet?style=social)](https://github.com/jitsi/jitsi-meet) ![GitHub last commit](https://img.shields.io/github/last-commit/jitsi/jitsi-meet) ![GitHub contributors](https://img.shields.io/github/contributors/jitsi/jitsi-meet) [![Docker Pulls](https://img.shields.io/docker/pulls/jitsi/web)](https://hub.docker.com/r/jitsi/web) ![GitHub](https://img.shields.io/github/license/jitsi/jitsi-meet)

## Nitter

> A free and open source alternative Twitter front-end focused on privacy.

[![GitHub Repo stars](https://img.shields.io/github/stars/zedeus/nitter?style=social)](https://github.com/zedeus/nitter) ![GitHub last commit](https://img.shields.io/github/last-commit/zedeus/nitter) ![GitHub contributors](https://img.shields.io/github/contributors/zedeus/nitter) [![Docker Pulls](https://img.shields.io/docker/pulls/zedeus/nitter)](https://hub.docker.com/r/zedeus/nitter) ![GitHub](https://img.shields.io/github/license/zedeus/nitter)

## Whoogle

> A self-hosted, ad-free, privacy-respecting metasearch engine

[![GitHub Repo stars](https://img.shields.io/github/stars/benbusby/whoogle-search?style=social)](https://github.com/benbusby/whoogle-search) ![GitHub last commit](https://img.shields.io/github/last-commit/benbusby/whoogle-search) ![GitHub contributors](https://img.shields.io/github/contributors/benbusby/whoogle-search) [![Docker Pulls](https://img.shields.io/docker/pulls/benbusby/whoogle-search)](https://hub.docker.com/r/benbusby/whoogle-search) ![GitHub](https://img.shields.io/github/license/benbusby/whoogle-search)

# Installation

I deploy to **Ubuntu 20.04 LTS**. But everything with Docker Engine (or maybe even Podman) will work.  

1. clone project on your host
```
git clone https://github.com/pred2k/docker-deployments.git /docker-deployments
```

1. Create docker network:
  ```
  docker network create traefik_default
  ```

1. (optional) Create cronjob for regular updates:  
run `crontab -e` and add this line:
```
0 11 * * *	systemd-cat -t docker-deploy /docker-deployments/update-images-and-restart.sh
```
