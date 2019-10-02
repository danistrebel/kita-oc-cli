mkdir -p bin/oc

curl -L https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz --output /tmp/oc-cli.tar.gz

tar -xf /tmp/oc-cli.tar.gz -C ./bin/oc --strip-components 1

export PATH=$(pwd)/bin/oc:$PATH

SA_TOKEN=$(</var/run/secrets/kubernetes.io/serviceaccount/token)

oc login --token $SA_TOKEN --certificate-authority /var/run/secrets/kubernetes.io/serviceaccount/ca.crt kubernetes.default