#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Run tests with verbose output
echo "Running tests..."
go test ./... -v

echo "Tests completed."
