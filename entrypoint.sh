#!/bin/bash
set -e

exec goatcounter serve \
  -automigrate \
  -tls none \
  -listen "0.0.0.0:8081" \
  -smtp "$SMTP_URL" \
  -db "$DB_URL" \
  -auth "$AUTH"
