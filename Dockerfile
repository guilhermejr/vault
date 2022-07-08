FROM ubuntu:22.04
LABEL maintainer="Guilherme Jr. <falecom@guilhermejr.net>" 
ENV DEBIAN_FRONTEND=noninteractive
ENV ACCEPT_EULA=Y
ENV TZ=America/Bahia
WORKDIR /root
ENTRYPOINT bash /root/iniciar.sh
EXPOSE 8200
RUN \
        apt update && apt install gpg vim wget lsb-release -y && \
        wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null && \
        gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint && \
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
        apt dist-upgrade -y && \
        apt update && apt install vault -y && \
        mkdir -p vault/data
COPY vault-config.hcl /root/vault-config.hcl
COPY iniciar.sh /root/iniciar.sh