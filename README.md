# Statistical Decision Making 

Project scaffolding for Statistical Decision Making at the Tepper School of Business.

Docker image extends [Jupyter Docker Stack's](https://jupyter-docker-stacks.readthedocs.io/en/latest/) [data-science notebook](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook) and contains the necessary [tprstats](https://github.com/dnepple/tprstats) library. 

## Quick Start
1. Build docker image  
``` docker build . -t stats ```

2. Run docker image  
``` docker -p 8888:8888 -v $(pwd):/home/jovyan/work stats ```