# Stage 1: Create a lightweight development image
FROM python:3.10.6 AS prog

# Set the working directory inside the container
WORKDIR /home/dell/Lessons_16/AppCode

# Copy port_48888.py to the working directory
COPY port_48888.py ./

# Install application dependencies
RUN pip3 install

# Copy the entire application code to the working directory
COPY . .

# Expose port 48888 for the application to listen on
EXPOSE 48888

# Stage 2: Create a lightweight production image
FROM python:3.10.6 AS prod

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the built application from the 'dev' stage to the working directory in the 'prod' stage
COPY --from=prog /home/dell/Lessons_16/AppCode .

# Specify the command to start the application
CMD [ "pip3", "start" ]
