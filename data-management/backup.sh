#!/bin/bash
# Database credentials
DATE=$(date +%Y%m%d%H%M)
USER=$DB_USER
PASSWORD=$DB_PASSWORD
DB_NAME=$DB_NAME
HOST=$DB_HOST  # or your database host
PORT=$DB_PORT

# Backup directory
BACKUP_DIR="/s6rene-backup"

# Ensure backup directory exists and has write permission
# mkdir "$BACKUP_DIR"
# chmod 700 "$BACKUP_DIR"

# AWS S3 bucket
S3_BUCKET="s3://del-db-backup/S6/s6rene/"       

# Dump the PostgreSQL database
pg_dump -U "$USER" -h "$HOST" -p "$PORT" -d "$DB_NAME" > "$BACKUP_DIR/db_backup.sql"

# Upload the backup to S3
aws s3 cp "$BACKUP_DIR/db_backup.sql" "$S3_BUCKET"

