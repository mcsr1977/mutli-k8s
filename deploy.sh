docker build -t mcsr1977/multi-client:latest -t mcsr1977/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t mcsr1977/multi-server:latest -t mcsr1977/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t mcsr1977/multi-worker:latest -t mcsr1977/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push mcsr1977/multi-client:latest
docker push mcsr1977/multi-server:latest
docker push mcsr1977/multi-worker:latest

docker push mcsr1977/multi-client:$SHA
docker push mcsr1977/multi-server:$SHA
docker push mcsr1977/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=mcsr1977/multi-server:$SHA
kubectl set image deployments/client-deployment client=mcsr1977/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=mcsr1977/multi-worker:$SHA