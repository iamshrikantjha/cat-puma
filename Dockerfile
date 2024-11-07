FROM ubuntu:20.04

# Set environment variables
ENV LANG C.UTF-8
ENV PYTHON_VERSION 2.7

# Install dependencies and add the necessary repository for Python 2.7
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python2.7 python2.7-dev curl build-essential libssl-dev libffi-dev wget

# Manually install pip for Python 2.7
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py && \
    python2.7 get-pip.py && \
    rm get-pip.py

# Set Python 2.7 as the default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1

# Install Python dependencies
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN python2.7 -m pip install --upgrade pip
RUN python2.7 -m pip install -r requirements.txt

# Copy application code into the container
COPY . /app

# Run the application
CMD ["python2.7", "cat_puma.py"]
