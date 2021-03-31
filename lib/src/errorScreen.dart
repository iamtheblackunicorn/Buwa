import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
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
            new Icon(
              Icons.warning,
              color: Color(0xFF6600FF),
              size: 150,
            ),
            new Text(
              'Error!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6600FF),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )
          ]
        )
      )
    );
  }
}
