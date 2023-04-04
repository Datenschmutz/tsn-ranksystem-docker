# Dockerized TSN Ranksystem
This is a dockerized tsn ranksystem image for teamspeak

## Quick Links
* TSN-Ranksystem: [GitHub](https://github.com/Newcomer1989/TSN-Ranksystem) / [Website](https://ts-ranksystem.com/)

## Usage

```
version: '3'
services:
    ranksystem:
      build: .
      restart: always
      ports:
        - 8080:80
      volumes:
       - ./configs:/app/other
       - ./logs:/app/logs

    ranksystem-db:
      image: mariadb:10.6
      restart: always
      environment:
        MARIADB_USER: ranksystem
        MARIADB_PASSWORD: ranksystem
        MARIADB_ROOT_PASSWORD: root
        MARIADB_DATABASE: ranksystem
      volumes:
        - ./ranksystem-db/:/var/lib/mysql
```

## Credits
* Thanks to [ionpgractal](https://github.com/ionphractal/docker-tsn-ranksystem) for giving me a good entrypoint to create this project
