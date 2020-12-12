import 'package:flutter/material.dart';
import 'package:saferx/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child: Text('Profile'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                color: Colors.purple,
                child: Text('LogOut'),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.remove('seferX_email');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Authentication()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
