import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_ui/signinSecond.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 30,
                    offset: Offset(0, 20))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xffA4BB35),
                ),
                hintText: 'Type your Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget enterBtn() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 100),
          width: 120,
          child: ElevatedButton.icon(
            onPressed: () {
              _navigateToNextScreen(context);
            },
            icon: Icon(Icons.login, color: Colors.white),
            label: Text('Enter',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                primary: Color(0xFFA4bb35),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0))),
          ),
        ));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SigninsecondsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              child: Stack(children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF23B4C7),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 250,
                          height: 250,
                          alignment: Alignment.centerLeft,
                          child: Image.asset('asset/images/watericon.jpeg')),
                      Text(
                        'Neró',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Water level monitoring app',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      buildEmail(),
                      enterBtn(),
                    ],
                  ),
                ))
          ]))),
    );
  }
}
