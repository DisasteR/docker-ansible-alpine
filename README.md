# Docker-Ansible base image

[![GitHub issues](https://img.shields.io/github/issues/pad92/docker-ansible-alpine.svg)](https://github.com/pad92/docker-ansible-alpinek)
[![Docker Automated build](https://img.shields.io/docker/automated/pad92/ansible-alpine.svg?maxAge=2592000)](https://hub.docker.com/r/pad92/ansible-alpine/)
[![Docker Pulls](https://img.shields.io/docker/pulls/pad92/ansible-alpine.svg)](https://hub.docker.com/r/pad92/ansible-alpine/)


## Usage

### Environnement variable

| Variable             | Default Value    | Usage                                       |
|----------------------|------------------|---------------------------------------------|
| PIP_REQUIREMENTS     | requirements.txt | install python library requirements         |
| ANSIBLE_REQUIREMENTS | requirements.yml | install ansible galaxy roles requirements   |
| DEPLOY_KEY           |                  | pass an SSH private key to use in container |

### Run Playbook

```
docker run -it --rm pad92/ansible-alpine:latest \
  -v ${PWD}:/ansible ansible-playbook -i inventory playbook.yml
```

### Generate Base Role structure

```
docker run -it --rm pad92/ansible-alpine:latest \
  -v ${PWD}:/ansible ansible-galaxy init role-name
```

### Lint Role

```
docker run -it --rm pad92/ansible-alpine:latest \
  -v ${PWD}:/ansible ansible-playbook tests/playbook.yml --syntax-check
```
