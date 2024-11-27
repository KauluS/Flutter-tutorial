# Dockerfile for Flutter Development in GitHub Codespaces
FROM debian:bullseye-slim

# 必要な依存関係のインストール
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    libpulse0 \
    libx11-6 \
    libgl1-mesa-glx \
    wget

# Android SDKとJDKに必要な依存関係
RUN apt-get install -y \
    openjdk-11-jdk \
    android-sdk

# Flutter SDKのダウンロードとインストール
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.5-stable.tar.xz -O flutter.tar.xz
RUN tar xf flutter.tar.xz -C /opt
RUN rm flutter.tar.xz

# パスの設定
ENV PATH="/opt/flutter/bin:${PATH}"
ENV ANDROID_HOME="/usr/lib/android-sdk"

# Flutter doctorの実行と初期設定
RUN flutter precache
RUN yes | flutter doctor --android-licenses

# VSCode extensionsのセットアップ用の.devcontainer設定ファイル
COPY .devcontainer/devcontainer.json /workspace/.devcontainer/devcontainer.json
COPY .devcontainer/post-create.sh /workspace/.devcontainer/post-create.sh

# 作業ディレクトリの設定
WORKDIR /workspace
