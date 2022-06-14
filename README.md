# test_template

A new Flutter project.

# Table of Contents
* [1. Getting Started](#1-getting-started)
* [2. Feature](#2-feature)
* [3. Project structure](#3-project-structure)
* [4. Assets and images](#4-assets-and-images)
* [5. Localization and internationalization](#5-localization-and-internationalization)
* [6. Create new screen](#6-create-new-screen)
* [7. Install](#7-install)
* [8. Generate code](#8-generate-code)
* [9. Help](#9-help)
* [10. Run on macOS](#10-run-on-macos)
* [11. Deploy distribute app with AppCenter](#11-deploy-distribute-app-with-appcenter)

## 1. Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 2. Feature

- Support multiple language (device or manual)
- Support multiple theme (include light and dark theme)
- Support device_preview
- Support responsive layout
- Support restore navigation when kill app
- Split [atomics design](https://itnext.io/atomic-design-with-flutter-11f6fcb62017) 
- [Domain Driven Design Flutter Architecture](https://github.com/mhadaily/flutter-architecture-ddd)


## 3. Project structure


    .    
    ├── lib                                              # The directory project
    |   ├── src                                          # The directory project app
    |   |   ├── common                                   # The directory contains all common
    |   |   |   ├── configs                              # The directory contains all configs
    |   |   |   |   ├── dependency_injection             # The directory contains all configs dependencies injection
    |   |   |   |   ├── device_preview                   # The directory contains options of device_preview library
    |   |   |   |   ├── env                              # The directory contains all configs environment
    |   |   |   |   ├── hive                             # The directory contains options of hive library
    |   |   |   ├── utilities                            # The directory contains all useful functions
    |   |   |   ├── widgets                              # The directory contains all common widgets
    |   |   |   ├── routes                               # The directory contains all config routes in app
    |   |   ├── features                                 # The directory main app
    |   |   ├── gen                                      # The directory generate file images, fonts, colors...
    |   |   ├── localization                             # The directory container all languages
    |   |   ├── routers                                  # The directory container all routers
    |   |   ├── app.dart                                 # The file app
    |   ├── main.dart                                    # The file main app
    ├── analysis_options.yaml                            # The file setting lint code
    ├── Makefile                                         # The file contains all commands useful
    ├── pubspec.yaml                                     # The file contains all install package
    └── README.md                                        # Documents


## 4. Assets and images

- Used package [flutter_gen](https://pub.dev/packages/flutter_gen)

## 5. Localization and internationalization

- **Step 1**: Define strings that need to be translated

  - Open file **app_localization.dart** and write code in **TODO(username): Define strings that need to be translated.**

- **Step 2**: Run command to generate arb files **intl_messages.arb**

    ```shell
    make generate-template-l10n
    ```
  
- **Step 3**: Add new language in file **"lib/src/localization/locale_support.dart"** 

  - Notes: Name file follow format **intl_[languageCode].arb** with [languageCode](http://www.lingoes.net/en/translator/langcode.htm)

- **Step 4**: Create file languages mapping with variables **locales** in the folder "lib/src/localization/arb_files/"
 
  - Example: locales = ["en", "vi"] -> create 2 file **intl_en.arb** and **intl_vi.arb**
  - Copy content file intl_messages.arb and pastes 2 files above
  - Insert key **"@@locale"** corresponding to each file,
      - Insert "@@locale": "en" -> file intl_en.arb
      - Insert "@@locale": "vi" -> file intl_vi.arb

- **Step 4**: Run command which converts those JSON maps into .dart files.
  
  ```bash
  make generate-from-arb
  ```
  or if you have added new files please add the path in the command **generate-from-arb**
  - Example: 
  ```shell
      flutter pub run intl_translation:generate_from_arb
    --output-dir=lib/src/localization/dart_files
    --no-use-deferred-loading lib/src/localization/app_localization.dart
    lib/src/localization/arb_files/intl_en.arb
    lib/src/localization/arb_files/intl_it.arb
    lib/src/localization/arb_files/intl_es.arb
    ... add new path
  ```

- **Step 5**: Guide Used

  ```dart
  Text(AppLocalization.of(context)?.settings ?? ''),
  ```
  
## 6. Create new screen

- **Step 1**: add new path in file **lib/src/routers/constants/root_path.dart**

  ```dart
  abstract class RootPath {
    static const settings = '/settings';
    static const settingLanguages = '/settings/languages'; /// <- add new path
  }
  ```
  
- **Step 2**: create new screen

  ```dart
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc_navigator_2/src/localization/app_localization.dart';
  import 'package:flutter_bloc_navigator_2/src/routers/e_page.dart';
  
  class LanguageScreen extends EPage {
    const LanguageScreen({required Map<String, dynamic> args})
        : super(args: args);
  
    @override
    Widget build(BuildContext context) {
      return const LanguageView();
    }
  }
  
  class LanguageView extends StatelessWidget {
    const LanguageView({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(8),
                splashFactory: InkRipple.splashFactory,
                splashColor: CupertinoColors.link.withOpacity(0.2),
                highlightColor: CupertinoColors.link.withOpacity(0.1),
                hoverColor: CupertinoColors.link.withOpacity(0.1),
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Back',
                    style: TextStyle(color: CupertinoColors.link),
                  ),
                ),
              )
            ],
          ),
          title: Text(AppLocalization.of(context)?.settings ?? ''),
        ),
        body: Container(),
      );
    }
  }
  ```
- **Step 3**: create new route in file **lib/src/routers/constants/routes.dart**

  ```dart
  Map<String, EPage Function(Map<String, dynamic>)> _routes = {
    RootPath.settings: (args) => SettingScreen(args: args),
    RootPath.settingLanguages: (args) => LanguageScreen(args: args), /// <- add new route
  };
  ```
  
## 7. Install

```shell
  make install
```

## 8. Generate code

```shell
  make rebuild
```

## 9. Help

```shell
  make help
```

## 10. Run on macOS

macOS needs you to request a specific entitlement in order to access the network. 
To do that open **macos/Runner/DebugProfile.entitlements** and add the following key-value pair.

```
  <key>com.apple.security.network.client</key>
  <true/>
```
Then do the same thing in **macos/Runner/Release.entitlements.**

You can read more about this in the [Desktop support for Flutter documentation.](https://flutter.dev/multi-platform/desktop#setting-up-entitlements)

Start project on macOS with command 

```shell
  make macos
```

## 11. Deploy distribute app with AppCenter

  - **Step 1**: For the Android project to be detected by AppCenter,
remove (or comment out) **gradle-wrapper.jar**, **gradlew** and **gradlew.bat** 
from the **.gitignore** file in path **folder_project/android/.gitignore** created by flutter with the new project.
  
  ```diff
  - gradle-wrapper.jar
  /.gradle
  /captures/
  - /gradlew
  - /gradlew.bat
  /local.properties
  GeneratedPluginRegistrant.java
  
  # Remember to never publicly share your keystore.
  # See https://flutter.dev/docs/deployment/android#reference-the-keystore-from-the-app
  key.properties
  **/*.keystore
  **/*.jks
  ```

  - **Step 2**: Copy file **appcenter-post-clone.sh** in path **folder_project/android/app/** with below command:

  - **Step 3**: call function you want to build

  ```diff
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
  
  + build_mode_debug
  ```

  - **Step 4**: Downgrade version gradle **4.1.3**

  ```diff
  // Copyright 2014 The Flutter Authors. All rights reserved.
  // Use of this source code is governed by a BSD-style license that can be
  // found in the LICENSE file.
  
  // This file is auto generated.
  // To update all the build.gradle files in the Flutter repo,
  // See dev/tools/bin/generate_gradle_lockfiles.dart.
  
  buildscript {
      ext.kotlin_version = '1.5.31'
      repositories {
          google()
          mavenCentral()
      }
  
      dependencies {
          + classpath 'com.android.tools.build:gradle:4.1.3'
          classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
      }
  
      configurations.classpath {
          resolutionStrategy.activateDependencyLocking()
      }
  }
  
  allprojects {
      repositories {
          google()
          mavenCentral()
      }
  }
  
  rootProject.buildDir = '../build'
  
  subprojects {
      project.buildDir = "${rootProject.buildDir}/${project.name}"
  }
  subprojects {
      project.evaluationDependsOn(':app')
      dependencyLocking {
          ignoredDependencies.add('io.flutter:*')
          lockFile = file("${rootProject.projectDir}/project-${project.name}.lockfile")
          if (!project.hasProperty('local-engine-repo')) {
            lockAllConfigurations()
          }
      }
  }
  
  task clean(type: Delete) {
      delete rootProject.buildDir
  }
  ```

  - **Step 5**: Go to [AppCenter](https://appcenter.ms/) register account
      - Create new app -> Choose OS **Android** -> Platform **Java / Kotlin**
      - Choose **Build** -> Connect to repository -> build