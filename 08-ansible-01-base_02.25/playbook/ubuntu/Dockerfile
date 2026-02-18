FROM ubuntu:22.04

# Устанавливаем Python и необходимые пакеты
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python3 \
    python3-apt \
    sudo \
    openssh-server \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && useradd -m ansible \
    && echo 'ansible:ansible' | chpasswd \
    && mkdir /var/run/sshd \
    && ssh-keygen -A

# Настраиваем sudo для ansible
RUN echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
