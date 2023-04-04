# Dockerized TSN Ranksystem
This is a dockerized tsn ranksystem image for teamspeak. Feel free to use it!

## Quick Links
* TSN-Ranksystem: [GitHub](https://github.com/Newcomer1989/TSN-Ranksystem) / [Website](https://ts-ranksystem.com/)
* Image Repository: [Dockerhub](https://hub.docker.com/r/ocelik94/tsn-ranksystem-docker)

## Usage
You can run the following docker-compose configuration. On first start you have to call `.../install.php` to finish the installation process.

```
version: '3'
services:
    ranksystem:
      build: .
      restart: always
      ports:
        - 8080:80
      volumes:
       - ./tsn/configs:/app/other
       - ./tsn/logs:/app/logs

    ranksystem-db:
      image: mariadb:10.6
      restart: always
      environment:
        MARIADB_RANDOM_ROOT_PASSWORD: 1
        MARIADB_USER: ${MARIADB_USER}
        MARIADB_PASSWORD: ${MARIADB_PASSWORD}
        MARIADB_DATABASE: ${MARIADB_DATABASE}
      volumes:
        - ./tsn/db/:/var/lib/mysql
```

## Credits
* Thanks to [ionpgractal](https://github.com/ionphractal/docker-tsn-ranksystem) for giving me a good entrypoint to create this project
