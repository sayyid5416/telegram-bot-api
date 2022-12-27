## --------------------------------------- Building process --------------------------------------- ##
FROM alpine:latest as build

WORKDIR /telegram-bot-api
COPY telegram-bot-api /telegram-bot-api
ENV CXXFLAGS=""

RUN apk add --no-cache --update \
  alpine-sdk linux-headers openssl-dev \
  git zlib-dev gperf cmake

RUN mkdir -p build \
  && cd build \
  && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. .. \
  && cmake --build . --target install -j $(nproc) \
  && strip /telegram-bot-api/bin/telegram-bot-api



## ------------------------------------------ Main Image ------------------------------------------ ##
# BASE image
FROM alpine:latest

# Install packages
RUN apk add --no-cache --update openssl libstdc++

# Copy files
COPY --from=build /telegram-bot-api/bin/telegram-bot-api /usr/local/bin/telegram-bot-api
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Environment Variables 
ENV TELEGRAM_WORK_DIR="/file" \
    TELEGRAM_TEMP_DIR="/tmp" \
    USERNAME="telegram-bot-api" \
    GROUPNAME="telegram-bot-api" \
    PORT1="8081/tcp" \
    PORT2="8082/tcp"
ENV DEFAULT_ARGS="--http-port ${PORT1} --dir=${TELEGRAM_WORK_DIR} --temp-dir=${TELEGRAM_TEMP_DIR} --username=${USERNAME} --groupname=${GROUPNAME}"

# Add user > Create directories > Change ownership > Make eecutable
RUN addgroup -g 777 -S ${GROUPNAME} \
  && adduser -S -D -H -u 777 -h ${TELEGRAM_WORK_DIR} -s /sbin/nologin -G ${GROUPNAME} -g ${GROUPNAME} ${USERNAME} \
  && mkdir -p ${TELEGRAM_WORK_DIR} ${TELEGRAM_TEMP_DIR} \
  && chown -R ${USERNAME}:${GROUPNAME} ${TELEGRAM_WORK_DIR} ${TELEGRAM_TEMP_DIR} \
  && chmod +x /docker-entrypoint.sh

# Expose Ports
EXPOSE ${PORT1} ${PORT2}

# Run the program
ENTRYPOINT ["/docker-entrypoint.sh"]