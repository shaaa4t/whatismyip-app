# **`WhatIsMyIP - Clean Architecture`** 🚀

## In clean architecture, there are three main layers
- config
- core
- features

## Each feature has three main layers
- data
- domain
- presentation

## Implementing Reso Coder’s Clean Architecture

![](/readme_images/flow.png)

## Project Structure 
```dart 
├── lang
├── lib
│   ├── config
│   │   ├── locale
│   │   ├── routes
│   │   └── themes
│   ├── core
│   │   ├── api
│   │   ├── error
│   │   ├── network
│   │   ├── usecases
│   │   ├── utils
│   │   └── widgets
│   ├── features
│   │   ├── ipinfo (details screen)
│   │   │   ├── data
│   │   │   │   ├── datasources
│   │   │   │   ├── models
│   │   │   │   └── repositories
│   │   │   ├── domain
│   │   │   │   ├── entities
│   │   │   │   ├── repositories
│   │   │   │   └── usecases
│   │   │   └── presentation
│   │   │       ├── cubit
│   │   │       ├── screens
│   │   │       └── widgets
│   │   └── myip (home screen)
│   │       ├── data
│   │       │   ├── datasources
│   │       │   ├── models
│   │       │   └── repositories
│   │       ├── domain
│   │       │   ├── entities
│   │       │   ├── repositories
│   │       │   └── usecases
│   │       └── presentation
│   │           ├── cubit
│   │           ├── screens
│   │           └── widgets
│   ├── app.dart
│   ├── bloc_observer.dart
│   ├── injection_container.dart
│   └── main.dart
├── pubspec.lock
├── pubspec.yaml
```

## Screenshots

![](/readme_images/myip-home.png)    ![](/readme_images/more-details.png)

![](/readme_images/drawer.png)   ![](/readme_images/dark-mode.png)

![](/readme_images/arabic.png)   ![](/readme_images/error.png)

#### _Main resource 👉 [Github](https://github.com/ismailelmogy/quotes), [Udemy](https://www.udemy.com/course/clean-architecture-in-flutter-arabic/)_
