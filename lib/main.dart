import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'Pages/assistant.dart';

Future main() async {
  RenderErrorBox.backgroundColor = Colors.white;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.white);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getString('saferX_email');
  first = prefs.getString('first_number');
  second = prefs.getString('second_number');
  third = prefs.getString('third_number');
  if(status!=null){
    email=status.toString();
  }
  final systemTheme = SystemUiOverlayStyle.light.copyWith(
    systemNavigationBarColor: Colors.purple,
    systemNavigationBarIconBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(systemTheme);
  runApp(MyApp(status: status));
}

class MyApp extends StatelessWidget {

  var status;
  MyApp({this.status});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: status == null ? Authentication() : nav_bar(),
    );
  }
}
