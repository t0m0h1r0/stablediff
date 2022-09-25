FROM nvidia/cuda:11.7.0-cudnn8-runtime-ubuntu22.04

# Set bash as default shell
ENV SHELL=/bin/bash

# Create a working directory
WORKDIR /app/

# Build with some basic utilities
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    apt-utils \
    git wget

# alias python='python3'
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip install --upgrade diffusers transformers scipy
RUN pip install jupyterlab ipywidgets
RUN pip install -U torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
RUN jupyter nbextension enable --py widgetsnbextension

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
EXPOSE 8888
