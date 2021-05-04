<p align="center">
 <img src="https://github.com/iamtheblackunicorn/Buwa/raw/main/assets/images/banner.png"/>
</p>

# BLACK UNICORN WALLPAPERS :black_heart:

*Sexy and beautiful wallpapers for your Android-powered device!* :black_heart:

## About :books:

I've always wanted to write an app that had sexy and elegant wallpapers, so this is it. In my opinion most other apps have pretty
boring very unsexy wallpapers.

## Features :test_tube:

- Sexy and aesthetically-pleasing wallpapers!
- Super fast performance!
- Easy to use!
- New wallpapers are added every week!
- Localised for German, English, and Spanish
- Elegant and minimalist design!
- Choose from categories or explore all wallpapers!

## Download :inbox_tray:

- ***Dark Angel*** (v.1.0.0):
  - ***[Download for Android](https://github.com/iamtheblackunicorn/Buwa/releases/download/v.1.0.0/Buwa-v1.0.0-DarkAngel-Release.apk) (17.7 MB)***
- ***Winged Lady*** (v.1.1.0):
  - ***[Download for Android](https://github.com/iamtheblackunicorn/Buwa/releases/download/v.1.1.0/Buwa-v1.1.0-WingedLady-Release.apk) (17.6 MB)***
- ***Pegasus*** (v.1.2.0):
  - ***[Download for Android](https://github.com/iamtheblackunicorn/Buwa/releases/download/v.1.2.0/Buwa-v1.2.0-Pegasus-Release.apk) (17.6 MB)***
- ***Maison Artistique*** (v.1.3.0):
  - ***[Download for Android](https://github.com/iamtheblackunicorn/Buwa/releases/download/v.1.3.0/Buwa-v1.3.0-MaisonArtistique-Release.apk) (17.9 MB)***

## Google Play :robot:

[![Get it on Google Play!](https://blckunicorn.art/assets/images/static/GooglePlayDownload.png)](https://play.google.com/store/apps/details?id=com.blackunicorn.buwa)

## YouTube :tv:

You can watch the promotional video for Black Unicorn Wallpapers [here](https://youtu.be/GQMbwYf3gCs)!

## Check it out on [itsAllWidgets](https://itsallwidgets.com/)

Click [here](https://itsallwidgets.com/buwa-black-unicorn-wallpapers).


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

### Version 1.2.0: ***Pegasus***

- major visual overhaul
- complete rebranding
- major performance improvements

### Version 1.3.0: ***Maison Artistique***

- Major layout and functionality overhaul.
- This app is no longer a tool but a work of art and precision.
- More intuitive design.
- More elegant theme, font, and layout.
- Users can now choose from multiple categories.

## Note :scroll:

- *Black Unicorn Wallpapers :black_heart:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
