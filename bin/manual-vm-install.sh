for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do apt-get remove $pkg; done

mkfs /dev/$(lsblk|grep 100G|awk '{print $1}')

e2label /dev/$(lsblk|grep 100G|awk '{print $1}') DOCKER

echo 'LABEL=DOCKER /var/lib/docker/ ext4 defaults,noatime,nodiratime,nodev,nosuid,noexec 0 2'|tee -a /etc/fstab

mkdir /var/lib/docker

mount -a

systemctl daemon-reload

apt-get update

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

chmod a+r /etc/apt/keyrings/docker.gpg

echo   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |  tee /etc/apt/sources.list.d/docker.list

apt-get update

apt-get install docker-ce containerd.io docker-buildx-plugin docker-compose-plugin -y

