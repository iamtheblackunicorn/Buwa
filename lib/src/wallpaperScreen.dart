import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class WallPaperScreen extends StatefulWidget{
  final String imageUrl;
  final String imageNumber;
  final String imageTitle;
  WallPaperScreen({Key key, @required this.imageUrl, @required this.imageNumber, @required this.imageTitle}) : super(key: key);
  @override
  WallPaperScreenState createState() => WallPaperScreenState();
}
class WallPaperScreenState extends State<WallPaperScreen>{
  String pictureUrl;
  String pictureNumber;
  String isSet;
  String pictureTitle;
  void initState(){
    super.initState();
    pictureUrl = widget.imageUrl;
    pictureNumber = widget.imageNumber;
    pictureTitle = widget.imageTitle;
    isSet = 'Initialize me!';
  }
  @override
  Widget build(BuildContext context){
    String wallpaperMessage = AppLocalizations.of(context).wallpaperLabel;
    String setMessage = AppLocalizations.of(context).isSetLabel;
    String setterMessage = AppLocalizations.of(context).setMeLabel;
    setState((){
      isSet = setterMessage;
    });
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(stdPadding),
              child:new Text(
                '$wallpaperMessage $pictureNumber',
                style: TextStyle(
                  color: accentColor,
                  fontSize: textFontSize,
                  fontFamily: defaultFont
                ),
              ),
            )
          ]
        ),
        elevation: stdElevation,
        backgroundColor: mainColor,
      ),
      backgroundColor: mainColor,
      body: new Center(
        child: new Column(
          children: <Widget> [
            new SizedBox(
              height: specialSpacing
            ),
            new Padding(
              padding: EdgeInsets.all(specialPadding),
              child: new SizedBox(
                height: pictureBoxHeight,
                width: pictureBoxWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(stdRounding),
                  child: new Stack(
                    children: <Widget> [
                      new Image.network(
                        '$pictureUrl',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      new Positioned(
                        bottom: 0.2,
                        left: 0.2,
                        child: Align(
                          alignment: Alignment(-0.8, 0.8),
                          child: Padding(
                            padding: EdgeInsets.all(stdPadding),
                            child: Text(
                              '$pictureTitle',
                              style: TextStyle(
                                color: mainColor,
                                fontSize: textFontSize,
                                fontFamily: defaultFont
                              ),
                            )
                          )
                        )
                      )
                    ]
                  )
                )
              )
            ),
            new SizedBox(
              height: boxSpacing
            ),
            new ElevatedButton(
              child: Text(
                '$isSet'
              ),
              onPressed: () async {
                String url = '$pictureUrl';
                int homeLocation = WallpaperManager.HOME_SCREEN;
                int lockLocation = WallpaperManager.LOCK_SCREEN;
                String resultOne;
                String resultTwo;
                var file = await DefaultCacheManager().getSingleFile(url);
                resultOne = await WallpaperManager.setWallpaperFromFile(file.path, homeLocation);
                resultTwo = await WallpaperManager.setWallpaperFromFile(file.path, lockLocation);
                setState((){
                  isSet = '$setMessage';
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(stdRounding)
                ),
                primary: accentColor,
                padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
                textStyle: TextStyle(
                  fontSize: textFontSize,
                  color: mainColor,
                  fontFamily: defaultFont
                )
              ),
            ),
          ]
        )
      )
    );
  }
}
