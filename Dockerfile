FROM python:3.11-slim

WORKDIR /app

# Install curl (add these two lines)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Setup Dependancies
COPY main-app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy in the source
COPY main-app/. .

# Expose Default FASTAPI port
EXPOSE 8000

# Run the FastAPI app with uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
