import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Center(
        child: Column(
          children: <Widget> [
            new SizedBox(
              height: 250
            ),
            new LoadingBouncingGrid.square(
              size: 150,
              backgroundColor: Color(0xFF6600FF),
            )
          ]
        )
      )
    );
  }
}
