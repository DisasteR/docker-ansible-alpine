# Docker-Ansible base image

[![pipeline status](https://git.depad.fr/ansible/docker-ansible-alpine/badges/master/pipeline.svg)](https://git.depad.fr/ansible/docker-ansible-alpine/pipelines/)

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
