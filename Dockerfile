FROM node:lts-alpine

EXPOSE 8000

WORKDIR /app
COPY package.json yarn.lock index.js settings.js /app/

RUN set -ex; \
    node --version; \
    yarn --version; \
    yarn --prod; \
    yarn cache clean

COPY views /app/views

CMD ["node", "/app/index"]

# Arguments to label built container
ARG VCS_REF=unknown
ARG BUILD_DATE=unknown
ARG VERSION=1.4.0

# Container labels (http://label-schema.org/)
# Container annotations (https://github.com/opencontainers/image-spec)
LABEL org.opencontainers.image.source="https://github.com/RussellSchutle/autodiscover-email-settings"
