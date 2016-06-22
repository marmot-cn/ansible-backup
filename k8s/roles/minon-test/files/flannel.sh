#!/bin/bash

# Copyright 2014 The Kubernetes Authors All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


ETCD_SERVERS=${1:-""}
ETCD_KEY=${2:-""}
FLANNEL_NET=${3:-"172.16.0.0/16"}

cat <<EOF >/opt/kubernetes/cfg/flannel
FLANNEL_ETCD="-etcd-endpoints=${ETCD_SERVERS}"
FLANNEL_ETCD_KEY="-etcd-prefix=${ETCD_KEY}"
EOF

cat <<EOF >/usr/lib/systemd/system/flannel.service
[Unit]
Description=Flanneld overlay address etcd agent
After=network.target
Before=docker.service

[Service]
EnvironmentFile=-/opt/kubernetes/cfg/flannel
ExecStartPre=/usr/local/bin/remove-docker0.sh
ExecStart=/usr/bin/flanneld --ip-masq \${FLANNEL_ETCD} \${FLANNEL_ETCD_KEY}
ExecStartPost=/usr/local/bin/mk-docker-opts.sh -d /run/flannel/docker

Type=notify

[Install]
WantedBy=multi-user.target
RequiredBy=docker.service
EOF

# Store FLANNEL_NET to etcd.
#attempt=0
#while true; do
 # /usr/bin/etcdctl --no-sync -C ${ETCD_SERVERS} \
  #  get ${ETCD_KEY}/config >/dev/null 2>&1
  #if [[ "$?" == 0 ]]; then
   # break
  #else
   # if (( attempt > 600 )); then
    #  echo "timeout for waiting network config" > ~/kube/err.log
     # exit 2
   #fi

#    /usr/bin/etcdctl --no-sync -C ${ETCD_SERVERS} \
#      mk ${ETCD_KEY}/config "{\"Network\":\"${FLANNEL_NET}\"}" >/dev/null 2>&1
#   attempt=$((attempt+1))
#    sleep 3
#  fi
#done
#wait

systemctl daemon-reload
