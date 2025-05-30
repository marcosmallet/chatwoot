Esta imagem é baseada no fork do Chatwoot mantido por [fazer-ai](https://github.com/fazer-ai/chatwoot) e está pronta para rodar em arquiteturas `amd64` e `arm64`.

## Como usar
```bash
docker pull seuusuario/chatwoot:latest
docker run -p 3000:3000 \
  -e POSTGRES_HOST=host_do_postgres \
  -e POSTGRES_USERNAME=usuario \
  -e POSTGRES_PASSWORD=senha \
  -e REDIS_PASSWORD=senha_redis \
  -e SECRET_KEY_BASE=sua_chave \
  marcosmallet/chatwoot:latest
```

## Variáveis obrigatórias
- `POSTGRES_HOST`
- `POSTGRES_USERNAME`
- `POSTGRES_PASSWORD`
- `SECRET_KEY_BASE`
- `REDIS_PASSWORD`

## Build Manual (local)
```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t marcosmallet/chatwoot:latest \
  --push .
```
