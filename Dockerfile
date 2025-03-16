FROM mppmu/julia-conda:ub22-jl111-mf-cu126

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

RUN pip3 install --upgrade \
    tensorflow~=2.19.0 \
    tensorflow-probability \
    tensorflow-estimator


# Install PyTorch:

# Need to use pip to make PyTorch uses system-wide CUDA libs:
RUN pip3 install --upgrade --index-url https://download.pytorch.org/whl/cu126 \
    torch~=2.6.0 \
    torchvision \
    torchaudio


# Install JAX:

RUN pip3 install --upgrade \
    "jax[cuda12]~=0.5.2"

# Final steps

CMD /bin/bash
