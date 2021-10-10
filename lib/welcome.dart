import 'package:flutter/material.dart';

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
        color: Colors.red,
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(
              flex: 1,
            ),
            const Expanded(
              child: Text(
                'Veegil Bank',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: 280.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 21.0,
                  ),
                  InkWell(
                    child: Container(
                      width: 280.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.red[800],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Signup',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signup(),
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
