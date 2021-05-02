// Black Unicorn Wallpapers by Alexander Abraham, The Black Unicorn.
// Licensed under the MIT license.

import 'aux.dart';
import 'info.dart';
import 'error.dart';
import 'loading.dart';
import 'category.dart';
import 'constants.dart';
import 'wallpaper.dart';
import 'dataHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Home extends StatefulWidget{
  final APIStorage apiStorage;
  Home({
    Key key,
    @required this.apiStorage
  }) : super(key: key);
  @override
  HomeState createState() => HomeState();
}
class HomeState extends State<Home> {
  Future<Map<String,dynamic>> wallpapers;
  @override
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
          return Loading();
        }
        else {
          if (snapshot.hasError) {
            return Error();
          }
          else {
            String exploreMessage = AppLocalizations.of(context).exploreLabel;
            String categoryMessage = AppLocalizations.of(context).categoryLabel;
            String itemsMessage = AppLocalizations.of(context).itemLabel;
            Map<String, dynamic> wallpaperData = snapshot.data;
            List<dynamic> completeItemList = buildWallpaperList(wallpaperData);
            return DefaultTabController(
              length: tabLength,
              child: new Scaffold(
                backgroundColor: mainColor,
                appBar: AppBar(
                  backgroundColor: mainColor,
                  title: new Padding(
                    padding: EdgeInsets.all(verySpecialPadding),
                    child:TabBar(
                      indicatorColor: accentColor,
                      tabs: [
                        Tab(
                          child: new Text(
                            exploreMessage,
                            style: new TextStyle(
                              fontFamily: defaultFont,
                              fontSize: textFontSize,
                              color: accentColor
                            )
                          )
                        ),
                        Tab(
                          child: new Text(
                            categoryMessage,
                            style: new TextStyle(
                              fontFamily: defaultFont,
                              fontSize: textFontSize,
                              color: accentColor
                            )
                          )
                        ),
                      ]
                    )
                  )
                ),
                body: new TabBarView(
                  children: [
                    new ListView.builder(
                      itemCount: completeItemList.length,
                      itemBuilder: (context, index) {
                        String title = completeItemList[index].keys.elementAt(usefulZero);
                        String imageUrl = completeItemList[index][title];
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
                                      alignment: Alignment(
                                        -titleOffSetTwo,
                                        titleOffSetTwo
                                      ),
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
                    ),
                    new ListView.builder(
                      itemCount: wallpaperData.length,
                      itemBuilder: (context, index){
                        String key = wallpaperData.keys.elementAt(index);
                        List<dynamic> categoryList = wallpaperData[key];
                        Map<String, dynamic> firstItem = categoryList[usefulZero];
                        String repKey = firstItem.keys.elementAt(usefulZero);
                        String imageUrl = firstItem[repKey];
                        String catLength = categoryList.length.toString();
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
                                    builder: (context) => Category(
                                      categoryName: key,
                                      wallpaperList:  categoryList
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
                                      alignment: Alignment(
                                        -titleOffSetTwo,
                                        titleOffSetTwo
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(mySpecialPaddingOne),
                                        child: Text(
                                          '$key\n$catLength $itemsMessage',
                                          style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
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
                        );
                      }
                    )
                  ]
                ),
                bottomNavigationBar: new BottomAppBar(
                  color: accentColor,
                  child: new Row(
                    children: <Widget> [
                      new Padding(
                        padding: EdgeInsets.all(stdPadding),
                        child: IconButton(
                          icon: Icon(
                            Icons.sort_rounded,
                            color: mainColor,
                            size: textFontSize,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Info()
                              ),
                            );
                          },
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(stdPadding),
                        child: IconButton(
                          icon: Icon(
                            Icons.sync_sharp,
                            color: mainColor,
                            size: textFontSize,
                          ),
                          onPressed: () {
                            setState((){
                              wallpapers = widget.apiStorage.readData();
                            });
                          },
                        ),
                      )
                    ]
                  )
                ),
              ),
            );
          }
        }
      }
    );
  }
}
