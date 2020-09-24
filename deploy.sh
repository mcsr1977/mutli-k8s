docker build -t mcsr1977/multi-client:latest -t mcsr1977/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t mcsr1977/multi-server:latest -t mcsr1977/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t mcsr1977/multi-worker:latest -t mcsr1977/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push mcsr1977/multi-client:latest
docker push mcsr1977/multi-server:latest
docker push mcsr1977/multi-worker:latest

docker push mcsr1977/multi-client:$SHA
docker push mcsr1977/multi-server:$SHA
docker push mcsr1977/multi-worker:$SHA
