# Update with your base image of choice
FROM jupyter/datascience-notebook:latest

USER root

RUN apt-get update && \
    apt-get install pandoc -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_USER

# Install Jupyter Extensions
RUN pip install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --user && \
    # can modify or enable additional extensions here
    jupyter nbextension enable spellchecker/main --user && \
    jupyter nbextension enable toc2/main
    
# Install R Packages
# R packages
RUN conda install --quiet --yes \
    'r-devtools' \
    'r-tidyverse' \
    && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Install tprstats
RUN Rscript -e "devtools::install_github('dnepple/tprstats')"