# Pull micromamba image
FROM mambaorg/micromamba:0.15.2

# Set micromamba as user (comes with base image)
USER micromamba
WORKDIR /home/micromamba

# Specify conda-style yml file
ARG YML
COPY --chown=micromamba:micromamba $YML env.yaml

# Install packages
RUN micromamba install -y -n base -f env.yaml && \
    micromamba clean --all --yes

# Start with a Jupyter Lab instance
CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0","--NotebookApp.token=micromamba"]