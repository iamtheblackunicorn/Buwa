// Black Unicorn Wallpapers by Alexander Abraham, The Black Unicorn.
// Licensed under the MIT license.

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class WallPaperScreen extends StatefulWidget{
  final String imageUrl;
  final String imageTitle;
  WallPaperScreen({
    Key key,
    @required this.imageUrl,
    @required this.imageTitle,
  })
  : super(key: key);
  @override
  WallPaperScreenState createState() => WallPaperScreenState();
}
class WallPaperScreenState extends State<WallPaperScreen>{
  String pictureUrl;
  String pictureTitle;
  bool isInstalled;
  String isInstalling;
  @override
  void initState(){
    super.initState();
    pictureUrl = widget.imageUrl;
    pictureTitle = widget.imageTitle;
    isInstalled = false;
    isInstalling = isInstallingDefault;
  }
  @override
  Widget build(BuildContext context){
    String setMessage = AppLocalizations.of(context).isSetLabel;
    String waitMessage = AppLocalizations.of(context).waitLabel;
    String useMessage = AppLocalizations.of(context).useLabel;
    String infoMessage = AppLocalizations.of(context).infoLabel;
    return Scaffold(
      backgroundColor: mainColor,
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(
                  pictureUrl,
                ),
                fit: BoxFit.cover,
              )
            )
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: new Card(
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(specialRounding)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(stdPadding),
                    child: new Column(
                      children: <Widget> [
                        new Padding(
                          padding: EdgeInsets.all(infoPadding),
                          child: new Text(
                            '$pictureTitle',
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                              color: accentColor,
                              fontSize: infoPadding,
                              fontFamily: defaultFont
                            )
                          )
                        ),
                        new Padding(
                          padding: EdgeInsets.all(specialPaddingTwo),
                          child: new Divider(
                            height: dividerHeight,
                            thickness: dividerHeight,
                            color: accentColor
                          )
                        ),
                        new Padding(
                          padding: EdgeInsets.all(infoPadding),
                          child: new Text(
                            '$isInstalling',
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                              color: accentColor,
                              fontSize: infoPadding,
                              fontFamily: defaultFont
                            )
                          )
                        ),
                      ]
                    )
                  )
                )
              ),
              new SizedBox(
                height: specialBoxSpacing
              ),
            ]
          ),
          Positioned(
            child: AppBar(
              title: Text(
                '$pictureTitle',
                style: TextStyle(
                  color: mainColor,
                  fontSize: textFontSize,
                  fontFamily: defaultFont
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: stdElevation,
              actions: <Widget>[
                IconButton(
                  icon: isInstalled?new Icon(Icons.cloud_done): new Icon(Icons.cloud_download),
                  onPressed: () async {
                    if (isInstalled == true) {
                      setState((){
                        isInstalled = false;
                      });
                    }
                    else {
                      setState((){
                        isInstalling = '$waitMessage';
                      });
                      String url = '$pictureUrl';
                      int homeLocation = WallpaperManager.HOME_SCREEN;
                      int lockLocation = WallpaperManager.LOCK_SCREEN;
                      String resultOne;
                      String resultTwo;
                      var file = await DefaultCacheManager().getSingleFile(url);
                      resultOne = await WallpaperManager.setWallpaperFromFile(file.path, homeLocation);
                      resultTwo = await WallpaperManager.setWallpaperFromFile(file.path, lockLocation);
                      setState((){
                        isInstalled = true;
                      });
                      setState((){
                        isInstalling = '$setMessage';
                      });
                    }
                  },
                  tooltip: '$useMessage',
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}
