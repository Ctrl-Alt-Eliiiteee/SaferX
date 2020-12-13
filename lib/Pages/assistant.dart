import 'package:flutter/material.dart';
import 'package:flutter_otp/flutter_otp.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:background_stt/background_stt.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:saferx/home.dart';
import 'package:saferx/main.dart';

String first = '', second = '', third = '';
FlutterOtp otp = FlutterOtp();

class assistant extends StatefulWidget {

  @override
  _assistantState createState() => _assistantState();
}

class _assistantState extends State<assistant> {

  var _service = BackgroundStt();
  var result = "Say something!";
  var confirmation = "";
  var confirmationReply = "";
  var voiceReply = "";
  var isListening = false;

  List<Contact> contacts = [];
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;

  Future<Position> _getCurrentLocation() async{
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    _getCurrentLocation();
    _service.startSpeechListenService;

    setState(() {
      if (mounted) isListening = true;
    });
    _service.getSpeechResults().onData((data) {
      print("getSpeechResults: ${data.result} , ${data.isPartial} [STT Mode]");

      _doOnSpeechCommandMatch(data.result);

      setState(() {
        confirmation = "";
        confirmationReply = "";
        voiceReply = "";
        result = data.result;
      });
    });

    _service.getConfirmationResults().onData((data) {
      print(
          "getConfirmationResults: Confirmation Text: ${data.confirmationIntent} , "
              "User Replied: ${data.confirmedResult} , "
              "Voice Input Message: ${data.voiceInput} , "
              "Is Confirmation Success?: ${data.isSuccess}");

      setState(() {
        confirmation = data.confirmationIntent;
        confirmationReply = data.confirmedResult;
      });
    });
    super.initState();
  }

  void _doOnSpeechCommandMatch(String command) async {
    setState(() {
      _getCurrentLocation();
    });

    if (command.substring(0, 4).toLowerCase() == "call") {
      for (int i = 0; i < contacts.length; i++)
        if (command.substring(5, command.length).toLowerCase() ==
            contacts[i].displayName.toLowerCase()) {
          FlutterPhoneDirectCaller.callNumber(
              contacts[i].phones.elementAt(0).value.toString());
          break;
        }
    }
    else if (command.toLowerCase() == "mute yourself") {
      await _service.speak("", false);
    }
    else if (command.toLowerCase() == "close the app") {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    }
    else if (command.toLowerCase() == "please help me" || command.toLowerCase() == "help me please") {
      otp.sendOtp(
          '${first}',
          'Please Help Me!!!\n\nHere Is My Current Location\n\nGoogle Map Link : https://www.google.com/maps/search/?api=1&query=${_currentPosition
              .latitude},${_currentPosition.longitude}',
          1000,
          6000,
          "+91"
      );
      otp.sendOtp(
          '${second}',
          'Please Help Me!!!\n\nHere Is My Current Location\n\nGoogle Map Link : https://www.google.com/maps/search/?api=1&query=${_currentPosition
              .latitude},${_currentPosition.longitude}',
          1000,
          6000,
          "+91"
      );
      otp.sendOtp(
          '${third}',
          'Please Help Me!!!\n\nHere Is My Current Location\n\nGoogle Map Link : https://www.google.com/maps/search/?api=1&query=${_currentPosition
              .latitude},${_currentPosition.longitude}',
          1000,
          6000,
          "+91"
      );
      main();
    }

    setState(() {
      confirmation = "$command [Confirmation Mode]";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40),
                    child: Container(
                      child: SingleChildScrollView(
                          child: Text('$result\n\n',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      height: 50,
                    ),
                  ),
                  Image.asset('images/voice wave.gif'),
                  IconButton(
                    icon : Icon(Icons.home_outlined),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () {
                      setState(() {
                        a = 0;
                        main();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}