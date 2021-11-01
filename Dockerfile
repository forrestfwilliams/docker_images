# Use micromamba as the base image
FROM mambaorg/micromamba:0.15.2

# Label image
LABEL \
    "Description"="Container for open source time series InSAR processing with Mintpy" \
    "Github Source"="https://github.com/insarlab/MintPy/" \
    "Installation"="https://github.com/insarlab/MintPy/blob/main/docs/installation.md" \
    "Dockerfile Author"="Forrest Williams" \
    "Email"="forrestfwilliams@icloud.com"

# Clone MintPy and PyAPS repositories
USER root
RUN apt-get update && \
    apt-get install -y git && \
    mkdir /home/micromamba/tools && \
    git clone https://github.com/insarlab/MintPy.git /home/micromamba/tools/MintPy && \
    git clone https://github.com/yunjunz/PyAPS.git /home/micromamba/tools/PyAPS

# Set user and home directory
USER micromamba
WORKDIR /home/micromamba

# Prepare environment for MintPy
ARG MINTPY_HOME=/home/micromamba/tools/MintPy
ARG PYAPS_HOME=/home/micromamba/tools/PyAPS
ARG PYTHON3DIR=/opt/conda

ENV MINTPY_HOME=${MINTPY_HOME}
ENV PYTHON3DIR=${PYTHON3DIR}
ENV PYAPS_HOME=${PYAPS_HOME}
ENV PATH=${MINTPY_HOME}/mintpy:${PYTHON3DIR}/bin:${PATH}
ENV PYTHONPATH=${MINTPY_HOME}:${PYAPS_HOME}

# # Optionally add Jupyter Lab to environment file
# RUN echo "  - jupyterlab\n  - ipympl" >> ${MINTPY_HOME}/docs/environment.yml

# Install dependencies
RUN micromamba install -y -n base -f ${MINTPY_HOME}/docs/environment.yml && \
    micromamba clean --all --yes

# RUN apt-get update && \
#     apt-get install -y git


# RUN mkdir tools && \
#     git clone https://github.com/insarlab/MintPy.git tools

# # Install useful programs
# RUN apt-get update && \
#     apt-get install -y \
#     git \
#     python3 \
#     python3-pip \
#     wget \ 
#     vim \
#     zip \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# # Change default shell from dash to bash permanently
# SHELL ["/bin/bash", "-c"]

# # Prepare build time environment for conda and mintpy
# ARG MINTPY_HOME=/home/python/MintPy
# ARG PYTHON3DIR=/home/python/miniconda3
# ARG PYAPS_HOME=/home/python/PyAPS
# ARG WORK_DIR=/home/work/

# # Prepare container environment
# ENV MINTPY_HOME=${MINTPY_HOME}
# ENV PYTHON3DIR=${PYTHON3DIR}
# ENV PYAPS_HOME=${PYAPS_HOME}
# ENV PATH=${MINTPY_HOME}/mintpy:${PYTHON3DIR}/bin:${PATH}
# ENV PYTHONPATH=${PYTHONPATH}:${MINTPY_HOME}:${PYAPS_HOME}
# ENV PROJ_LIB=${PYTHON3DIR}/share/proj

# # Set workdir
# WORKDIR /home/python

# # Pull and config mintpy
# RUN git clone https://github.com/insarlab/MintPy.git

# # Pull and config PyAPS
# RUN git clone https://github.com/yunjunz/PyAPS.git

# # Install miniconda
# RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh && \
#     chmod +x ./Miniconda3-4.5.4-Linux-x86_64.sh  && \
#     ./Miniconda3-4.5.4-Linux-x86_64.sh -b -p ${PYTHON3DIR} && \
#     rm ./Miniconda3-4.5.4-Linux-x86_64.sh

# # Install dependencies
# RUN ${PYTHON3DIR}/bin/conda config --add channels conda-forge && \
#     ${PYTHON3DIR}/bin/conda install --yes --file ${MINTPY_HOME}/docs/requirements.txt

# # Install pykml
# RUN ${PYTHON3DIR}/bin/pip install git+https://github.com/yunjunz/pykml.git

# # Set working directory ENV - map a host data volume to this using "docker build . -t mintpy && docker run mintpy -v /host/path/to/data:/home/work/"
# RUN mkdir -p ${WORK_DIR}
# ENV WORK_DIR=${WORK_DIR}
# WORKDIR ${WORK_DIR}

# # Copy custom app scripts to app folder - not required
# COPY ["./", "/home/app/"]

# # Run entrypoint script - not required
# CMD ["python3", "/home/app/app.py"]