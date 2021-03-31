import 'package:flutter/material.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class WallPaperScreen extends StatefulWidget{
  final String imageUrl;
  final String imageNumber;
  WallPaperScreen({Key key, @required this.imageUrl, , @required this.imageNumber}) : super(key: key);
  @override
  WallPaperScreenState createState() => WallPaperScreenState();
}
class WallPaperScreenState extends State<WallPaperScreen>{
  String pictureUrl;
  String pictureNumber;
  String isSet;
  void initState(){
    super.initState();
    pictureUrl = widget.imageUrl;
    pictureNumber = widget.imageNumber;
    isSet = 'Set Wallpaper';
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: new Center(
        child: new Column(
          children: <Widget> [
            new SizedBox(
              height: 80
            ),
            new Padding(
              padding: EdgeInsets.all(20),
              child: new Text(
                'Wallpaper $pictureNumber',
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFFFFFFF)
                )
              )
            ),
            new Padding(
              padding: EdgeInsets.all(30),
              child: new SizedBox(
                height: 500,
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    '$pictureUrl',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              )
            ),
            new SizedBox(
              height: 50
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
                  isSet = 'Set!';
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                ),
                primary: Color(0xFF6600FF),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 60),
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFFFFFFF)
                )
              ),
            ),
          ]
        )
      )
    );
  }
}
