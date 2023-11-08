FROM nvidia/cuda:11.8.0-devel-ubuntu22.04
ENV TORCH_CUDA_ARCH_LIST="8.0;8.6"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --no-install-recommends -yy build-essential libpython3.11-dev python3.11 curl git
RUN curl -L https://bootstrap.pypa.io/get-pip.py|python3.11
WORKDIR /build
COPY . . 
RUN pip -vv wheel --debug . 
CMD cp xformers*.whl /output/


