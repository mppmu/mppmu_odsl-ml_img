FROM mppmu/julia-anaconda:julia16-anaconda3202011-cuda112

# User and workdir settings:

USER root
WORKDIR /root


# Install Developer Toolset 8 (for GCC 8):

RUN true \
    && yum install -y centos-release-scl \
    && yum install -y devtoolset-8


# Install TensorFlow:

# TensorFlow v2.4 wants libcusolver.10, not libcusolver.11, even with CUDA-11:
RUN true \
    && yum install -y cuda-cusolver-10-2 \
    && ln -s /usr/local/cuda-10.2/lib64/libcusolver*.so* /usr/local/cuda-11.2/lib64/

RUN pip install \
    tensorflow-gpu==2.4.1 \
    tensorflow-addons==0.12.0 \
    tensorflow-probability==0.12.1 \
    tensorflow-estimator==2.4.0


# Install PyTorch:

# Need to use pip to make PyTorch uses system-wide CUDA libs:
RUN pip install \
    torch==1.7.1+cu110 \
    torchvision==0.8.2+cu110 \
    torchaudio===0.7.2 \
    -f https://download.pytorch.org/whl/torch_stable.html

# Clean up:

RUN true \
    && yum clean all


# Final steps

CMD /bin/bash
