FROM python:3.11-slim

WORKDIR /app

# Setup Dependancies
COPY main-app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy in the source
COPY main-app/. .

# Expose Default FASTAPI port
EXPOSE 8000

# Run the FastAPI app with uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


