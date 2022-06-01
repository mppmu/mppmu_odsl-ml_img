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
    torch==1.11.0 \
    torchvision==0.12.0 \
    torchaudio==0.11.0 \
    --extra-index-url https://download.pytorch.org/whl/cu113


# Install JAX:

RUN pip3 install \
    --upgrade "jax[cuda]==0.3.13" "jaxlib==0.3.10" -f https://storage.googleapis.com/jax-releases/jax_releases.html


# Final steps

CMD /bin/bash
