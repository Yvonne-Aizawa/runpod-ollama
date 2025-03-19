# ---- ollama ----
FROM ollama/ollama 
WORKDIR ./
RUN apt-get update
RUN apt install ca-certificates curl gnupg -y
RUN curl -sSL https://pkgs.netbird.io/debian/public.key | gpg --dearmor --output /usr/share/keyrings/netbird-archive-keyring.gpg
RUN echo 'deb [signed-by=/usr/share/keyrings/netbird-archive-keyring.gpg] https://pkgs.netbird.io/debian stable main' | tee /etc/apt/sources.list.d/netbird.list
RUN apt-get update
RUN apt-get install netbird
COPY ./scripts/start_runpod.sh /start.sh
COPY ./models/ /models
EXPOSE 11434
ENV OLLAMA_HOST 0.0.0.0
ENTRYPOINT ["/start.sh"]
CMD [""]
