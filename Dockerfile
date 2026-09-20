# Static ops console for AI 奥特曼 — serve site/ on :8080
FROM python:3.12-alpine
WORKDIR /srv
COPY . /srv
EXPOSE 8080
CMD ["python3", "-m", "http.server", "8080", "--bind", "0.0.0.0"]
