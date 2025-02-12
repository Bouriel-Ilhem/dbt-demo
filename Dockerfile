FROM python:3.10-slim

# Set environment variables
ENV DBT_PROFILES_DIR=/app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Create and set working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy dbt project files
COPY . .

# Set entrypoint
ENTRYPOINT ["dbt"]