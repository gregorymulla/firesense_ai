#!/bin/bash

# Start script for Render deployment

# Set default port if not provided by Render
PORT=${PORT:-8000}

# Set production CORS origins (can be overridden by env var)
export CORS_ORIGINS=${CORS_ORIGINS:-"*"}

echo "Starting FireSense demo server..."
echo "Port: $PORT"
echo "CORS Origins: $CORS_ORIGINS"

# Start the FastAPI server
exec uvicorn firesense.fire_detection.demo_server:app \
    --host 0.0.0.0 \
    --port $PORT \
    --workers 1 \
    --log-level info