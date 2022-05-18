# Pull micromamba image
FROM mambaorg/micromamba

# Set Working Directory
WORKDIR /home/$MAMBA_USER

# Specify conda-style yml file
ARG YML
COPY --chown=$MAMBA_USER:$MAMBA_USER $YML /tmp/env.yaml

# Install packages
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]