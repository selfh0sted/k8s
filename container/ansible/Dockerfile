FROM ubuntu:jammy
ARG DEBIAN_FRONTEND=noninteractive
RUN apt -y update
RUN apt -y install gpg wget ssh software-properties-common

RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com jammy main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt -y update

RUN apt -y install terraform python3.11 pip
RUN python3 -m pip install ansible
COPY terraform.py /etc/ansible/terraform.py
COPY ansible.cfg /etc/ansible/ansible.cfg
RUN chmod a+x /etc/ansible/terraform.py
