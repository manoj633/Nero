import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_ui/waveWidget.dart';

class SigninsecondsScreen extends StatefulWidget {
  @override
  _SigninsecondScreenState createState() => _SigninsecondScreenState();
}

class _SigninsecondScreenState extends State<SigninsecondsScreen> {
  bool passwordvisible = false;
  bool isRememberMe = false;

  Widget buildpswd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            obscureText: !passwordvisible,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: true,
                fillColor: Colors.white.withOpacity(0.5),
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      passwordvisible = true;
                    });
                  },
                  onLongPressUp: () {
                    setState(() {
                      passwordvisible = false;
                    });
                  },
                  child: Icon(
                      passwordvisible ? Icons.visibility : Icons.visibility_off,
                      color: Color(0xff5ac18e)),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff23B4C7),
                ),
                hintText: 'Type your password',
                hintStyle: TextStyle(color: Colors.black38)),
            validator: (String? value) {
              if (value!.length < 6) {
                return "password is too short!";
              }
              if (value.isEmpty) {
                return "Password needed";
              }
            },
            onSaved: (value) {
              print(true);
            },
          ),
        )
      ],
    );
  }

  Widget buildRememberCb() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (bool? value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                },
              )),
          Text(
            'Remember Me',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          new Spacer(),
          TextButton(
              onPressed: () => print("Forgot password pressed"),
              child: Text(
                'Forgot password?',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ))
        ],
      ),
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
                primary: Color(0xFF23B4C7),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0))),
          ),
        ));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WaveDemoApp()));
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
                  color: Color(0xFFA8BD3B),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.centerLeft,
                          child: Image.asset('asset/images/lock.jpg')),
                      Text(
                        ' Enter your \n password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 60),
                      buildpswd(),
                      buildRememberCb(),
                      enterBtn(),
                    ],
                  ),
                ))
          ]))),
    );
  }
}
