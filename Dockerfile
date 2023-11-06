# ---- ollama ----
FROM ollama/ollama 
WORKDIR ./
RUN apt-get update
COPY ./scripts/start_runpod.sh /start.sh
COPY ./models/ /models
EXPOSE 11434
ENV OLLAMA_HOST 0.0.0.0
ENTRYPOINT ["/start.sh"]
CMD [""]
