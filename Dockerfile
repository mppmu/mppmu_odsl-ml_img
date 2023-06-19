FROM mppmu/julia-anaconda:ub22-jl19-ac3202210-cu117

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

RUN pip3 install \
    tensorflow==2.12.0 \
    tensorflow-addons==0.20.0 \
    tensorflow-probability==0.20.1 \
    tensorflow-estimator==2.12.0


# Install PyTorch:

# Need to use pip to make PyTorch uses system-wide CUDA libs:
RUN pip3 install --upgrade \
    torch==2.0.1 \
    torchvision==0.15.2 \
    torchaudio==2.0.2


# Install JAX:

RUN pip3 install --upgrade \
    "jax[cuda]==0.4.12" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html


# Final steps

CMD /bin/bash
