# BLACK UNICORN WALLPAPERS :black_heart:

*Sexy and beautiful wallpapers for your Android-powered device!* :black_heart:

## About :books:

I've always wanted to write an app that had sexy and elegant wallpapers, so this is it. In my opinion most other apps have pretty
boring very unsexy wallpapers.

## Download :inbox_tray:

- *Dark Angel* (v.1.0.0): Still work in progress.

## Building :hammer:

Make sure that you have the following programs installed:

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
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *Black Unicorn Wallpapers*.

## Changelog :black_nib:

### Version 1.0.0: Initial Release:

- upload to GitHub
- initial release
- speed and elegance

## Note :scroll:

- *Black Unicorn Wallpapers* :black_heart: by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn"* :unicorn:
- licensed under the MIT license.
