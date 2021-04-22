<p align="center">
 <img src="https://github.com/iamtheblackunicorn/Buwa/raw/main/assets/images/banner.png"/>
</p>


# BLACK UNICORN WALLPAPERS :black_heart:

*Sexy and beautiful wallpapers for your Android-powered device!* :black_heart:

## About :books:

I've always wanted to write an app that had sexy and elegant wallpapers, so this is it. In my opinion most other apps have pretty
boring very unsexy wallpapers.

## Features :test_tube:

- sexy and aesthetically-pleasing wallpapers
- super fast performance
- easy to use
- new wallpapers are added every week
- localized for German, English, and Spanish
- elegant and minimalist design

## Download :inbox_tray:

- *Dark Angel* (v.1.0.0):
  - ***[Download for Android](https://github.com/iamtheblackunicorn/Buwa/releases/download/v.1.0.0/Buwa-v1.0.0-DarkAngel-Release.apk) (17.7 MB)***
- *Winged Lady* (v.1.1.0):
  - ***[Download for Android](https://github.com/iamtheblackunicorn/Buwa/releases/download/v.1.1.0/Buwa-v1.1.0-WingedLady-Release.apk) (17.6 MB)***

## Google Play :robot:

[![Get it on Google Play!](https://blckunicorn.art/assets/images/static/GooglePlayDownload.png)](https://play.google.com/store/apps/details?id=com.blackunicorn.buwa)

## Building :hammer:

Make sure that you have the following programmes installed:

- Flutter SDK
- Dart SDK
- Android Studio
- Android SDK
- Java JDK
- Xcode
- Make
- Git

After you have installed these, run this command to generate a keystore for the app.

```bash
$ keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the Java keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *Black Unicorn Wallpapers*.

## Extending the supported languages :book:

*Black Unicorn Wallpapers* is localized for German, English, and Spanish. To add a language, simply create a file called `app_languagecode.arb` in `lib/l10n` where `languagecode` represents the language code for the language you want to add. If it were Spanish for example, you would create a file called `app_es.arb`.
Copy and paste the contents from one of the other `*.arb` files and edit the strings accordingly.
Finally, add this line in the list `supportedLocales` in the file `lib/main.dart`.

```dart
const Locale('languagecode', ''),
```

`languagecode` represents the language you are translating for.

## Changelog :black_nib:

### Version 1.0.0: ***Dark Angel***

- upload to GitHub
- initial release
- speed and elegance

### Version 1.1.0: ***Winged Lady***

- performance improvements
- layout fixes for different device sizes

## Note :scroll:

- *Black Unicorn Wallpapers :black_heart:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
