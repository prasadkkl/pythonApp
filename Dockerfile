# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any dependencies (if you have a requirements.txt file)
RUN pip install pytest  # Install pytest for running tests

# Run the tests
RUN python -m pytest test_add.py

# Set the default command to run add.py
CMD ["python", "add.py"]
