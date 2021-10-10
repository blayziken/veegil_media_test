import 'package:flutter/material.dart';
import 'package:veegil_media_test/utils/margins.dart';

import 'auth/login.dart';
import 'auth/signup.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/reddish-ui';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: media.height,
        width: double.infinity,
        color: Colors.red,
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Veegil Bank',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60.0),
                  ),
                  yMargin20,
                  Icon(Icons.attach_money_sharp, size: 100, color: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: 280.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  InkWell(
                    child: Container(
                      width: 280.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.red[800],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signup(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
