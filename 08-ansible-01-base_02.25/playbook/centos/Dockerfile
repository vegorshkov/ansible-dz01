FROM centos:7

# Исправляем репозитории на vault (для EOL CentOS7)
RUN sed -i 's|mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-* \
    && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Обновляем и ставим необходимые пакеты
RUN yum -y update \
    && yum -y install openssh-server sudo python3 \
    && mkdir /var/run/sshd \
    && ssh-keygen -A \
    && useradd -m ansible \
    && echo 'ansible:ansible' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

