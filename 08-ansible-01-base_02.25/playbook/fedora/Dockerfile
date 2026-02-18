FROM fedora:latest
RUN dnf -y install python3 sudo openssh-server \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && useradd -m ansible \
    && echo 'ansible:ansible' | chpasswd \
    && ssh-keygen -A \
    && echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
