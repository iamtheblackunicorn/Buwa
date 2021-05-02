// Black Unicorn Wallpapers by Alexander Abraham, The Black Unicorn.
// Licensed under the MIT license.

import 'constants.dart';
import 'wallpaper.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget{
  final String categoryName;
  final List<dynamic> wallpaperList;
  Category({
    Key key,
    @required this.categoryName,
    @required this.wallpaperList
  })
  : super(key: key);
  @override
  CategoryState createState() => CategoryState();
}
class CategoryState extends State<Category> {
  List<dynamic> wallpapers;
  String category;
  @override
  void initState(){
    wallpapers = widget.wallpaperList;
    category = widget.categoryName;
  }
  @override
  Widget build(BuildContext build){
    return Scaffold(
      backgroundColor: mainColor,
      appBar: new AppBar(
        backgroundColor: mainColor,
        iconTheme: IconThemeData(
          color: accentColor,
        ),
        elevation: stdElevation,
        title: new Text(
          '$category',
          style: new TextStyle(
            fontFamily: defaultFont,
            fontSize: myHeadingFontSize,
            color: accentColor
          )
        ),
      ),
      body: new ListView.builder(
        itemCount: wallpapers.length,
        itemBuilder: (context, index){
          String title = wallpapers[index].keys.elementAt(usefulZero);
          String imageUrl = wallpapers[index][title];
          return Padding(
            padding:EdgeInsets.all(mySpecialPadding),
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(mySpecialRoundingOne),
                side: new BorderSide(
                  color: accentColor,
                  width: stdBorderWidth,
                ),
              ),
              child: new InkWell(
                radius: myBannerDimensions,
                splashColor: accentColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WallPaperScreen(
                        imageUrl: imageUrl,
                        imageTitle: title
                      )
                    ),
                  );
                },
                child: new Stack(
                  children: <Widget> [
                    new ClipRRect(
                      borderRadius: BorderRadius.circular(mySpecialRoundingOne),
                      child: Image.network(
                        '$imageUrl',
                        height: myBannerDimensions,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    ),
                    new Positioned(
                      bottom: titleOffSetOne,
                      left: titleOffSetOne,
                      child: Align(
                        alignment: Alignment(-titleOffSetTwo, titleOffSetTwo),
                        child: Padding(
                          padding: EdgeInsets.all(mySpecialPaddingOne),
                          child: Text(
                            '$title',
                            style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: myHeadingFontSizeOne,
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
          );
        }
      )
    );
  }
}
