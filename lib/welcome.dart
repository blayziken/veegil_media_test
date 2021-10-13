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
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Column(
            children: <Widget>[
              Spacer(flex: 1),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text('Veegil Bank', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w900, fontSize: 60)),
                    yMargin20,
                    Icon(Icons.attach_money_sharp, size: 50, color: Colors.purple),
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
                            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(context, '/login'),
                    ),
                    SizedBox(height: 30.0),
                    InkWell(
                      child: Container(
                        width: 280.0,
                        height: 60.0,
                        decoration: BoxDecoration(color: Colors.red[800], borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            'Signup',
                            style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w900),
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
