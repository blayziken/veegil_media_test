import 'package:flutter/material.dart';

showDialogWidget(context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('An error occured!'),
      content: Text('Something went wrong.'),
      actions: <Widget>[
        InkWell(
          child: Container(
            height: 30,
            width: 60,
            child: Text(
              'Okay',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    ),
  );
}
