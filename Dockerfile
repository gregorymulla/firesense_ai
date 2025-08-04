# Multi-stage build for FireSense demo

# Stage 1: Build the React UI
FROM node:18-alpine as ui-builder

WORKDIR /app/demo-ui

# Copy package files
COPY demo-ui/package*.json ./

# Install dependencies
RUN npm ci

# Copy source files
COPY demo-ui/ ./

# Build the UI
RUN npm run build

# Stage 2: Python application
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app

# Copy Python files
COPY pyproject.toml ./
COPY src/ ./src/
COPY demo/ ./demo/
COPY images/ ./images/

# Install Python dependencies
RUN uv pip install --system -e .

# Copy built UI from previous stage
COPY --from=ui-builder /app/demo-ui/dist ./demo-ui/dist

# Create start script
COPY render_start.sh ./
RUN chmod +x render_start.sh

# Expose port (Render will override with PORT env var)
EXPOSE 8000

# Start the application
CMD ["./render_start.sh"]