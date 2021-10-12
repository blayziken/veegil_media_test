import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veegil_media_test/utils/margins.dart';

class TransactionDetails extends StatelessWidget {
  final String date;
  final String amount;
  // final String phoneNumber;
  final String title;
  final String description;
  final Color color;

  const TransactionDetails({
    Key? key,
    required this.date,
    required this.amount,
    // required this.phoneNumber,
    required this.title,
    required this.color,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          "Transaction Detail",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Center(
                child: Text(
                  date, // 'Date',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            yMargin30,
            Expanded(
              flex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Amount',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    amount, //'N50.00',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: color),
                  ),
                  Divider(thickness: 1, color: Colors.black),
                  yMargin20,
                  Text(
                    'To',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    title, //'AIRTTEL',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                  ),
                  Divider(thickness: 1, color: Colors.black),
                  yMargin20,
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    description.toUpperCase(), //'AIRTTEL -237372828',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: color),
                  ),
                  Divider(thickness: 1, color: Colors.black),
                  yMargin20,
                  Text(
                    'Fees',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'N0.00',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                  ),
                  Divider(thickness: 1, color: Colors.black),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 0,
              child: InkWell(
                child: Container(
                  height: media.height * 0.058,
                  width: media.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
            yMargin30,
          ],
        ),
      ),
    );
  }
}
