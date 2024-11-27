FROM ubuntu:latest

# システムの更新
RUN apt-get update 

# 必要な依存関係のインストール
RUN apt-get install -y \
    git \
    wget \
    unzip \
    xz-utils \
    libglu1-mesa \
    cmake \
    build-essential

# Flutter SDK のダウンロードとインストール
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.5-stable.tar.xz
RUN tar xf flutter_linux_3.16.5-stable.tar.xz -C /opt
RUN rm flutter_linux_3.16.5-stable.tar.xz

# PATH の設定
ENV PATH "$PATH:/opt/flutter/bin"

# Flutter の doctor を実行
RUN flutter doctor
