FROM ubuntu:latest

# システムの更新と必要な依存関係のインストール
RUN apt-get update && apt-get install -y \
    git \
    wget \
    unzip \
    xz-utils \
    libglu1-mesa \
    cmake \  # CMakeを追加
    build-essential  # C/C++のビルドツールも追加すると良いでしょう

# Flutter SDK のダウンロードとインストール
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.5-stable.tar.xz
RUN tar xf flutter_linux_3.16.5-stable.tar.xz -C /opt
RUN rm flutter_linux_3.16.5-stable.tar.xz

# PATH の設定
ENV PATH "$PATH:/opt/flutter/bin"

# Flutter の doctor を実行
RUN flutter doctor
