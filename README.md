# **`WhatIsMyIP - Clean Architecture`** π

## In clean architecture, there are three main layers
- config
- core
- features

## Each feature has three main layers
- data
- domain
- presentation

## Implementing Reso Coderβs Clean Architecture

![](/readme_images/flow.png)

## Project Structure 
```dart 
βββ lang
βββ lib
β   βββ config
β   β   βββ locale
β   β   βββ routes
β   β   βββ themes
β   βββ core
β   β   βββ api
β   β   βββ error
β   β   βββ network
β   β   βββ usecases
β   β   βββ utils
β   β   βββ widgets
β   βββ features
β   β   βββ ipinfo (details screen)
β   β   β   βββ data
β   β   β   β   βββ datasources
β   β   β   β   βββ models
β   β   β   β   βββ repositories
β   β   β   βββ domain
β   β   β   β   βββ entities
β   β   β   β   βββ repositories
β   β   β   β   βββ usecases
β   β   β   βββ presentation
β   β   β       βββ cubit
β   β   β       βββ screens
β   β   β       βββ widgets
β   β   βββ myip (home screen)
β   β       βββ data
β   β       β   βββ datasources
β   β       β   βββ models
β   β       β   βββ repositories
β   β       βββ domain
β   β       β   βββ entities
β   β       β   βββ repositories
β   β       β   βββ usecases
β   β       βββ presentation
β   β           βββ cubit
β   β           βββ screens
β   β           βββ widgets
β   βββ app.dart
β   βββ bloc_observer.dart
β   βββ injection_container.dart
β   βββ main.dart
βββ pubspec.lock
βββ pubspec.yaml
```

## Screenshots

![](/readme_images/myip-home.png)    ![](/readme_images/more-details.png)

![](/readme_images/drawer.png)   ![](/readme_images/dark-mode.png)

![](/readme_images/arabic.png)   ![](/readme_images/error.png)

#### _Main resource π [Github](https://github.com/ismailelmogy/quotes), [Udemy](https://www.udemy.com/course/clean-architecture-in-flutter-arabic/)_
