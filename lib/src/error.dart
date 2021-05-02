// Black Unicorn Wallpapers by Alexander Abraham, The Black Unicorn.
// Licensed under the MIT license.

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    String errorMessage = AppLocalizations.of(context).errorLabel;
    return  Scaffold(
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              '$errorMessage',
              style: TextStyle(
                color: accentColor,
                fontSize: textFontSize,
                fontFamily: defaultFont
              ),
            ),
          ]
        ),
        elevation: stdElevation,
        backgroundColor: mainColor,
      ),
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          children: <Widget> [
            new SizedBox(
              height: animationSpacing
            ),
            new Icon(
              Icons.warning,
              color: accentColor,
              size: animationSize,
            ),
            new Text(
              '$errorMessage',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: accentColor,
                fontWeight: FontWeight.bold,
                fontSize: textFontSize,
                fontFamily: defaultFont
              ),
            )
          ]
        )
      )
    );
  }
}
