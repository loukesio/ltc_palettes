# Use the rocker/r-ver base image for a more comprehensive R setup
FROM rocker/r-ver:latest

# Metadata as described above
LABEL maintainer="theodosiou@evolbio.mpg.de" \
      version="0.2.0" \
      description="Docker image for the ltc R package"

# Set the working directory in docker
WORKDIR /usr/local/src/myscripts

# Copy the current directory contents into the container at /usr/local/src/myscripts
COPY . /usr/local/src/myscripts

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libudunits2-dev

# Install R dependencies
RUN R -e "install.packages(c('dplyr', 'ggplot2', 'ggforce'), repos='http://cran.rstudio.com/')"

# Install the ltc package inside the container
RUN R CMD INSTALL .

# By default, start an R session when the container is run
CMD ["R"]

