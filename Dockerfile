# Build stage: Install dependencies using uv
FROM ghcr.io/astral-sh/uv:python3.12-trixie AS builder

WORKDIR /app

# Copy dependency files
COPY pyproject.toml uv.lock ./

# Install dependencies and clean cache
RUN uv sync --locked --no-cache && uv cache clean

# Runtime stage: Use slim Python image
FROM python:3.12-slim

WORKDIR /app

# Copy virtual environment from builder
COPY --from=builder /app/.venv /app/.venv

# Set PATH to use virtual environment
ENV PATH="/app/.venv/bin:$PATH"

# Copy application code
COPY train.py predict.py ./

# Train model (only needed files are copied)
RUN python train.py

# Remove unnecessary files to reduce image size
RUN find /app/.venv -type d -name __pycache__ -exec rm -r {} + 2>/dev/null || true && \
    find /app/.venv -type f -name "*.pyc" -delete && \
    find /app/.venv -type f -name "*.pyo" -delete

# Default command: predict with sample data
CMD ["python", "predict.py"]
