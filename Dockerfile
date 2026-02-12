ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim

ARG BUILD_DATE
ARG VCS_REF

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.source="https://github.com/xaas-hub/docker-fastapi"

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

# --proxy-headers: trust X-Forwarded-* headers from Traefik
# --forwarded-allow-ips=*: allow forwarded headers from any internal Docker IP
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--proxy-headers", "--forwarded-allow-ips", "*"]
