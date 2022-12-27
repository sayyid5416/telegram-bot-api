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


# 🔰 Some Useful Docs
- [Usage of telegram-bot-api](https://github.com/tdlib/telegram-bot-api#usage)
- [Moving a bot to a local server](https://github.com/tdlib/telegram-bot-api#moving-a-bot-to-a-local-server)
- [Moving a bot from one local server to another](https://github.com/tdlib/telegram-bot-api#moving-a-bot-from-one-local-server-to-another)


<br>


# 🔰 Pre-Requisites

### 💠 Obtain API-ID and API-Hash
Obtain `api-id` & `api-hash` as described [here](https://core.telegram.org/api/obtaining_api_id) and specify them using `TELEGRAM_API_ID` & `TELEGRAM_API_HASH` environment variables.


<br>


# 🔰 Running Telegram-Bot-API
- There are many ways to run it. Some are:
  - Running using `docker run`.
  - **Deploying** to some hosting service directly.
  - Using it as the **base image** in your docker container.
    - Ex: `FROM sayyid5416/telegram-bot-api:latest`

- Check [doocker-entrypoint.sh](../../doocker-entrypoint.sh) to get an idea of how to run it.
  - Ex: `telegram-bot-api <Default-Arguments> <Extra-Arguments>`
  - Default-Arguments: Already configured in [Dockerfile](../../Dockerfile) as `DEFAULT_ARGS`.
    - `--http-port <port> --dir=<work directory> --temp-dir=<temporary directory> --username=<username> --groupname=<groupname>`
    - `TELEGRAM_API_ID` and `TELEGRAM_API_HASH` will be used automatically.
  - Extra-Arguments: Pass these via `EXTRA_ARGS` environment variable _(check [environment variables](#-environment-variables))_.


<br>


# 🔰 Environment Variables
  ### 💠 Required
  - `TELEGRAM_API_ID`
  - `TELEGRAM_API_HASH`

  ### 💠 Optional
  - `EXTRA_ARGS`: Extra arguments for `telegram-bot-api`. Ex: `<ARG1> <ARG2> <ARG3>`. Available options are:
    ```bash
    --log=<value>
    --filter=<value>
    --max-webhook-connections=<value>
    --verbosity=<value>
    --max-connections=<value>
    --proxy=<value>
    --http-stat-port=8082
    --local
    ```


<br>


# 🔰 Available Ports
  - `8081/tcp` _(default for telegram-bot-api)_
  - `8082/tcp`