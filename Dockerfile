# Use Python 2.7 as the base image
FROM python:2.7

# Set environment variables to avoid Python writing bytecode files
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the necessary files (including svm_engine.py, cat_puma.py, and engine.obj) into the Docker container
COPY . .

# Install necessary Python packages using pip
RUN pip install --upgrade pip && \
    pip install -r requirements.txt  # Assuming you have a requirements.txt

# Install specific versions of the required packages
RUN pip install numpy==1.16.6 pandas==0.24.2 scikit-learn==0.19.1 scipy==1.2.2

# Set the entry point to run the script inside the container
CMD ["python", "cat_puma.py"]
