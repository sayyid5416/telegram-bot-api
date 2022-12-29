## --------------------------------------- Building process --------------------------------------- ##
FROM alpine:latest as build

WORKDIR /telegram-bot-api
COPY telegram-bot-api /telegram-bot-api
ENV CXXFLAGS=""

RUN apk add --no-cache --update \
  alpine-sdk \
  cmake \
  git \
  gperf \
  linux-headers \
  openssl-dev \
  zlib-dev

RUN mkdir -p build \
  && cd build \
  && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. .. \
  && cmake --build . --target install -j $(nproc) \
  && strip /telegram-bot-api/bin/telegram-bot-api



## ------------------------------------------ Main Image ------------------------------------------ ##
# BASE image
FROM alpine:latest

# Install packages
RUN apk add --no-cache --update \
  libstdc++ \
  openssl

# Copy files
COPY --from=build /telegram-bot-api/bin/telegram-bot-api /usr/local/bin/telegram-bot-api
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Build args > Version of telegram-bot-api & docker-image
ARG TG_VERSION="NA"

# Environment Variables 
ENV TELEGRAM_WORK_DIR="/file" \
    TELEGRAM_TEMP_DIR="/tmp" \
    MACHINE_USERNAME="telegram-bot-api" \
    MACHINE_GROUPNAME="telegram-bot-api" \
    PORT1="8081" \
    PORT2="8082" \
    TG_VERSION=${TG_VERSION}
ENV DEFAULT_ARGS="--http-port ${PORT1} --dir=${TELEGRAM_WORK_DIR} --temp-dir=${TELEGRAM_TEMP_DIR} --username=${MACHINE_USERNAME} --groupname=${MACHINE_GROUPNAME}"

# Add user > Create directories > Change ownership > Make eecutable
RUN addgroup -g 777 -S ${MACHINE_GROUPNAME} \
  && adduser -S -D -H -u 777 -h ${TELEGRAM_WORK_DIR} -s /sbin/nologin -G ${MACHINE_GROUPNAME} -g ${MACHINE_GROUPNAME} ${MACHINE_USERNAME} \
  && mkdir -p ${TELEGRAM_WORK_DIR} ${TELEGRAM_TEMP_DIR} \
  && chown -R ${MACHINE_USERNAME}:${MACHINE_GROUPNAME} ${TELEGRAM_WORK_DIR} ${TELEGRAM_TEMP_DIR} \
  && chmod +x /docker-entrypoint.sh

# Expose Ports
EXPOSE ${PORT1} ${PORT2}

# Start the program
ENTRYPOINT ["/docker-entrypoint.sh"]
