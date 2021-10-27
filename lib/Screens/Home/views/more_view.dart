import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "More",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(),
    );
  }
}
