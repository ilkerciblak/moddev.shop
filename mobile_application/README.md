# Modular Shop Mobile Application

# Project Structure


###  System Design Description



<br/>

### Tech Stack

For now, in order to built mobile application only Flutter Framework will be used.

###  Environment Variables

In order to run project locally, create a `.env` file under `lib/common/config/` with 

```bash
BASE_URL='Your APIs Base Url'
AUTHENTICATION_PATH= 'AUTHENTICATION-PATH'
REFRESH_TOKEN_PATH= 'REFRESH-TOKEN-PATH'
SECURE_KEY='32CHARSECURITYKEYFORENCRYPTION'

```



<br/>

###  Dependencies
- Flutter 3.24.4
- XCode and/or Android Studio Simulators

<br/>

###  Installation and Running Project Locally

Clone the project
```bash
$ git clone https://github.com/ilkerciblak/moddev.shop.git 
```

Go to the Mobile Application Directory
```bash
$ cd mobile_application
```

Run the application with flutter cli
```bash
$ flutter run
```

<br/>

###  Used Packages and APIs
- [DummyJson API](https://dummyjson.com) : Free Fake REST API for Placeholder JSON Data, where project fetches product, catalog information and mimics authentication.
- [Get-It](https://pub.dev/packages/get_it) : a simple Service Locator for Dart and Flutter projects with some additional goodies highly inspired. 
- [Bloc](https://pub.dev/packages/bloc): A dart package that helps implement the BLoC pattern.
- [Hive](https://pub.dev/packages/hive): Hive is a lightweight and blazing fast key-value database written in pure Dart.
- [Go-Router](https://pub.dev/packages/go_router): A declarative routing package for Flutter that uses the Router API to provide a convenient, url-based API for navigating between different screens

###  Resources and Acknowledgements
- [Medium - Flutter Architectures Deep Dive](https://medium.com/@yusrasajjad613/architecture-patterns-in-flutter-an-in-depth-guide-0ca2d65c723c)

- [Medium - Optimizing Network Images in Flutter](https://medium.com/make-android/save-your-memory-usage-by-optimizing-network-image-in-flutter-cbc9f8af47cd)

- [A Reddit Discussion on Flutter Architectures](https://www.reddit.com/r/FlutterDev/comments/192h8l0/how_do_you_architect_your_flutter_apps_research/)

- [Flutter Singleton pattern and Get-it](https://salmanbediya-medium-com.translate.goog/getit-simplifying-dependency-injection-with-service-locator-pattern-in-dart-and-flutter-62a2d7d105b8?_x_tr_sl=en&_x_tr_tl=tr&_x_tr_hl=tr&_x_tr_pto=tc&_x_tr_hist=true)

- [UI Inspirations](https://dribbble.com/)

- [Public APIs Repository on GitHub](https://github.com/public-apis/public-apis?tab=readme-ov-file#shopping)
