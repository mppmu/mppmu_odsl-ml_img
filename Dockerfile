FROM mppmu/julia-anaconda:ub20-jl18-ac3202205-cu113

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

RUN pip3 install \
    tensorflow-gpu==2.9.1 \
    tensorflow-addons==0.17.0 \
    tensorflow-probability==0.16.0 \
    tensorflow-estimator==2.9.0


# Install PyTorch:

# Need to use pip to make PyTorch uses system-wide CUDA libs:
RUN pip3 install \
    torch==1.10.1+cu113 \
    torchvision==0.11.2+cu113 \
    torchaudio==0.10.1+cu113 \
    -f https://download.pytorch.org/whl/cu113/torch_stable.html


# Install JAX:

RUN pip3 install \
    --upgrade "jax[cuda]" "jaxlib" -f https://storage.googleapis.com/jax-releases/jax_releases.html


# Final steps

CMD /bin/bash
