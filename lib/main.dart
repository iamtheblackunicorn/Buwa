import 'src/dataHandler.dart';
import 'src/titleScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BUWA',
      home: Home(apiStorage: APIStorage()),
    )
  );
}
