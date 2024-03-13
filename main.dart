import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/currency_converter_coupertino_page.dart';
import 'package:flutter_catalog/currency_converter_material_page.dart';
import 'package:flutter_catalog/example.dart';
import 'package:flutter_catalog/fd_calculator_app.dart';

void main() {
  runApp(const MyFDApp());

  // Types of Widgets:- StatelessWidget, StatefullWidget and InheritedWidget
  // StatelessWidget is immutable, once widget is created, it can't be changed
}

// 2 types of design:
// 1. Material design by Google
// 2. Cupertino design by Apple

// 1st app using material design
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // no need to write required in case of super

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            CurrencyConverterMaterialPage()); // if we don't give direction, text will be at center
    // a widget tree is created
  }
}

// same app with cupertino design
class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyConverterCoupertinoPage(),
    );
  }
}


// 2nd app (fd calculator)
class MyFDApp extends StatelessWidget {
  const MyFDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FDCalculatorMaterialPage(),
    );
  }
}
