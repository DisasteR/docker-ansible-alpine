FROM alpine:latest

LABEL maintainer="Pascal A. <pascalito@gmail.com>"

ENV ANSIBLE_VERSION=2.4.1.0
ARG BUILD_NAME="Ansible 2.4.1.0"
ARG BUILD_DATE="N/A"
ARG BUILD_VCSREF="N/A"

LABEL maintainer="pascalito@gmail.com" \
      org.label-schema.name="${BUILD_NAME}" \
      org.label-schema.description="Ansible on alpine docker image" \
      org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.vcs-ref="${BUILD_VCSREF}" \
      org.label-schema.version=$VERSION \


RUN echo "===> Adding Python runtime..."                                && \
    apk --update add python py-pip openssl ca-certificates              && \
    apk --update add --virtual build-dependencies \
                python-dev libffi-dev openssl-dev build-base            && \
    echo "===> Installing handy tools (not absolutely required)..."     && \
    apk --update add sshpass openssh-client rsync                       && \
    echo "===> Installing Ansible dependencies..."                      && \
    pip install --upgrade pip cffi                                      && \
    echo "===> Installing Ansible..."                                   && \
    pip install ansible==${ANSIBLE_VERSION}                             && \
    echo "===> Removing package list..."                                && \
    rm -rf /var/cache/apk/*                                             && \
    echo "===> Adding hosts for convenience..."                         && \
    mkdir -p /etc/ansible                                               && \
    echo 'localhost' > /etc/ansible/hosts                               && \
    echo "===> Disabling SSH HostKey Checking..."                       && \
    echo -e """\
\n\
Host *\n\
    StrictHostKeyChecking no\n\
    UserKnownHostsFile=/dev/null\n\
""" >> /etc/ssh/ssh_config

COPY entrypoint /usr/local/bin/

WORKDIR /ansible

ENTRYPOINT ["entrypoint"]

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
