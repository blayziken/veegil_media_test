import 'package:flutter/material.dart';

showDialogWidget(context, text) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'An error occured!',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Colors.purple,
        ),
      ),
      content: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        InkWell(
          child: Container(
            height: 30,
            width: 60,
            child: Center(
              child: Text(
                'Ok',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.red,
                ),
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
