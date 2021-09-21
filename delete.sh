#!/bin/bash -e
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
SRC_DIR="${SCRIPT_DIR}/k8s"
for MANIFEST in ingress.yml service.yml deployments.yml ; do\
    kubectl delete -f "${SRC_DIR}/${MANIFEST}"
done
