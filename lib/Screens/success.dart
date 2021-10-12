import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:veegil_media_test/utils/margins.dart';

class Success extends StatefulWidget {
  static const routeName = '/success';

  final String text;

  const Success({Key? key, this.text = ''}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
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
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline_sharp,
                        size: 80,
                        color: Colors.green,
                      ),
                      yMargin100,
                      Text(
                        '${widget.text} was',
                        style: TextStyle(fontSize: 35, color: Colors.green, fontWeight: FontWeight.w900),
                      ),
                      yMargin5,
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
