#!/usr/bin/env bash
#Place this script in project/android/app/

cd ..

# fail if any command fails
set -e
# debug log
set -x

cd ..
git clone -b beta https://github.com/flutter/flutter.git
# shellcheck disable=SC2155
export PATH=$(pwd)/flutter/bin:$PATH

flutter channel stable
flutter doctor

echo "Installed flutter to $(pwd)/flutter"

function build_mode_debug() {
  flutter build apk --debug --build-number "$APPCENTER_BUILD_ID"

  # copy the APK where AppCenter will find it
  mkdir -p android/app/build/outputs/apk/;
  mv build/app/outputs/flutter-apk/app-debug.apk "$_"
}

function build_mode_release() {
  flutter build apk --release --build-number "$APPCENTER_BUILD_ID"

  # copy the APK where AppCenter will find it
  mkdir -p android/app/build/outputs/apk/;
  mv build/app/outputs/apk/release/app-release.apk "$_"
}

build_mode_debug