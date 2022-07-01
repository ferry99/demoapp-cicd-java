#!/usr/bin/env bash
# Use this script to test if a given TCP host/port are available
while !</dev/tcp/spring-plp_db_1/5432; do echo "connection is not ready yet"; sleep 3; done; echo "Connected";