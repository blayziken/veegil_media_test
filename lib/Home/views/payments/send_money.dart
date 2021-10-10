import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veegil_media_test/utils/margins.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Send Money",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Amount",
              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),
            ),
            yMargin5,
            _buildAmountField(),
            yMargin15,
            Text(
              "Bank",
              style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),
            ),
            yMargin5,
            _buildAmountField(),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    return Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
            // controller: _nameController,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'N0.00',
              labelStyle: TextStyle(
                color: Colors.white24,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Input an amount';
              }

              return null;
            },
            onSaved: (value) {
              // _name = value!;
            },
          ),
        ),
      ),
    );
  }
}
