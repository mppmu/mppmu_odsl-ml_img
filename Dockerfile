FROM mppmu/julia-python:ub24-jl112-pixi-cu128

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

RUN cd "$PIXI_GLOBALPRJ" && pixi add --pypi \
    tensorflow~=2.20.0 \
    tensorflow-probability \
    tensorflow-estimator

# Install PyTorch:

RUN cd "$PIXI_GLOBALPRJ" && pixi add --pypi \
    torch~=2.10.0 \
    torchvision \
    torchaudio

# Install JAX:

RUN cd "$PIXI_GLOBALPRJ" && pixi add --pypi \
    "jax[cuda12]~=0.9.0"

# Install Horovod:
RUN cd "$PIXI_GLOBALPRJ" && pixi add --pypi \
    "horovod[tensorflow,pytorch]"

# Final steps

CMD /bin/bash
