.PHONY: create-volume run-playbook reset-podman

create-volume:
    sudo podman volume create chris-db

run-playbook:
    sudo podman play kube plaything.yaml --configmap=secrets.yml

reset-podman:
    sudo podman system reset