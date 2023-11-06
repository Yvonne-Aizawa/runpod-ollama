#!/bin/bash
/bin/ollama serve &
sleep 1
IMAGE_NAME=${IMAGE_NAME:-orca-mini}
/bin/ollama pull $IMAGE_NAME
wait