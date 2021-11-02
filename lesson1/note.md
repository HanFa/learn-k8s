# 环境的准备

docker daemon
kubectl
kind
kubectx
kubens

# 如何使用kind来新建一个k8s cluster

create: `kind create cluster --config=kind-cluster.yaml`
delete: `kind delete cluster`

# 创建容器化的应用 greeter 并将其上传至 dockerhub

`cd app && docker build . -t hanfa/greeter:v1.0.0 && docker push hanfa/greeter:v1.0.0`

# 新建一个pod来部署我们的greeter container

1. 使用manifest来描述这个pod
2. 使用`kubectl apply -f <manifest.yaml>`来描述性地部署资源
3. 使用`kubectl edit <resource> <name>`来修改资源
4. 使用`kubectl delete -f <manifest.yaml>`来删除资源
