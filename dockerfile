FROM python:3.11-alpine

WORKDIR /usr/src/app

# Copy requirements.txt and install dependencies 
# Copy requirements.txt first to leverage caching
# because we only need requirements.txt to install dependencies in container and if you do
# pip install in virtual env it will be
# avilable in your host but will
# not be available in container thayts why we copy it to container.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code

COPY . .

# Document the port your app uses
EXPOSE 3000

# Default command to run the app
CMD ["python", "./app.py"]

