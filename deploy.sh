docker build -t ovist/section14-client:latest -t ovist/section14-client:$SHA -f ./client/Docker ./client
docker build -t ovist/section14-server:latest -t ovist/section14-server:$SHA -f ./server/Docker ./server
docker build -t ovist/section14-worker:latest -t ovist/section14-worker:$SHA -f ./worker/Docker ./worker
docker push ovist/section14-client:latest
docker push ovist/section14-server:latest
docker push ovist/section14-worker:latest
docker push ovist/section14-client:$SHA
docker push ovist/section14-server:$SHA
docker push ovist/section14-worker:$SHA

kubectl -f apply ./k8s
kubectl set image deployments/client-deployment client=ovist/section14-client:$SHA
kubectl set image deployments/server-deployment server=ovist/section14-server:$SHA
kubectl set image deployments/worker-deployment worker=ovist/section14-worker:$SHA
