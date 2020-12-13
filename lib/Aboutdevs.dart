import 'package:flutter/material.dart';

class AboutDev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text(
          'About the app',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/img3.jpeg'),
                  )),
                ),
                SizedBox(width: 20),
                Text('SaferX',
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 5)),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Divider(height: 40, color: Colors.grey[800]),
            ),
            Card(
                elevation: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Column(
                    children: [
                      Text(
                        'App info',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.2),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Divider(height: 30, color: Colors.grey[800]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'It is an android mobile application based in flutter which will ensure Women Safety and Security in India. This application will be aimed at provided instant help to women in need and also provide longterm education to women who are not sure how to get rid of risky situations while traveling in any part of India. It is the goal of the developers to help bring a change and contribute to society in any small way possible.',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 40),
            Center(
              child: Text('App Developers',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 5)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Divider(height: 40, color: Colors.grey[800]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/sohamsakaria.jpg'),
                      radius: 60,
                    ),
                    Text('Soham Sakaria',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('images/parthsrivastava.jpeg'),
                      radius: 60,
                    ),
                    Text('Parth Srivastava',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/eeshandutta.jpg'),
                      radius: 60,
                    ),
                    Text('Eeshan Dutta',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/parthpandey.jpg'),
                      radius: 60,
                    ),
                    Text('Parth Pandey',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
