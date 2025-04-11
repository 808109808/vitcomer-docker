# FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

# RUN apt-get update && apt-get install -y \
#     git unzip vim wget curl libgl1-mesa-glx && \
#     pip install --upgrade pip

# RUN pip install mmcv-full==1.4.2 -f https://download.openmmlab.com/mmcv/dist/cu111/torch1.9.0/index.html \
#     && pip install mmdet==2.22.0 \
#     && pip install timm==0.4.12 \
#     && pip install opencv-python tqdm

# WORKDIR /workspace

# 换成 NVIDIA 的 CUDA 11.1 运行时镜像（Ubuntu20.04），国内一般可访问
FROM nvcr.io/nvidia/cuda:11.1-cudnn8-runtime-ubuntu20.04

# 常用依赖
RUN apt-get update && apt-get install -y \
    git unzip vim wget curl libgl1-mesa-glx && \
    rm -rf /var/lib/apt/lists/*

# 安装指定版本的 PyTorch 1.9.0 + cu111
# 使用官方 PyTorch 的额外索引地址
RUN pip install --upgrade pip && \
    pip install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 \
        --extra-index-url https://download.pytorch.org/whl/cu111 && \
    # 安装其他依赖
    pip install mmcv-full==1.4.2 -f https://download.openmmlab.com/mmcv/dist/cu111/torch1.9.0/index.html && \
    pip install mmdet==2.22.0 timm==0.4.12 opencv-python tqdm

# 工作目录
WORKDIR /workspace
