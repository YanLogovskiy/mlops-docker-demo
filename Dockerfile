FROM ghcr.io/astral-sh/uv:python3.12-trixie

WORKDIR /app

# Копируем зависимости
COPY pyproject.toml .
COPY uv.lock .
RUN uv sync --locked --no-cache && uv cache clean
ENV PATH="/app/.venv/bin:$PATH"

# Копируем код и модель
COPY train.py .
COPY predict.py .
RUN python train.py  # Тренируем модель внутри контейнера

# По умолчанию предсказываем sample data
CMD ["python", "predict.py"]
