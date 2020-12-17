<strong>Supporting Articles:</strong>

- [Cloudflare Settings for Traefik Docker: DDNS, CNAMEs, & Tweaks](https://www.smarthomebeginner.com/cloudflare-settings-for-traefik-docker/)
- [Google OAuth 2 MFA Protection for Docker](https://www.smarthomebeginner.com/google-oauth-with-traefik-docker/)
- [Authelia MFA Protection for Docker](https://www.smarthomebeginner.com/docker-authelia-tutorial/)
- [Traefik Docker Security Best Practices](https://www.smarthomebeginner.com/traefik-docker-security-best-practices/)

### Traefik 2 (CURRENT - GENERIC LINUX)

- docker-compose.yml

### Traefik 2 (CURRENT - SYNOLOGY)

- docker-compose-synology.yml (Apps that I run on Synology NAS using Docker Compose)
- Almost any app from the Traefik v2 docker-compose files listed above can be copy-pasted to the Synology Docker-Compose. I run a few on Synology and the rest on my Intel NUC Linux home server.

## What apps are included in this stack?

We will try to keep this repo up-to-date. For now, here are the apps currently included in our stack:

### FRONTENDS

In paranthesis, the system on which it runs.

- LINUX - CentOS 7
- SYNOLOGY - Synology DS918+ NAS

See the corresponding Docker Compose file for the compose snippet.

- Traefik - Reverse Proxy (LINUX AND SYNOLOGY)
- Docker Socket Proxy - Secure Proxy for Docker API (LINUX AND SYNOLOGY)
- Traefik Custom Error Pages (LINUX)
- OAuth - Google OAuth 2 Forward Authentication (LINUX AND SYNOLOGY)
- Authelia - Private Forward Authentication (LINUX AND SYNOLOGY)
- Portainer - Container Management (LINUX AND SYNOLOGY)
- Organizr - Unified Frontend (LINUX)
- Heimdall - Unified Frontend Alternative (LINUX)
- Autoindex - Plain text Index to All Files (LINUX)

### SMART HOME

- Home Assistant Core - Home Automation (LINUX)
- Mosquitto - MQTT Broker (SYNOLOGY)
- MotionEye - Video Surveillance (LINUX)

### DATABASE

- MariaDB - MySQL Database (LINUX AND SYNOLOGY)
- phpMyAdmin - Database management (LINUX)
- InfluxDB - Database for sensor data (LINUX AND SYNOLOGY)
- Redis - Key value store (LINUX AND SYNOLOGY)
- Redis Commander - Redis management (LINUX)

### MONITORING
- Grafana - Graphical data visualization for InfluxDB data (LINUX)
- Varken - Monitor Plex, Sonarr, Radarr, and Other Data (LINUX)
- Healthchecks (LINUX)
- Glances - System Information (LINUX AND SYNOLOGY)
- APCUPSD - APC UPS Management (LINUX)
- StatPing - Status Page & Monitoring Server (LINUX)

### DOWNLOADERS

- ruTorrent - Torrent Downloader
- jDownloader - Download management (LINUX)
- TransmissionBT with VPN - Torrent Downloader with [IPVanish](https://www.smarthomebeginner.com/go/ipvanish) VPN. (LINUX)
- SABnzbd - Binary newsgrabber, NZB downloader (LINUX)

### INDEXERS

- NZBHydra2 - NZB meta search (LINUX)
- Jackett - Torrent proxy (LINUX)

### PVRS

- Lidarr - Music Management (LINUX)
- Radarr - Movie management (LINUX)
- Sonarr - TV Shows management (LINUX)
- LazyLibrarian - Books Management (LINUX)

### MEDIA SERVER

- AirSonic - Music Server (LINUX)
- Calibre - Ebook/Audiobook Server (LINUX)
- Calibre-Web - Ebook/Audiobook Reader (LINUX)
- Plex - Media Server (LINUX AND SYNOLOGY)
- Emby - Media Server (LINUX)
- Jellyfin - Media Server (LINUX)
- Ombi - Media Requests (LINUX)
- Tautulli - Previously PlexPy. Plex statistics and monitoring (LINUX)
- Plex-Sync - For Syncing watched status between plex servers (LINUX)
- PhotoShow - Personal Photo Gallery and viewer (LINUX)
- xTeve- IPTV proxy for Plex (LINUX)

### MEDIA FILE MANAGEMENT

- Bazarr - Subtitle Management (LINUX)
- Picard - Music Library Tagging and Management (LINUX)
- Handbrake - Video Conversion, Transcoding, and Compression (LINUX)
- MKVToolNix - Video Editing, Remuxing (changing media container while keeping original source quality) (LINUX)
- MakeMKV - Video Editing (Ripping from Disks) (LINUX)
- FileBot - File renamer (LINUX)

### UTILITIES

- Firefox - Web Broswer (LINUX)
- Duplicati - Backup App (LINUX)
- Guacamole - Remote desktop, SSH, on Telnet on any HTML5 Browser (LINUX)
- Guacamole Daemon - Needed for Guacamole (LINUX)
- Dozzle - Docker logs viewer (LINUX)
- qDirStat - Directory Statistics (LINUX)
- VS Code Server - Code Editor (LINUX)
- Cloud Commander - Web File Manager (OBSOLETE)
- SMTP To Telegram - Sends all incoming Email messages to Telegram (LINUX)

### WEB

- Nginx - Web Server (LINUX)
- php7 - PHP-FPM (LINUX)

### MAINTENANCE

- Watchtower - Automatic Docker Container Updates (LINUX AND SYNOLOGY)
- Docker-GC - Automatic Docker Garbage Collection (LINUX AND SYNOLOGY)
- Traefik Certificate Dumper - Extract Traefik SSL Certs (LINUX)
- Cloudflare DDNS - Dynamic IP Updater (LINUX AND SYNOLOGY)
- Cloudflare Companion - Automatic CNAME creation for services (LINUX)

# Usage

## Installation

First, install Docker and Docker Compose.

1. Clone the repo.
2. Execute preparation.sh to create base files
3. Configure Traefik Docker-Compose snippet and CLI arguments.

- Edit domain name.
- DNS Challenge (for LetsEncrypt verification) is enabled by default for cloudflare. Use the [Traefik Reverse Proxy guide](https://www.smarthomebeginner.com/traefik-reverse-proxy-tutorial-for-docker/) for help with this.
- For other providers other than cloudflare, [check here](https://docs.traefik.io/v2.0/https/acme/#providers).

4. (Optional) Enable or use HTTP Basic Authentication by renaming `shared\.htpasswd.example` to `shared\.htpasswd` in the folder and adding username and hashed password to it.

5. Configure environmental variables (`.env` file)

- Edit variables in `.env` file.
- All variables (ie. `${XXX}`) in docker-compose.yml come from `.env` file stored in the same place as docker-compose.yml.
- Ensure good permissions for the `.env` file (recommended: 640).

6. Edit `docker-compose.yml` to include only the services you want or add additional services to it. Be sure to read the comments for each app and create any required files. You can copy snippets between any of the various docker-compose files in the repo.

7. Edit secrets according to your needs

8. Create networks
  - docker network create t2_proxy
  - docker network create socket_proxy
  
9. Start your docker stack.

10. (Optional) Put non-docker apps behind Traefik proxy by creating traefik rules based on the examples provided.


## ToDo - New Apps Coming

 - TellyTv- IPTV proxy for Plex
 - More apps...
 - Cleaning .env file
