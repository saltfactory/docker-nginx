docker-nginx
============

docker-nginx는 [NGINX](http://nginx.org/)를 docker에서 운영하기 위한 Dockerfile 이 포함되어 있습니다.

docker-nginx 설치
================

GitHub에서 docker-nginx를 `clone` 합니다.

```
git clone https://github.com/saltfactory/docker-nginx.git
```

`docker build` 명령어를 사용하여 이미지를 만듭니다.

```
docker build -t saltfactory/nginx .
```

docker-nginx는 보다 유연하고 여러 서버에서 운영할 수 있기 위해서 nginx의 설정 파일과 log 파일을 로컬 PC에서 마운트할 수 있습니다.
docker-nginx 안에는 `sites-enabled/`과 `log/nginx/` 디렉토리가 포함되어 있습니다. 필요하다면 site-enabled 디렉토리 안에 nginx 설정 파일을 수정하거나 추가합니다.

docker-nginx 시작
=================

docker-nginx를 시작하기 위해서는 `docker run` 명령어를 사용합니다.
이때, `sites-enabled/`과 `log/nginx/` 디렉토리를 마운트할 수 있게 지정합니다.

```
docker run --name nginx \
-d -p 8080:80 \
-v $(PWD)/sites-enabled:/etc/nginx/sites-enabled \
-v $(PWD)/log/nginx:/var/log/nginx \
saltfactory/nginx

```
또는 docker-nginx에 포함되어 있는 `run-nginx.sh`를 실행합니다.

```
sh run-nginx.sh
```

docker-nginx가 실행되면 `docker ps`로 nginx가 정상적으로 실행되고 있는지 확인합니다.


docker-nginx 종료
================

docker-nginx를 종료하기 위해서는 `docker stop` 명령을 사용합니다.

```
docker stop nginx
```
