import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:veegil_media_test/utils/margins.dart';

class Success extends StatelessWidget {
  static const routeName = '/success';

  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            height: media.height,
            width: double.infinity,
            child: Column(
              children: [
                // Spacer(),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline_sharp,
                        size: 80,
                        color: Colors.green,
                      ),
                      yMargin40,
                      Text(
                        'Success',
                        style: TextStyle(fontSize: 80, color: Colors.green, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: InkWell(
                    child: Container(
                      height: media.height * 0.04,
                      width: media.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Close',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    onTap: () => Navigator.pushReplacementNamed(context, '/home'),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
