# Docker-Ansible base image

![Pipeline](https://gitlab.com/pad92/docker-ansible-alpine/badges/master/pipeline.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/pad92/ansible-alpine)](https://hub.docker.com/r/pad92/ansible-alpine/)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/pad92/ansible-alpine/latest)
## Usage

### Environnement variable

| Variable             | Default Value    | Usage                                       |
|----------------------|------------------|---------------------------------------------|
| PIP_REQUIREMENTS     | requirements.txt | install python library requirements         |
| ANSIBLE_REQUIREMENTS | requirements.yml | install ansible galaxy roles requirements   |
| DEPLOY_KEY           |                  | pass an SSH private key to use in container |

### Mitogen

To enable mitogen, add this configuration into defaults in defaults.cfg file
```
action_plugins = ~/.ansible/plugins/action:/usr/share/ansible/plugins/action
strategy_plugins = /opt/mitogen/ansible_mitogen/plugins/strategy
strategy = mitogen_linear
```

### Run Playbook

```
docker run -it --rm \
  -v ${PWD}:/ansible \
  pad92/ansible-alpine:latest \
  ansible-playbook -i inventory playbook.yml
```

### Generate Base Role structure

```
docker run -it --rm \
  -v ${PWD}:/ansible \
  pad92/ansible-alpine:latest \
  ansible-galaxy init role-name
```

### Lint Role

```
docker run -it --rm pad92/ansible-alpine:latest \
  -v ${PWD}:/ansible ansible-playbook tests/playbook.yml --syntax-check
```
### Run with forwarding ssh agent

```
docker run -it --rm \
  -v $(readlink -f $SSH_AUTH_SOCK):/ssh-agent \
  -v ${PWD}:/ansible \
  -e SSH_AUTH_SOCK=/ssh-agent \
  pad92/ansible-alpine:latest \
  sh
```
