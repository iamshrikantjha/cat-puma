# Dockerfile for Python 2
FROM python:2.7

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Set the working directory
WORKDIR /usr/src/app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Add scipy explicitly
RUN pip install scipy==1.2.2

# Run the Python script
CMD ["python", "cat_puma.py"]
