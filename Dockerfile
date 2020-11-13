FROM mppmu/julia-anaconda:julia16-anaconda3202011-cuda112

# User and workdir settings:

USER root
WORKDIR /root


# Install Developer Toolset 8 (for GCC 8):

RUN true \
    && yum install -y centos-release-scl \
    && yum install -y devtoolset-8


# Install TensorFlow:

RUN true \
    && pip install tensorflow-gpu==2.2.0


# Install PyTorch:

RUN true \
    && conda install pytorch-gpu=1.3.1


# Clean up:

RUN true \
    && yum clean all


# Final steps

CMD /bin/bash
