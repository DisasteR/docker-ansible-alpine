# Docker-Ansible base image

[![GitHub issues](https://img.shields.io/github/issues/DisasteR/docker-ansible-alpine.svg)](https://github.com/DisasteR/docker-ansible-alpine) [![Layers](https://images.microbadger.com/badges/image/DisasteR/ansible-alpine.svg)](https://microbadger.com/images/DisasteR/ansible-alpine) [![Docker Automated build](https://img.shields.io/docker/automated/akit042/ansible-alpine.svg?maxAge=2592000)](https://hub.docker.com/r/akit042/ansible-alpine/) [![Docker Pulls](https://img.shields.io/docker/pulls/akit042/ansible-alpine.svg)](https://hub.docker.com/r/akit042/ansible-alpine/)

## Usage

### Environnement variable

| Variable             | Default Value    | Usage                                       |
|----------------------|------------------|---------------------------------------------|
| PIP_REQUIREMENTS     | requirements.txt | install python library requirements         |
| ANSIBLE_REQUIREMENTS | requirements.yml | install ansible galaxy roles requirements   |
| DEPLOY_KEY           |                  | pass an SSH private key to use in container |

### Run Playbook

```
docker run -it --rm akit042/ansible-alpine:latest \
  -v ${PWD}:/ansible ansible-playbook -i inventory playbook.yml
```

### Generate Base Role structure

```
docker run -it --rm akit042/ansible-alpine:latest \
  -v ${PWD}:/ansible ansible-galaxy init role-name
```

### Lint Role

```
docker run -it --rm akit042/ansible-alpine:latest \
  -v ${PWD}:/ansible ansible-playbook tests/playbook.yml --syntax-check
```

### Run with forwarding ssh agent

```
docker run -it -rm \
  -v $(readlink -f $SSH_AUTH_SOCK):/ssh-agent \
  -e SSH_AUTH_SOCK=/ssh-agent \
  -e -v ${PWD}:/ansible \
  akit042/ansible-alpine:latest sh
```
