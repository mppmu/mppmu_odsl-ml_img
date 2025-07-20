FROM mppmu/julia-conda:ub24-jl111-pixi-cu126

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

RUN cd "$PIXI_GLOBALPRJ" && pixi add --pypi \
    tensorflow~=2.19.0 \
    tensorflow-probability \
    tensorflow-estimator


# Install PyTorch:

RUN cd "$PIXI_GLOBALPRJ" && pixi add --pypi \
    torch~=2.7.1 \
    torchvision \
    torchaudio


# Install JAX:

RUN cd "$PIXI_GLOBALPRJ" && pixi add --pypi \
    "jax[cuda12]~=0.5.3"


# Final steps

CMD /bin/bash
