// @dart=2.9
// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rastreio/my_app.dart';
import 'package:rastreio/repositories/order_repository.dart';

 void main(List<String> args) {
  runApp
  (
    ChangeNotifierProvider
    (
      create: (context) => OrderRepository(),
      child: MyApp(),
    )
  );
}