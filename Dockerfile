# This specifies the base image as Ubuntu 22.04, which will be used as the starting point for the Docker image.
FROM ubuntu:22.04

# Sets the working directory inside the container to /app-code
WORKDIR /app-code

# Updates the package lists for the Ubuntu package manager (apt), upgrades the installed packages to their latest versions, and installs Python3
RUN apt update && apt upgrade -y && apt install python3  -y

# User 1000
USER 1000

# Copy the dependencies file to the working dir
COPY --chown=1000:1000 ./app-code/ /app-code/

# Expose the container port
EXPOSE 48888

# Specifies the default command to be executed when a container is created from this image. It runs the Python script appreadport.py using the python3 interpreter.
CMD [ "python3", "appreadport.py" ]