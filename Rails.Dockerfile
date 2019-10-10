FROM ruby:2.6.2-alpine as builder

RUN apk add --no-cache \
  build-base \
  busybox \
  ca-certificates \
  curl \
  git \
  gnupg1 \
  graphicsmagick \
  libffi-dev \
  libsodium-dev \
  nodejs \
  openssh-client \
  rsync \
  sqlite-dev \
  sqlite \
  tzdata \
  yarn

RUN mkdir -p /app
WORKDIR /app

EXPOSE 3000
CMD ["./docker-entrypoint.sh"]
