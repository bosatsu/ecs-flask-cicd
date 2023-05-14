FROM python:3.10 as base

WORKDIR /app

FROM base as builder

ENV PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    POETRY_VERSION=1.4.2

RUN pip --no-cache-dir install "poetry==$POETRY_VERSION"

RUN python -m venv /venv

COPY pyproject.toml poetry.lock ./

RUN . /venv/bin/activate && poetry install --no-interaction --no-cache --no-root --without dev

FROM base as final

WORKDIR /app

COPY --from=builder /venv /venv

COPY app .

EXPOSE 8080

CMD ["/venv/bin/python", "main.py"]
