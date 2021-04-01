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
  String isInstalled;
  void initState(){
    super.initState();
    pictureUrl = widget.imageUrl;
    pictureNumber = widget.imageNumber;
    pictureTitle = widget.imageTitle;
    isSet = setWallpaperMessage;
    isInstalled = notInstalledMessage;
  }
  @override
  Widget build(BuildContext context){
    String wallpaperMessage = AppLocalizations.of(context).wallpaperLabel;
    String setMessage = AppLocalizations.of(context).isSetLabel;
    String waitMessage = AppLocalizations.of(context).waitLabel;
    String doneMessage = AppLocalizations.of(context).doneLabel;
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
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(stdRounding),
                  child: Image.network(
                    '$pictureUrl',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              )
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child:new Card(
                color: accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(specialRounding)
                ),
                child: Padding(
                  padding: EdgeInsets.all(stdPadding),
                  child: new Column(
                    children: <Widget> [
                      new Text(
                        '$pictureTitle',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          color: mainColor,
                          fontSize: textFontSize,
                          fontFamily: defaultFont
                        )
                      ),
                      new Padding(
                        padding: EdgeInsets.all(specialPaddingTwo),
                        child: new Divider(
                          height: dividerHeight,
                          thickness: dividerHeight,
                          color: mainColor
                        )
                      ),
                      new Text(
                        '$isInstalled',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          color: mainColor,
                          fontSize: textFontSize,
                          fontFamily: defaultFont
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
                setState((){
                  isInstalled = '$waitMessage';
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
                  isSet = '$setMessage';
                });
                setState((){
                  isInstalled = '$doneMessage';
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
