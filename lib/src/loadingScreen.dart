// Black Unicorn Wallpapers by Alexander Abraham, The Black Unicorn.
// Licensed under the MIT license.

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    String loadingMessage = AppLocalizations.of(context).loadingLabel;
    return  Scaffold(
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              '$loadingMessage',
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
            new LoadingBouncingGrid.square(
              size: animationSize,
              backgroundColor: accentColor,
            )
          ]
        )
      )
    );
  }
}
