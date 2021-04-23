https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry_auth.html

aws ecr get-login-password --region region | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com

docker tag e9ae3c220b23 aws_account_id.dkr.ecr.region.amazonaws.com/my-web-app

docker push aws_account_id.dkr.ecr.region.amazonaws.com/my-web-app

https://docs.docker.com/cloud/ecs-integration/

docker context create ecs myecscontext

# To use {aws.s3} in Docker:

FROM rocker/r-base:latest

RUN apt-get update && apt-get install -y \
sudo \
pandoc \
pandoc-citeproc \
libcurl4-gnutls-dev \
libcairo2-dev \
libxt-dev \
libssl-dev \
libssh2-1-dev \
build-essential \
libxml2-dev

RUN R -e "install.packages('Rtools', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('glue', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('readr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('curl')"
RUN R -e "install.packages('httr')"
RUN R -e "install.packages('xml2')"
RUN R -e "install.packages(c('aws.s3'), repos = c'https://cloud.r-project.org', 'http://cloudyr.github.io/drat'))"
RUN R -e "install.packages('janitor')"
RUN R -e "install.packages('tidyr')"

RUN mkdir -p /code

COPY extract_prices.R /code()

CMD Rscript /code/extract_prices.R

# Switch profile

setx AWS_PROFILE iamadmon-adfadf-adfadf
