#!/bin/bash

# Flutter doctor再実行
flutter doctor

# Android SDKの追加設定
flutter config --android-studio-dir=/usr/lib/android-sdk

# デフォルトのプラットフォームツールをダウンロード
flutter doctor --android-licenses

# サンプルプロジェクトの作成 (オプション)
# flutter create my_first_app

echo "Flutter development environment is ready!"
