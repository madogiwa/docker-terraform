
FROM alpine AS build

ENV TERRAFORM_VERSION=0.11.7

RUN wget -O /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip /terraform.zip


FROM alpine
LABEL maintainer="Hidenori Sugiyama <madogiwa@gmail.com>"

COPY --from=build /terraform /usr/local/bin/terraform

ENV WORKSPACE /workspace
WORKDIR ${WORKSPACE}

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
