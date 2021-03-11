# set base image (host OS)
FROM python:3.9.1

# set the working directory in the container
WORKDIR /app/

# https://shouldiblamecaching.com/
ENV PIP_NO_CACHE_DIR 1

# to resynchronize the package index files from their sources.
RUN apt -qq update

# http://bugs.python.org/issue19846
ENV LANG C.UTF-8

# sets the TimeZone, to be used inside the container
ENV TZ Asia/Kolkata

# each instruction creates one layer
# Only the instructions RUN, COPY, ADD create layers.
# copies 'requirements', to inside the container
# ..., there are multiple '' dependancies,
# requiring the use of the entire repo, hence
# adds files from your Docker client’s current directory.
COPY . .

# install requirements, inside the container
RUN pip3 install --no-cache-dir -r requirements.txt

# specifies what command to run within the container.
CMD ["python3", "main.py"]
