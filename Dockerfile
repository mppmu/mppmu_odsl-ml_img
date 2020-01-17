FROM mppmu/julia-anaconda:julia13-anaconda3201910-cuda101

# User and workdir settings:

USER root
WORKDIR /root


# Install Developer Toolset 8 (for GCC 8):

RUN true \
    && yum install -y centos-release-scl \
    && yum install -y devtoolset-8


# Install TensorFlow:

RUN true \
    && conda install tensorflow-gpu=2.0.0


# Install PyTorch:

RUN true \
    && conda install pytorch-gpu=1.3.1


# Clean up:

RUN true \
    && yum clean all


# Final steps

CMD /bin/bash
