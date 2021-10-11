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
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.white24,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline_sharp,
                    size: 70,
                    color: Colors.green,
                  ),
                  yMargin40,
                  Text(
                    'Success',
                    style: TextStyle(fontSize: 60, color: Colors.green, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
