import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String wallpapersAPI = 'https://blckunicorn.art/assets/buwa/api/wallpapers.json';
Dio dio = new Dio();
Color mainColor = Color(0xFFFFFFFF);
Color accentColor = Color(0xFF000000);
String defaultFont = 'Lobster';

String setWallpaperMessage = 'Set wallpaper';
String notInstalledMessage = 'Not installed.';

double textFontSize = 25;
double animationSize = 150;
double animationSpacing = 250;
double stdElevation = 0;
double stdRounding = 25;
double verticalPadding = 6;
double horizontalPadding = 60;
double boxSpacing = 20;
double specialSpacing = 10;
double specialPadding = 30;
double pictureBoxWidth = 300;
double pictureBoxHeight = 500;
double stdPadding = 10;
double dividerHeight = 1;
double specialPaddingTwo = 6;
double specialRounding = 15;
