#!/bin/sh

#VALUES="values.yaml"
VALUES="values-seed.yaml"


curl -fks --connect-timeout 5 https://git.dunkum.eu \
    || VALUES="values-seed.yaml"

helm template \
    --include-crds \
    --namespace argocd \
    --values "${VALUES}" \
    argocd . \
    | kubectl apply -n argocd -f -
