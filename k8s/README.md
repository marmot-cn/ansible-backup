# k8s 剧本介绍

---

主要分为2个`roles`.

* master : k8s master 配置
* minon : k8s minon 配置

现在都是用`-test`为后缀.等用于生产环境在修改命名


### 一些bug

这里在k8s部署完,我使用的1.2.4版本,需要在minon节点添加如下路由:

		ip route add SERVICE_CLUSTER_IP_RANG dev docker0
		
`SERVICE_CLUSTER_IP_RANG`是在`kube-apiserver`配置文件中设置的k8s.services的ip分配范围.
		
否则会出现访问service的clusterIp跨节点不通的情况.