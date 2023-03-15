FROM mppmu/julia-anaconda:ub22-jl19-ac3202210-cu117

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

RUN pip3 install \
    tensorflow-gpu==2.11.0 \
    tensorflow-addons==0.19.0 \
    tensorflow-probability==0.19.0 \
    tensorflow-estimator==2.11.0


# Install PyTorch:

# Need to use pip to make PyTorch uses system-wide CUDA libs:
RUN pip3 install \
    torch==2.0.0 \
    torchvision==0.15.1 \
    torchaudio==2.0.1


# Install JAX:

RUN pip3 install \
    --upgrade "jax[cuda]==0.4.6" "jaxlib[cuda]==0.4.6" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html


# Final steps

CMD /bin/bash
