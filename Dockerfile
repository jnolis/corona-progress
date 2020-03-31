FROM rocker/r-ver:3.6.2

# install and update some linux packages then clean up
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/ 

# copy the files
COPY / /

# install the needed R packages
RUN Rscript setup.R

ENTRYPOINT ["Rscript","main.R"]