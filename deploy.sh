docker build -t ovist/section14-client:latest -t ovist/section14-client:$SHA -f ./client/Dockerfile ./client
docker build -t ovist/section14-server:latest -t ovist/section14-server:$SHA -f ./server/Dockerfile ./server
docker build -t ovist/section14-worker:latest -t ovist/section14-worker:$SHA -f ./worker/Dockerfile ./worker
docker push ovist/section14-client:latest
docker push ovist/section14-server:latest
docker push ovist/section14-worker:latest
docker push ovist/section14-client:$SHA
docker push ovist/section14-server:$SHA
docker push ovist/section14-worker:$SHA

kubectl apply -f ./k8s
kubectl set image deployment/client-deployment client=ovist/section14-client:$SHA
kubectl set image deployment/server-deployment server=ovist/section14-server:$SHA
kubectl set image deployment/worker-deployment worker=ovist/section14-worker:$SHA
