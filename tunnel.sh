#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/nsa-a5-flyer" && pwd)"
PORT=8080

case "$1" in
  start)
    if ss -tulpn | grep -q ":$PORT "; then
      echo "Port $PORT is already in use."
    else
      echo "Starting local Python HTTP server on port $PORT..."
      python3 -m http.server "$PORT" --directory "$DIR" > /tmp/http_server.log 2>&1 &
      sleep 1
    fi
    echo "Starting Cloudflare Tunnel..."
    cloudflared tunnel --protocol http2 --url "http://127.0.0.1:$PORT"
    ;;
  stop)
    echo "Stopping cloudflared and python http.server..."
    pkill -f "cloudflared tunnel"
    pkill -f "python3 -m http.server $PORT"
    echo "Done."
    ;;
  status)
    echo "=== Ports ==="
    ss -tulpn | grep -E ":$PORT " || echo "HTTP server not running"
    echo "=== Processes ==="
    pgrep -a -f "cloudflared tunnel" || echo "cloudflared not running"
    ;;
  *)
    echo "Usage: $0 {start|stop|status}"
    exit 1
    ;;
esac
