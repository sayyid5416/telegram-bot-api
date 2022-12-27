#!/bin/sh
set -e

# Telegram-Bot-API command
ARGS="${DEFAULT_ARGS} ${EXTRA_ARGS}"
RUN_COMMAND = "telegram-bot-api ${ARGS}"

# Print Configuration
echo "[sayyid5416/telegram-bot-api] RUN_COMMAND = ${RUN_COMMAND}"
echo "[sayyid5416/telegram-bot-api] EXPOSED PORTS = ${PORT1} ${PORT2}"

# Run telegram-bot-api
echo "[sayyid5416/telegram-bot-api] Starting Telegram-Bot-API"
exec $RUN_COMMAND