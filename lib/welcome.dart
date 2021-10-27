import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:veegil_media_test/utils/margins.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: media.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/building.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.5, sigmaY: 3.5),
          child: Column(
            children: <Widget>[
              Spacer(flex: 1),
              Expanded(
                flex: 1,
                child: Text(
                  'Veegil Bank',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w900,
                      fontSize: media.height * 0.080),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        width: media.height * 0.380,
                        height: media.height * 0.080,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: media.height * 0.030,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(context, '/login'),
                    ),
                    SizedBox(height: media.height * 0.030),
                    InkWell(
                      child: Container(
                        width: media.height * 0.380,
                        height: media.height * 0.080,
                        decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            'Signup',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: media.height * 0.030,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(context, '/sign-up'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
