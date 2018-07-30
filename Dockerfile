FROM python:2.7

ENV GCLOUD_VERSION="209.0.0" \
    PATH="/google-cloud-sdk/bin:$PATH"

WORKDIR /

RUN apt-get update -qq && \
    apt-get install -y -qq curl ruby && \
    pip install pyopenssl && \
    curl -LO "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz" && \
    tar -xzf google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz && \
    yes | gcloud components install kubectl

ADD kubefed /usr/local/bin/
RUN chmod +x /usr/local/bin/kubefed
