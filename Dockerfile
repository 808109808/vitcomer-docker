FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

RUN apt-get update && apt-get install -y \
    git unzip vim wget curl libgl1-mesa-glx && \
    pip install --upgrade pip

RUN pip install mmcv-full==1.4.2 -f https://download.openmmlab.com/mmcv/dist/cu111/torch1.9.0/index.html \
    && pip install mmdet==2.22.0 \
    && pip install timm==0.4.12 \
    && pip install opencv-python tqdm

WORKDIR /workspace
