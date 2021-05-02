// Black Unicorn Wallpapers by Alexander Abraham, The Black Unicorn.
// Licensed under the MIT license.

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Info extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    String infoMessage = AppLocalizations.of(context).infoLabel;
    String versionMessage = AppLocalizations.of(context).versionLabel;
    String licenseMessage = AppLocalizations.of(context).licenseLabel;
    String authorMessage = AppLocalizations.of(context).authorLabel;
    String twitterMessage = AppLocalizations.of(context).twitterLabel;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: accentColor,
        ),
        elevation: stdElevation,
        backgroundColor: mainColor,
        title: new Text(
          '$infoMessage',
          style: new TextStyle(
            color: accentColor,
            fontSize: textFontSize,
            fontFamily: defaultFont
          )
        )
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(
            children: <Widget> [
              new Padding(
                padding: EdgeInsets.all(mySpecialPadding),
                child:new SizedBox(
                  width: logoDimensions,
                  height: logoDimensions,
                  child: new Image(
                    image: AssetImage(
                      '$logoPath'
                    )
                  )
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(mySpecialPadding),
                child: new SizedBox(
                  width: boxWidth,
                  height: boxHeight,
                  child:new Card(
                    color: accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(mySpecialRounding)
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        new Padding(
                          padding: EdgeInsets.all(infoPadding),
                          child: new Text(
                            '$versionMessage',
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: textFontSize,
                              fontFamily: defaultFont
                            )
                          )
                        ),
                        new Padding(
                          padding: EdgeInsets.all(infoPadding),
                          child: new Text(
                            '$appVersion',
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: textFontSize,
                              fontFamily: defaultFont
                            )
                          )
                        )
                      ]
                    )
                  )
                )
              ),
              new Padding(
                padding: EdgeInsets.all(mySpecialPadding),
                child: new SizedBox(
                  width: boxWidth,
                  height: boxHeight,
                  child:new Card(
                    color: accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(mySpecialRounding)
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        new Padding(
                          padding: EdgeInsets.all(infoPadding),
                          child: new Text(
                            '$authorMessage',
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: textFontSize,
                              fontFamily: defaultFont
                            )
                          )
                        ),
                        new Padding(
                          padding: EdgeInsets.all(infoPadding),
                          child: new Text(
                            '$appAuthor',
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: textFontSize,
                              fontFamily: defaultFont
                            )
                          )
                        )
                      ]
                    )
                  )
                )
              ),
              new Padding(
                padding: EdgeInsets.all(mySpecialPadding),
                child: new SizedBox(
                  width: boxWidth,
                  height: boxHeight,
                  child:new Card(
                    color: accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(mySpecialRounding)
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        new Padding(
                          padding: EdgeInsets.all(infoPadding),
                          child:new Text(
                            '$licenseMessage',
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: textFontSize,
                              fontFamily: defaultFont
                            )
                          )
                        ),
                        new Padding(
                          padding: EdgeInsets.all(infoPadding),
                          child:new Text(
                            '$appLicense',
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: textFontSize,
                              fontFamily: defaultFont
                            )
                          )
                        )
                      ]
                    )
                  )
                )
              ),
              new Padding(
                padding: EdgeInsets.all(mySpecialPadding),
                child: new SizedBox(
                  width: boxWidth,
                  height: boxHeight,
                  child:new Card(
                    color: accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(mySpecialRounding)
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        new Padding(
                          padding: EdgeInsets.all(infoPadding),
                          child:new Text(
                            '$twitterMessage',
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: textFontSize,
                              fontFamily: defaultFont
                            )
                          )
                        ),
                        new Padding(
                          padding: EdgeInsets.all(infoPadding),
                          child:new Text(
                            '$authorTwitterHandle',
                            style: new TextStyle(
                              color: mainColor,
                              fontSize: textFontSize,
                              fontFamily: defaultFont
                            )
                          )
                        )
                      ]
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
}
