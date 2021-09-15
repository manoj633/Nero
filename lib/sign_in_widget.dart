import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:water_ui/google_sign_in.dart';

class SignupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
                child: Stack(children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      FlutterLogo(size: 120),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hey There,\nWelcome Back',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login to your Account to continue',
                            style: TextStyle(fontSize: 16),
                          )),
                      Spacer(),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
                          },
                          label: Text('Sign Up with Google')),
                      SizedBox(height: 40),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an Account?',
                          children: [
                            TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                    decoration: TextDecoration.underline))
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ))
            ]))));
  }
}
