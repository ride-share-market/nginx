## NGINX Docker

- `git clone git@github.com:ride-share-market/nginx.git`
- `cd nginx && git checkout develop`

## Requirements

### SSL Certificates

Copy ridesharemarket.com.cert ridesharemarket.com.key from keepass to ssl/

## Build local and run for testing.

- `sudo docker build -t ride-share-market/rsm-nginx:x.x.x .`
- `sudo docker run -d --name rsm-nginx --volumes-from rsm-app -p 80:80 -t ride-share-market/rsm-nginx:x.x.x`
- `sudo docker rm -f -v rsm-nginx && sudo docker run -d --name rsm-nginx --volumes-from rsm-app -p 80:80 -t ride-share-market/rsm-nginx:x.x.x`

## Build and Deploy to local VM

Build docker image locally, tag it, push it to the private docker registry.

- `./docker-build.sh x.x.x`

Deploy on local VM.

- `sudo docker pull 192.168.33.10:5000/ride-share-market/rsm-nginx:x.x.x`
- Initial.
- `sudo docker run -d --restart always --name rsm-nginx --volumes-from rsm-app --link rsm-app:rsm-app --link rsm-api:rsm-api -p 80:80 -p 443:443 192.168.33.10:5000/ride-share-market/rsm-nginx:x.x.x`
- Replace running container.
- `sudo docker rm -f -v rsm-nginx && sudo docker run -d --restart always --name rsm-nginx --volumes-from rsm-app --link rsm-app:rsm-app --link rsm-api:rsm-api -p 80:80 -p 443:443 192.168.33.10:5000/ride-share-market/rsm-nginx:x.x.x`

## Utils

- Get inside the running container
- `sudo docker exec -i -t rsm-nginx /bin/bash`
