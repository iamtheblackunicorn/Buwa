// Black Unicorn Wallpapers by Alexander Abraham, The Black Unicorn.
// Licensed under the MIT license.

import 'dataHandler.dart';
import 'errorScreen.dart';
import 'loadingScreen.dart';
import 'wallpaperScreen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  final APIStorage apiStorage;
  Home({Key key, @required this.apiStorage}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}
class HomeState extends State<Home> {
  Future<Map<String,dynamic>> wallpapers;
  PageController pageController = PageController(initialPage:0);
  void initState(){
    super.initState();
    wallpapers = widget.apiStorage.readData();
  }
  @override
  Widget build(BuildContext context){
    return FutureBuilder<Map<String, dynamic>>(
      future: wallpapers,
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return LoadingScreen();
        }
        else {
          if (snapshot.hasError) {
            return ErrorScreen();
          }
          else {
            Map<String, dynamic> remoteWallpapers = snapshot.data;
            List<Widget> screens = [];
            for (int i = 0; i < remoteWallpapers.length; i++){
              String key = remoteWallpapers.keys.elementAt(i);
              String url = remoteWallpapers[key][0];
              String title = remoteWallpapers[key][1];
              String author = remoteWallpapers[key][2];
              String authorPic = remoteWallpapers[key][3];
              screens.add(
                WallPaperScreen(
                  imageUrl: url,
                  imageNumber: key,
                  imageTitle: title,
                  imageAuthor: author,
                  imageAuthorPicture: authorPic
                )
              );
            }
            return PageView(
              controller: pageController,
              children: screens
            );
          }
        }
      }
    );
  }
}
