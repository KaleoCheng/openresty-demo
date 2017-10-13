Docker Registry + Openresty Demo


```shell
$ tree docker/certs/
docker/certs/
├── your-domain.crt
└── your-domain.key

0 directories, 2 files
```


```shell
$ cat /etc/hosts
127.0.0.1	localhost
127.0.0.1 your-domain
```


```shell
$ cd docker/
$ docker-compose up
```


```shell
$ curl https://your-domain/api/upstream/list
upstream_hub1
upstream_hub2

$ curl https://your-domain/api/upstream/detail
upstream_hub1
server 172.18.0.4:5000 weight=1 max_fails=1 fail_timeout=10 backup=0 down=0

upstream_hub2
server 172.18.0.5:5000 weight=1 max_fails=1 fail_timeout=10 backup=0 down=0

$ curl -d "server hub-3:5000;"  https://your-domain/api/upstream/upstream_hub3
success

$ curl https://your-domain/api/upstream/detail
upstream_hub1
server 172.18.0.4:5000 weight=1 max_fails=1 fail_timeout=10 backup=0 down=0

upstream_hub2
server 172.18.0.5:5000 weight=1 max_fails=1 fail_timeout=10 backup=0 down=0

upstream_hub3
server 172.18.0.3:5000 weight=1 max_fails=1 fail_timeout=10 backup=0 down=0

```

```shell
$ curl https://your-domain/api/upstream/switch?upstream=upstream_hub3
Current upstream is :nil
your-domain change upstream from nil to upstream_hub3
```

