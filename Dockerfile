FROM mppmu/julia-anaconda:julia16-anaconda3202011-cuda112

# User and workdir settings:

USER root
WORKDIR /root


# Install Developer Toolset 8 (for GCC 8):

RUN true \
    && yum install -y centos-release-scl \
    && yum install -y devtoolset-8


# Install PyTorch:

RUN conda install -c pytorch \
    pytorch=1.7.1 \
    torchvision=0.8.2 \
    torchaudio=0.7.2 \
    cudatoolkit=11


# Install TensorFlow:

RUN pip install \
    tensorflow-gpu==2.4.1 \
    tensorflow-addons==0.12.0 \
    tensorflow-probability==0.12.1 \
    tensorflow-estimator==2.4.0


# Clean up:

RUN true \
    && yum clean all


# Final steps

CMD /bin/bash
