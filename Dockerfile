# Use the official Python 3.11 image as the base image
FROM python:3.11-slim

# Set the timezone to UTC
ENV TZ=UTC

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /home/app

# Copy the requirements file
COPY requirements.txt .


# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the working directory
# COPY .env .
COPY app.py .

# Expose the port the app will run on
EXPOSE 51795

# Define the command to run the application
CMD ["shiny", "run", "--host=0.0.0.0", "--port=51795"]
