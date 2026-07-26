FROM mppmu/julia-python:ub24-jl112-pixi-cu130

# User and workdir settings:

USER root
WORKDIR /root


# Install TensorFlow:

# TensorFlow has no CUDA 13 support yet, so it can't use the CUDA installation
# in the image - "[and-cuda]" makes it bring its own CUDA 12 runtime. Note that
# the TensorFlow builds for linux-aarch64 are CPU-only in any case.

# TensorFlow Probability needs the "tf" extra, it depends on tf-keras (the
# standalone Keras 2) which TensorFlow itself doesn't pull in any more:

RUN cd "$PIXI_GLOBALPRJ" && pixi add --pypi \
    "tensorflow[and-cuda]~=2.21.0" \
    "tensorflow-probability[tf]" \
    tensorflow-estimator

# Install PyTorch:

# Install from the PyTorch CUDA package index, as recommended on
# https://pytorch.org/ - PyPI only provides CPU-only builds of PyTorch for
# linux-aarch64. PyTorch always bundles its own CUDA runtime and can't use the
# CUDA installation in the image. torchaudio is not part of the recommended
# PyTorch installation any more and doesn't support current PyTorch versions.

RUN cd "$PIXI_GLOBALPRJ" && pixi add --pypi \
    torch torchvision \
    --index https://download.pytorch.org/whl/cu130

# Install JAX:

# Use the CUDA installation in the image ("-local"). JAX's CUDA 12 builds can
# only generate PTX 8.7, which can't target Blackwell GPUs (compute capability
# 12.1, "sm_121a", needs PTX 8.8), so the image has to provide CUDA 13:

RUN cd "$PIXI_GLOBALPRJ" && pixi add --pypi \
    "jax[cuda13-local]~=0.11.0"

# Note: Horovod has been removed. Its last release (0.28.1) is from June 2023
# and upstream development has stopped, so it doesn't build against current
# TensorFlow and PyTorch versions. Use "torch.distributed"/"tf.distribute" or
# mpi4py (available in the image) instead.

# Final steps

CMD /bin/bash
