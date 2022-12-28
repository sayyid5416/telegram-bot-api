<p align="center">
  <a href="https://hub.docker.com/r/sayyid5416/telegram-bot-api"><img src="https://img.shields.io/docker/v/sayyid5416/telegram-bot-api?colorA=333a44&colorB=lightblue&label=Version&logo=docker&logoColor=white&sort=semver&plastic" alt="Docker Image Version"></a>
  <a href="https://hub.docker.com/r/sayyid5416/telegram-bot-api"><img src="https://img.shields.io/docker/image-size/sayyid5416/telegram-bot-api?colorA=333a44&colorB=lightblue&label=Size&logo=docker&logoColor=white&sort=semver&plastic" alt="Dcoker Image Size"></a>
  <a href="https://hub.docker.com/r/sayyid5416/telegram-bot-api"><img src="https://img.shields.io/docker/pulls/sayyid5416/telegram-bot-api?colorA=333a44&colorB=lightblue&label=Pulls&logo=docker&logoColor=white&sort=semver&plastic" alt="Docker Image Pulls"></a>
</p>
<p align="center">
  <a href="https://github.com/sayyid5416/telegram-bot-api/actions/workflows/deploy.yml"><img src="https://github.com/sayyid5416/telegram-bot-api/actions/workflows/deploy.yml/badge.svg" alt="Docker Image Deploy Status"></a>
  <a href="https://github.com/sayyid5416/telegram-bot-api/actions/workflows/submodule-update.yml"><img src="https://github.com/sayyid5416/telegram-bot-api/actions/workflows/submodule-update.yml/badge.svg" alt="Submodule Update Status"></a>
  <a href="https://github.com/sayyid5416/telegram-bot-api/issues"><img src="https://img.shields.io/github/issues/sayyid5416/telegram-bot-api?colorA=333a44&colorB=red&logo=github&plastic" alt="Issues"></a>
</p>

# 🔰 Docker-Hub Image
- Image is available at [Docker-Hub](https://hub.docker.com/r/sayyid5416/telegram-bot-api).
- It's a pre-built docker image of [tdlib/telegram-bot-api](https://github.com/tdlib/telegram-bot-api).
- Different tags are also available, based on the version of [tdlib/telegram-bot-api](https://github.com/tdlib/telegram-bot-api).
- **Auto-Update:** 
  - This Docker image will update automatically.
  - Whenever [tdlib/telegram-bot-api](https://github.com/tdlib/telegram-bot-api) is updated.
  - Updates are checked every night 12:00 AM UTC.


<br>


# 🔰 Pre-Requisites

### 💠 Obtain API-ID and API-Hash
Obtain `api-id` & `api-hash` as described [here](https://core.telegram.org/api/obtaining_api_id) and specify them using `TELEGRAM_API_ID` & `TELEGRAM_API_HASH` [environment variables](#-environment-variables).


<br>


# 🔰 Environment Variables
  ### 💠 Required
  - `TELEGRAM_API_ID`
  - `TELEGRAM_API_HASH`

  ### 💠 Optional
  - `EXTRA_ARGS`: Extra arguments for `telegram-bot-api`. Ex: `<ARG1> <ARG2> <ARG3>`.


<br>


# 🔰 Available Ports
  - `8081/tcp` _(default for telegram-bot-api)_
  - `8082/tcp`


<br>


# 🔰 Running Telegram-Bot-API
  ### 💠 Overview
  - There are many ways to run it. Some are:
    - Running using `docker run`.
    - **Deploying** to some hosting service directly.
    - Using it as the **base image** in your docker container.
      - Ex: `FROM sayyid5416/telegram-bot-api:latest`
    - Check [docker-entrypoint.sh](/docker-entrypoint.sh) to get an idea of how to run it.
      - Ex: `telegram-bot-api <Default-Arguments> <Extra-Arguments>`

  ### 💠 Available Arguments
  - **Default-Arguments:** Already configured in [Dockerfile](/Dockerfile) as `DEFAULT_ARGS`.
    ```bash
              Argument                 Default value                      Description
        --api-id=<value>       Set it via ENV "TELEGRAM_API_ID"      For Telegram API access
        --api-hash=<value>     Set it via ENV "TELEGRAM_API_HASH"    For Telegram API access
    -p, --http-port=<value>    PORT1 (8081)                          HTTP listening port
    -d, --dir=<value>          TELEGRAM_WORK_DIR (/file)             Server working directory
    -t, --temp-dir=<value>     TELEGRAM_TEMP_DIR (/tmp)              Directory for storing HTTP server temporary files
    -u, --username=<value>     USERNAME (telegram-bot-api)           user name to switch to
    -g, --groupname=<value>    GROUPNAME (telegram-bot-api)          Effective group name to switch to
    ```

  - **Extra-Arguments:** Pass these via `EXTRA_ARGS` [environment variable](#-environment-variables).
    ```bash
              Argument                        Default value                 Description
        --local                                   NA               Allow the Bot API server to serve local requests
    -s, --http-stat-port=<value>                  NA               HTTP statistics port
        --filter=<value>                          NA               "<remainder>/<modulo>". Allow only bots with 'bot_user_id % modulo == remainder'
        --max-webhook-connections=<value>         NA               Default value of the maximum webhook connections per bot
        --http-ip-address=<value>            All IPv4 addresses    local IP address, HTTP connections to which will be accepted
        --http-stat-ip-address=<value>       All IPv4 addresses    local IP address, HTTP statistics connections to which will be accepted
    -l, --log=<value>                             NA               Path to the file where the log will be written
    -v, --verbosity=<value>                       NA               Log verbosity level
        --memory-verbosity=<value>                3                Memory log verbosity level
        --log-max-file-size=<value>           2000000000           Maximum size of the log file in bytes before it will be auto-rotated
    -c, --max-connections=<value>                 NA               Maximum number of open file descriptors
        --proxy=<value>                           NA               HTTP proxy server for outgoing webhook requests in the format http://host:port
    ```

<br>


# 🔰 Some Useful Docs
- [Moving a bot to a local server](https://github.com/tdlib/telegram-bot-api#moving-a-bot-to-a-local-server) or [Moving a bot from one local server to another](https://github.com/tdlib/telegram-bot-api#moving-a-bot-from-one-local-server-to-another):
  - You must call [logOut](https://core.telegram.org/bots/api#logout) on your bot, to deregister your bot from previous server, before using this server.

- [Using a Local Bot API Server](https://core.telegram.org/bots/api#using-a-local-bot-api-server) _(`--local`)_:
  - More features will be unlocked & Limits would be removed.
  - For [getFile](https://core.telegram.org/bots/api#getfile), files will be downloaded and path would be returned.
  - You will need to use tools like [NGINX](https://nginx.org/en/) to download those files.

- **More Info:**
  - Your own API endpoint, Ex: `<hostUrl>/bot<token>/getMe`.
  - Telegram Bot API server accepts only HTTP requests, so a TLS termination proxy needs to be used to handle remote HTTPS requests.
