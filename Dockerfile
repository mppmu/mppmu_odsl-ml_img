FROM mppmu/julia-conda:ub22-jl111-mf-cu121

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

RUN pip3 install --upgrade \
    tensorflow~=2.17.0 \
    tensorflow-probability \
    tensorflow-estimator


# Install PyTorch:

# Need to use pip to make PyTorch uses system-wide CUDA libs:
RUN pip3 install --upgrade \
    torch~=2.4.1 \
    torchvision \
    torchaudio


# Install JAX:

RUN pip3 install --upgrade \
    "jax[cuda12]~=0.4.34"

# Final steps

CMD /bin/bash
