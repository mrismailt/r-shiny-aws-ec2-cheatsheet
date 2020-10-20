FROM rocker/shiny-verse:latest

RUN apt-get update && apt-get install -y \
  sudo \
  pandoc \
  pandoc-citeproc \
  libcurl4-gnutls-dev \
  libcairo2-dev \
  libxt-dev \
  libssl-dev \
  libssh2-1-dev
  
RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinycssloaders', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('readxl', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinymanager', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('DT', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rhandsontable', repos='http://cran.rstudio.com/')"

COPY app.R /srv/shiny-server/
COPY global.R /srv/shiny-server/
COPY Mapping.xlsx /srv/shiny-server/

EXPOSE 3838

RUN sudo chown -R shiny:shiny /srv/shiny-server
#&& \
#  chmod 755 /usr/bin/shiny-server.sh


#CMD ["/usr/bin/shiny-server.sh"]
