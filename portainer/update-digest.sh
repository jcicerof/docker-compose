#!/usr/bin/env bash
set -e

TAG="2.33.2-lts"
IMAGE="portainer/portainer-ce:${TAG}"

echo "Obtendo digest da imagem: ${IMAGE}"
DIGEST=$(docker buildx imagetools inspect "${IMAGE}" | grep -m1 "sha256:" | head -n1 | awk '{print $2}')

if [ -z "$DIGEST" ]; then
    echo "Nao foi possivel obter o digest!"
    exit 1
fi

echo "Digest encontrado:"
echo "$DIGEST"

echo "Atualizando Dockerfile"
sed -i "s|FROM portainer/portainer-ce@sha256:.*|FROM portainer/portainer-ce@${DIGEST}|g" Dockerfile

echo "Rebuild da imagem local"
docker build -t portainer-ce:${TAG} .

echo "Atualizacao concluida!"
echo "Digest usado: ${DIGEST}"

