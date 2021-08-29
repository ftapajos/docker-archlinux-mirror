# docker-archlinux-mirror
A docker image for people that want to become an archlinux mirror.

NGINX serves the files via both HTTP and HTTPs

## How to use ?

### Environment variables

Create a file named ``.env`` on the repo root containing:

```
    ARCHLINUX_T1_RSYNC_URL=<Rsync url>
    CERTBOT_AGREE_FLAG=<Agreement flag>
    CERTBOT_EMAIL=<Mail address>
    URL_AUTHORITY=<Hostname>
```

* `ARCHLINUX_T1_RSYNC_URL`: The rsync url of the chosen [Tier 1 mirror](https://archlinux.org/mirrors/tier/1/);
* `CERTBOT_AGREE_FLAG`: Must have the value `--agree-tos`. By setting this variable, one agrees with [ACME server's Subscriber Agreement](https://certbot.eff.org/docs/using.html);
* `CERTBOT_EMAIL`: Email address of the responsible for maintaining the ca certificate;
* `URL_AUTHORITY`: Hostname for which the ca certificate will be signed.

Just `docker-compose build && docker-compose up -d`. The data will be stored on
a volume. It is then persistent.


## Which upstream mirror to choose ?
By default it uses the  upstream `mirror.de.leaseweb.net` mirror, but you can change that following your network distance
to another upstream simply by defining ``ARCHLINUX_T1_RSYNC_URL`` environment variable.

The synchronisation date is set randomly at the launching of the image and 
occurs every 2 hours. You can change this time editing the `update/mirror.sh` 
file.

