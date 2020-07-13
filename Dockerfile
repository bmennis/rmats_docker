FROM ubuntu:18.04
LABEL maintainer="Brian Ennis (ennisb@email.chop.edu)"

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y wget

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
    
RUN conda --version

RUN conda update --all -y &&\
    conda config --add channels r &&\
    conda config --add channels bioconda &&\
    conda config --add channels conda-forge &&\
    conda install  -y rmats=4.1.0
