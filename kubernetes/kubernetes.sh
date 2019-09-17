#!/bin/bash
#Google Cloud Platform 
setenforce 0
systemctl stop firewalld 

# update hostname
vi /etc/hosts
192.168.1.30 k8s-master

#Add kubernetes repo

vi /etc/yum.repos.d/kubernetes.repo

[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg

#install kubeadm kubectl,kubelet
yum install -y kubeadm docker

#enable services

systemctl start docker && systemctl enable docker
systemctl start kubelet && systemctl enable kubelet

#vi /etc/fstab
swapoff -a
#----------------------------------------
vi /etc/sysctl.conf

net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
#----------------------------------------------

sysctl -p


sudo kubeadm init --pod-network-cidr=172.30.0.0/16 

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml




#on Node
kubeadm join 10.160.0.25:6443 --token 60l5yn.tf4zehw4s155oz2d --discovery-token-ca-cert-hash sha256:178b9dd26e943a7e195e8ff4efe57f4f548bfd83d94efa4d3a5bc596bd020578


#on Master
git clone https://github.com/learnitguide/kubernetes.git
cd kubernetes
cd httpd
kubectl apply -f httpd-basic-deployment.yml
kubectl get deployment
kubectl describe deployment my-apache-deployment

kubectl apply -f httpd-basic-service.yml
kubectl get svc -o wide
kubectl get service


kubectl get pods
kubectl exec -it my-apache-deployment-644b88c7bf-78kx8 bash

kubectl cluster-info












