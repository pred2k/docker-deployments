
# Docker deployments for alternative frontends

Deploys privacy friendly services that don't have any persistent data. 

+ some other favourite services.

## Main Goals

* TLS 1.3 only
* Elliptic Curve Certificates (90 Day lifespan) with Let's Encrypt
* Only strong Cipher Suites (as they are in TLS 1.3)
* Strict Transport Security (HSTS) Header for two years
* Online Certificate Status Protocol (OCSP) stapling
* Strong Content Security Policy (CSP) Header
* Common HTTP [Security Headers](https://securityheaders.com/)
* Don't send any Referrer
* No Cookies (If not necessary)
* Minimal or no Logs
* automated daily updates
* automated daily restarts to avoid data accumulation
* Provide [Tor Onion services](https://community.torproject.org/onion-services/)
* Provide a [`/.well-known/security.txt`](https://securitytxt.org/)

additionally i have configured this on my deployments

* [HSTS preload](https://hstspreload.org/)
* Domain Name System Security Extensions (DNSSEC)
* DNS Certification Authority Authorization (CAA) with Let's Encrypt Account Binding


privacy friendly frontends i've included are:

### Bibliogram (REMOVED)

PROJECT DISCONTINUED https://cadence.moe/blog/2022-09-01-discontinuing-bibliogram

> An alternative front-end for Instagram.

[Sourcehut](https://sr.ht/~cadence/bibliogram/) [![Docker Pulls](https://img.shields.io/docker/pulls/cloudrac3r/bibliogram?style=plastic)](https://hub.docker.com/r/cloudrac3r/bibliogram) [![License](https://img.shields.io/badge/license-AGPL--3.0-important)](https://sr.ht/~cadence/bibliogram)

### Libreddit

> An alternative private front-end to Reddit

[![GitHub Repo stars](https://img.shields.io/github/stars/spikecodes/libreddit?style=social)](https://github.com/spikecodes/libreddit) ![GitHub last commit](https://img.shields.io/github/last-commit/spikecodes/libreddit) ![GitHub contributors](https://img.shields.io/github/contributors/spikecodes/libreddit) [![Docker Pulls](https://img.shields.io/docker/pulls/spikecodes/libreddit?style=plastic)](https://hub.docker.com/r/spikecodes/libreddit) ![GitHub](https://img.shields.io/github/license/spikecodes/libreddit)

### Jitsi Meet

> Jitsi Meet is an open-source (Apache) WebRTC JavaScript application that uses Jitsi Videobridge to provide high quality, secure and scalable video conferences.

[![GitHub Repo stars](https://img.shields.io/github/stars/jitsi/jitsi-meet?style=social)](https://github.com/jitsi/jitsi-meet) ![GitHub last commit](https://img.shields.io/github/last-commit/jitsi/jitsi-meet) ![GitHub contributors](https://img.shields.io/github/contributors/jitsi/jitsi-meet) [![Docker Pulls](https://img.shields.io/docker/pulls/jitsi/web)](https://hub.docker.com/r/jitsi/web) ![GitHub](https://img.shields.io/github/license/jitsi/jitsi-meet)

### Nitter

> A free and open source alternative Twitter front-end focused on privacy.

[![GitHub Repo stars](https://img.shields.io/github/stars/zedeus/nitter?style=social)](https://github.com/zedeus/nitter) ![GitHub last commit](https://img.shields.io/github/last-commit/zedeus/nitter) ![GitHub contributors](https://img.shields.io/github/contributors/zedeus/nitter) [![Docker Pulls](https://img.shields.io/docker/pulls/zedeus/nitter)](https://hub.docker.com/r/zedeus/nitter) ![GitHub](https://img.shields.io/github/license/zedeus/nitter)

### Whoogle

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


## Committing changes from deployment host back to repo

After checking out the repo on a host, local config changes need to be transfered
back to the repo.
To avoid getting my private ssh key on the host i prefer github's **fine-grained personal access token**.

## initial setup:
1. go to https://github.com/settings/personal-access-tokens/new
1. generate a new token only with permission to the specific repo and **Repository permissions** must have **read/write** for **Contents**.


## to use next time (single use token):
1. go to https://github.com/settings/personal-access-tokens/375481 (works in github my account only)
1. press **Regenerate token** with **Expiration: 7 days**
1. to go host
   ```
   git config user.email does@not.matter
   git config user.name pred2k
   ```
   and run `git push` login with username and the generated token as password.

More see https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-fine-grained-personal-access-token


# Host Backups

Use script on my MacBook Air `~/backup/linux-systems/docker-deployments-host/backup.sh`

