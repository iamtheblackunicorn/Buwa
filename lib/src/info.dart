// Black Unicorn Wallpapers by Alexander Abraham, The Black Unicorn.
// Licensed under the MIT license.

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Info extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    String byMessage = AppLocalizations.of(context).byLabel;
    String licensedMessage = AppLocalizations.of(context).licensedLabel;
    String licenseMessage = AppLocalizations.of(context).licenseLabel;
    String underMessage = AppLocalizations.of(context).underLabel;
    return Padding(
      padding: EdgeInsets.only(
        top:topPadding,
        right: sidePadding,
        left:sidePadding,
        bottom:bottomPadding
      ),
      child: new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(infoRounding)
        ),
        color: mainColor,
        child: new Column(
          children:<Widget> [
            new Stack(
              children: <Widget> [
              new Image.network(
                '$logoUrl',
                height: infoPicSize,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ]
          ),
          new Padding(
            padding: EdgeInsets.all(infoPadding),
            child: new Text(
              '$appTitle v.$appVersion $byMessage\n$appAuthor, $appAuthorPseudo.\n$licensedMessage $appLicense $licenseMessage.',
              style: new TextStyle(
                color: accentColor,
                fontFamily: defaultFont,
                fontSize: infoPadding
              )
            )
          ),
          new RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(infoRounding)
            ),
            color: accentColor,
            padding: EdgeInsets.all(infoPadding),
            child: new Text(
              '$underMessage!',
              style: new TextStyle(
                fontSize: infoPadding,
                fontFamily: defaultFont,
                color: mainColor
              )
            ),
            onPressed: () {
              Navigator.pop(context);
            }
          ),
        ]
      )
    ));
  }
}
