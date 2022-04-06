// ignore_for_file: prefer_const_constructors
// --no-sound-null-safety
import 'package:flutter/material.dart';
import 'package:rastreio/pages/details/details_page.dart';
import 'package:rastreio/pages/main/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      title: 'titulo',
      home: MainPage(),
    );
  }
}