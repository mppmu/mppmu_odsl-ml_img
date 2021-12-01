FROM mppmu/julia-anaconda:ub20-jl17-ac3202111-cu113

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

RUN pip3 install \
    tensorflow-gpu==2.6.0 \
    tensorflow-addons==0.14.0 \
    tensorflow-probability==0.14.1 \
    tensorflow-estimator==2.6.0


# Install PyTorch:

# Need to use pip to make PyTorch uses system-wide CUDA libs:
RUN pip3 install \
    torch==1.10.0+cu113 \
    torchvision==0.11.1+cu113 \
    torchaudio==0.10.0+cu113 \
    -f https://download.pytorch.org/whl/cu113/torch_stable.html


# Final steps

CMD /bin/bash
