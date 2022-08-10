# **`WhatIsMyIP - Clean Architecture`** ✨

## Features in app
- Dark Mode
- Localization

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
│   │   ├── ipinfo(details screen)
│   │   │	├── data
│   │   │	│   ├── datasources
│   │   │	│   ├── models
│   │   │	│   └── repositories
│   │   │	├── domain
│   │   │	│   ├── entities
│   │   │	│   ├── repositories
│   │   │	│   └── usecases
│   │   │	└── presentation
│   │   │	    ├── cubit
│   │   │	    ├── screens
│   │   │	    └── widgets
│   │   └── myip (home screen)
│   │    	├── data
│   │   	│   ├── datasources
│   │   	│   ├── models
│   │    	│   └── repositories
│   │    	├── domain
│   │    	│   ├── entities
│   │    	│   ├── repositories
│   │    	│   └── usecases
│   │    	└── presentation
│   │    	    ├── cubit
│   │    	    ├── screens (or pages)
│   │    	    └── widgets
│   ├── app.dart
│   ├── bloc_observer.dart
│   ├── injection_container.dart
│   └── main.dart
├── pubspec.lock
├── pubspec.yaml
```

## Screenshots

![](/readme_images/myip-home.jpg)
![](/readme_images/more-details.jpg)
![](/readme_images/drawer.jpg)
![](/readme_images/dark-mode.jpg)
![](/readme_images/arabic.jpg)
![](/readme_images/error.jpg)
