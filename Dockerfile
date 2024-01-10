FROM mppmu/julia-anaconda:ub22-jl110-ac3202307-cu121

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

RUN pip3 install --upgrade \
    tensorflow~=2.15.0 \
    tensorflow-addons \
    tensorflow-probability \
    tensorflow-estimator


# Install PyTorch:

# Need to use pip to make PyTorch uses system-wide CUDA libs:
RUN pip3 install --upgrade \
    torch==2.1.2 \
    torchvision \
    torchaudio


# Install JAX:

RUN pip3 install --upgrade \
    "jax[cuda]==0.4.16" \
    "jaxlib[cuda]==0.4.16" \
    -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html


# Final steps

CMD /bin/bash
