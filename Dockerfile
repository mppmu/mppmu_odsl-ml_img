FROM mppmu/julia-anaconda:ub20-jl18-ac3202210-cu117

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

RUN pip3 install \
    tensorflow-gpu==2.10.0 \
    tensorflow-addons==0.17.1 \
    tensorflow-probability==0.18.0 \
    tensorflow-estimator==2.10.0


# Install PyTorch:

# Need to use pip to make PyTorch uses system-wide CUDA libs:
RUN pip3 install \
    torch==1.12.1 \
    torchvision==0.13.1 \
    torchaudio==0.12.1 \
    --extra-index-url https://download.pytorch.org/whl/cu113


# Install JAX:

RUN pip3 install \
    --upgrade "jax[cuda]==0.3.17" "jaxlib[cuda]==0.3.15" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html


# Final steps

CMD /bin/bash
