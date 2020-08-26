from continuumio/miniconda3:4.8.2
WORKDIR /chainladder
COPY r_requirements.txt r_requirements.txt
COPY requirements.txt requirements.txt
RUN conda install -y -q -c r --file r_requirements.txt
RUN R -e "options(repos = c(CRAN = 'http://cran.rstudio.com'))"
RUN R -e "install.packages('ChainLadder', repo='http://cran.rstudio.com', quiet=TRUE)"
RUN conda install -y -q -c r --file requirements.txt
ADD . .
RUN python setup.py develop
CMD ["pytest","chainladder"]

