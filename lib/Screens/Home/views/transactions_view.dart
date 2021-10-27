import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaction History",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        // color: Colors.teal,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
              left: media.height * 0.020,
              right: media.height * 0.020,
              top: media.height * 0.040),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HistoryTile(
                title: "Deposit History",
                desc: "All deposit history",
                onTap: () => Navigator.pushNamed(context, '/deposit-history'),
              ),
              // yMargin30,
              SizedBox(height: media.height * 0.030),
              HistoryTile(
                title: "Withdrawal History",
                desc: "All deposit history",
                onTap: () =>
                    Navigator.pushNamed(context, '/withdrawal-history'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryTile extends StatelessWidget {
  final String title;
  final String desc;
  final VoidCallback onTap;

  const HistoryTile({
    required this.title,
    required this.desc,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Expanded(
      flex: 0,
      child: InkWell(
        child: Container(
          height: media.height * 0.070,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.8,
                blurRadius: 4,
                offset: Offset(3, 4),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: media.height * 0.015),
            child: Row(
              children: [
                Icon(Icons.table_rows_rounded,
                    size: media.height * 0.035, color: Colors.purple),
                SizedBox(width: media.height * 0.015),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: media.height * 0.025,
                          fontWeight: FontWeight.w900),
                    ),
                    // yMargin5,
                    Text(
                      desc,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: media.height * 0.018,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.purple, size: media.height * 0.025),
              ],
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
