import 'package:flutter/material.dart';
import 'authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getString('saferX_email');
  if(status!=null){
    email=status.toString();
  }
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
