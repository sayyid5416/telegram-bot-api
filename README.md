<p align="center">
  <a href="https://hub.docker.com/r/sayyid5416/telegram-bot-api"><img src="https://img.shields.io/docker/v/sayyid5416/telegram-bot-api?colorB=lightblue&label=Version&logo=docker&logoColor=white&sort=semver&plastic" alt="Docker Image Version"></a>
  <a href="https://hub.docker.com/r/sayyid5416/telegram-bot-api"><img src="https://img.shields.io/docker/image-size/sayyid5416/telegram-bot-api?colorB=lightblue&label=Size&logo=docker&logoColor=white&sort=semver&plastic" alt="Dcoker Image Size"></a>
  <a href="https://hub.docker.com/r/sayyid5416/telegram-bot-api"><img src="https://img.shields.io/docker/pulls/sayyid5416/telegram-bot-api?colorB=lightblue&label=Pulls&logo=docker&logoColor=white&sort=semver&plastic" alt="Docker Image Pulls"></a>
</p>
<p align="center">
  <a href="https://github.com/sayyid5416/telegram-bot-api/actions/workflows/deploy.yml"><img src="https://img.shields.io/github/actions/workflow/status/sayyid5416/telegram-bot-api/deploy.yml?label=Docker-Hub Image&logo=github&plastic" alt="Docker Image Deploy Status"></a>
  <a href="https://github.com/sayyid5416/telegram-bot-api/actions/workflows/submodule-update.yml"><img src="https://img.shields.io/github/actions/workflow/status/sayyid5416/telegram-bot-api/submodule-update.yml?label=Update Submodule&logo=github&plastic" alt="Submodule Update Status"></a>
  <a href="https://github.com/sayyid5416/telegram-bot-api/issues"><img src="https://img.shields.io/github/issues/sayyid5416/telegram-bot-api?colorB=red&logo=github&plastic" alt="Issues"></a>
</p>

# 🔰 Docker-Hub image
- It's a pre-built docker image of [tdlib/telegram-bot-api](https://github.com/tdlib/telegram-bot-api).
- Download Image from [Docker-Hub](https://hub.docker.com/r/sayyid5416/telegram-bot-api), or
- Use: `FROM sayyid5416/telegram-bot-api:latest` in your Dockerfile.
- Different tags are also available, based on the version of [tdlib/telegram-bot-api](https://github.com/tdlib/telegram-bot-api).
- This Docker image will update automatically, whenever [tdlib/telegram-bot-api](https://github.com/tdlib/telegram-bot-api) is updated.


<br>


# 🔰 Pre-requisites

### 💠 Obtain `TELEGRAM_API_ID` and `TELEGRAM_API_HASH`
Obtain `api-id` & `api-hash` as described [here](https://core.telegram.org/api/obtaining_api_id) and specify them using `TELEGRAM_API_ID` & `TELEGRAM_API_HASH` environment variables.


<br>


# 🔰 Environment Variables
  ### 💠 Required
  - `TELEGRAM_API_ID`
  - `TELEGRAM_API_HASH`

  ### 💠 Optional
  - `EXTRA_ARGS`: other args to pass to `telegram-bot-api`. Ex: `--log=<log-file> --http-stat-port=8082 --local`.
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